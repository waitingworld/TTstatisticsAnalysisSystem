define(['app', 'angular', 'baseService', 'echarts'], function (webapp, angular, baseService, echarts) {//angular指令js
    webapp.directive("graphBar", function ($timeout) {
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
                    debugger
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
                        debugger
                        myChart.resize();
                    };
                });

            }
        };
    });
});