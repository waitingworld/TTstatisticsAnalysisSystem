define(['app', 'baseService','baseDirective','bootstrap','bootstrap-table-zh-CN'], function (webapp) {//主控制器2
    webapp.controller('firstController', function ($scope, baseService,$timeout) {
        console.log("firstController");
        $scope.model={};
        $scope.examination_names=["2018年国考行测","2016年国考行测","2017年国考行测"];
        $scope.$watch("examination_names",function () {
            if($scope.examination_names.length>0){
                $scope.model.examination_name = $scope.examination_names[0];
            }
        })
    });
});