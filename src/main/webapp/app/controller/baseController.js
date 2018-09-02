define(['app', 'angular', 'baseService', 'baseDirective', 'pageDirective', 'jquery', 'uiBootstrap', 'datetimepicker.zh-CN'], function (webapp) {//主控制器
    webapp.controller('baseController', function ($scope, baseService, $interval, $uibModal) {
        console.log("baseController");
        $scope.data = {
            xAxis: {
                type: 'category',
                data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data: [820, 932, 901, 934, 1290, 1330, 1320],
                type: 'line'
            }]
        };
        var params = {
            level: 1
        };
        var promise = baseService.getNextTypes(params);
        promise.then(function (data) {
            if (data.success) {
                $scope.types = data.types;
            }
        });
        $scope.addNewData = function () {
            var ModalInstanceCtrl = function ($scope, $uibModalInstance) {
                $scope.model = {};
                // $('#finish_data').datetimepicker();//todo
                $scope.chooseType = function (type) {
                    for (var index = type.level + 1; index <= $scope.maxLevel; index++) {
                        $scope["types_" + index] = [];
                        if (angular.isDefined($scope.model)) {
                            $scope.model["type" + index + "_id"] = undefined;
                        }
                    }
                    $scope.model["type" + type.level + "_id"] = type.id;
                    $scope.model["type_id"] = type.id;
                    $('.buttonText' + type.level).text(type.name);
                    $scope.getNextTypes(type.level);
                }
                $scope.init = function () {
                    var promise = baseService.getMaxTypeLevel({});
                    promise.then(function (data) {
                        if (data.success) {
                            $scope.maxLevel = data.maxLevel;
                            for (var index = 1; index <= $scope.maxLevel; index++) {
                                $scope["types_" + index] = [];
                            }
                        }
                        if ($scope.maxLevel > 0) {
                            var params = {
                                level: 1
                            };
                            var promise = baseService.getNextTypes(params);
                            promise.then(function (data) {
                                if (data.success) {
                                    $scope.types_1 = data.types;
                                }
                            });
                        }
                    });
                }
                $scope.getNextTypes = function (currentLevel) {
                    var level = currentLevel + 1;
                    console.log("getNextTypes===parent_id>>>" + $scope.model["type" + currentLevel + "_id"]
                        + "===currentLevel>>>" + currentLevel);
                    var params = {
                        parent_id: $scope.model["type" + currentLevel + "_id"],
                        level: level
                    };
                    var promise = baseService.getNextTypes(params);
                    promise.then(function (data) {
                        if (data.success) {
                            $scope["types_" + level] = data.types;
                        }
                    });
                };
                $scope.ok = function () {
                    if (angular.isDefined($scope.model.type_id)
                        && angular.isDefined($scope.model.right_number)
                        && angular.isDefined($scope.model.total_number)) {
                        $uibModalInstance.close($scope.model);
                    } else {
                        //todo
                    }
                };
                $scope.cancel = function () {
                    $uibModalInstance.dismiss('cancel');
                };
            };
            var ModalDemoCtrl = function ($scope, $uibModal) {
                $scope.open = function () {
                    var modalInstance = $uibModal.open({
                        templateUrl: './app/pages/addNewDataPage.html',
                        controller: ModalInstanceCtrl,
                        resolve: {
                            // items: function () {
                            //     return $scope.items;
                            // }
                        }
                    });
                    modalInstance.opened.then(function () {//模态窗口打开之后执行的函数
                        console.log('modal is opened');
                    });
                    modalInstance.result.then(function (result) {
                        console.log(result);
                        var promise = baseService.addNewData(result);
                        promise.then(function (value) {

                        });
                    }, function (reason) {
                        console.log(reason);//点击空白区域，总会输出backdrop click，点击取消，则会cancel
                    });
                };
                $scope.open();
            };
            ModalDemoCtrl($scope, $uibModal);
        };
    });
});