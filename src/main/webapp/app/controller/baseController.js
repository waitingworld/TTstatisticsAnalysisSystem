define(['app', 'angular', 'baseService', 'baseDirective', 'pageDirective', 'jquery'], function (webapp) {//主控制器
    webapp.controller('baseController', function ($scope, baseService,$interval) {
        console.log("baseController");
        $scope.paginationConf = {
            currentPage: 1,
            itemPageLimit: 5
        };
        $scope.getAllCityDate = function () {
            var postDate = {
                currentPage: $scope.paginationConf.currentPage,
                pageSize: $scope.paginationConf.itemPageLimit
            };
            var promise = baseService.selectAllCity(postDate);
            promise.then(function (data) {
                $scope.citys = data.data;
                $scope.paginationConf.total = data.total;
            });
        }
        $scope.$watch("paginationConf.currentPage + paginationConf.itemPageLimit", $scope.getAllCityDate);

        $scope.drawCanvas = function ($event) {
            var canvas = $event.target;
            var ctx = canvas.getContext('2d');//获取对象
            ctx.fillStyle = '#f00';//设置颜色
            ctx.fillText("绘制字符串", 10, 10);//绘制字符串
            ctx.translate(30, 200);//坐标系平移
            for (var i = 0; i < 50; i++) {
                ctx.translate(50, 50);
                ctx.scale(0.93, 0.93);
                ctx.rotate(-Math.PI / 10);
                ctx.fillRect(30, 40, 80, 100);//绘制矩形
            }
        }
    });
});