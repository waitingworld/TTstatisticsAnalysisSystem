define(['app', 'angular', 'baseService', 'echarts'], function (webapp, angular, baseService, echarts) {//angular指令js
    webapp.directive("graphBar", function ($timeout) {
        return {
            restrict: 'E',
            replace: true,
            scope: {
                data: '@'
            },
            template: '<div style="width: 900px;height: 400px"></div>',
            link: function (scope) {
                scope.$watch("data", function (data) {
                    console.log('graphBar running');
                    debugger
                    if (data == "{}" || angular.isObject(data)) {
                        return;
                    }
                    scope.data = eval('(' + data + ')');
                    var dom = document.getElementById("graphBar");
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