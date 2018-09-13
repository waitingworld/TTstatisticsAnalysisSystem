define(['app', 'baseService', 'baseDirective', 'bootstrap', 'bootstrap-table-zh-CN'], function (webapp) {//主控制器2
    webapp.controller('firstController', function ($scope, baseService, $timeout) {
        console.log("firstController");
        $scope.model = {};
        $scope.examination_names = [];
        $scope.tableInfo = [];
        $scope.$watch("examination_names", function () {
            if ($scope.examination_names.length > 0) {
                $scope.model.examination_name = $scope.examination_names[0];
            }
        });
        $scope.$watch("model.examination_name", function (examination_name) {
            var params = {
                examination_name: examination_name
            };
            if (angular.isDefined(examination_name) && examination_name != "" && examination_name != "null") {
                var promise = baseService.getAnalyzeData(params);
                promise.then(function (data) {
                    if (data.success) {
                        debugger
                        $scope.tableInfo = data.analyzeResult.tableInfo;
                        $scope.suggest = data.analyzeResult.suggest;
                    }
                });
            }

        });
        $scope.init = function () {
            var params = {};
            var promise = baseService.getAllExaminationName(params);
            promise.then(function (data) {
                if (data.success) {
                    $scope.examination_names = data.names;
                }
            });
        }
        $scope.init();
    });
});