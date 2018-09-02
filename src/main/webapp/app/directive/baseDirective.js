define(['app', 'angular', 'baseService', 'echarts'], function (webapp, angular, baseService, echarts) {//angular指令js
    webapp.directive("lineBar", function ($timeout) {
        return {
            restrict: 'E',
            replace: true,
            scope: {
                data: '@',
                type_id: '@'
            },
            template: '<div style="width: 900px;height: 400px"></div>',
            link: function (scope) {
                scope.data = eval('(' + scope.data + ')');
                console.log('lineBar running');
                var dom = document.getElementById("lineBar");
                var myChart = echarts.init(dom);
                var option = scope.data;
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            }
        };
    });
});