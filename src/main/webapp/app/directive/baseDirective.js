define(['app', 'angular', 'baseService', 'echarts'], function (webapp, angular, baseService, echarts) {//angular指令js
    webapp.directive("graphBar", function ($timeout, $uibModal) {
        return {
            restrict: 'E',
            replace: true,
            scope: {
                data: '@'
            },
            template: '<div></div>',
            link: function (scope) {
                scope.$watch("data", function (data) {
                    console.log('graphBar running');
                    if (data == "{}" || angular.isObject(data)) {
                        return;
                    }
                    scope.data = eval('(' + data + ')');
                    var dom = document.getElementById("graphBar");
                    dom.style.width = (window.innerWidth - 50) + 'px';
                    dom.style.height = (window.innerHeight - 150) + 'px';
                    var myChart = echarts.init(dom);
                    var option = scope.data;
                    if (option && typeof option === "object") {
                        myChart.setOption(option, true);
                    }
                    //用于使chart自适应高度和宽度
                    window.onresize = function () {
                        //重置容器高宽
                        dom.style.width = (window.innerWidth - 50) + 'px';
                        dom.style.height = (window.innerHeight - 150) + 'px';
                        myChart.resize();
                    };
                    myChart.on('click', function (params) {
                        // 控制台打印数据的名称
                        console.log(params);
                        var modalInstance = $uibModal.open({
                            templateUrl: './app/pages/lineBar.html',
                            controller: "showLineBarCtrl",
                            size:"lg",
                            resolve: {
                                typeId: function () {
                                    return params.data.id;
                                }
                            }
                        });
                        modalInstance.opened.then(function (value) {
                        });
                        modalInstance.result.then(function (result) {
                        });
                    });
                });

            }
        };
    });
    webapp.directive("lineBar", function ($timeout, $uibModal) {
        return {
            restrict: 'E',
            replace: true,
            scope: {
                data: '@'
            },
            template: '<div style="width: 800px;height: 400px"></div>',
            link: function (scope) {
                scope.$watch("data", function (data) {
                    console.log('lineBar running');
                    if (data == "{}" || angular.isObject(data)) {
                        return;
                    }
                    scope.data = eval('(' + data + ')');
                    var dom = document.getElementById("line_bar");
                    var myChart = echarts.init(dom);
                    var option = scope.data;
                    if (option && typeof option === "object") {
                        myChart.setOption(option, true);
                    }
                });

            }
        };
    });
});