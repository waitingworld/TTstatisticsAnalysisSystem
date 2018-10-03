define(['app', 'angular', 'baseService', 'baseDirective', 'pageDirective', 'jquery', 'uiBootstrap', 'bootstrapTable'],
    function (webapp) {//主控制器
        webapp
            .controller('baseController', function ($scope, baseService, $interval, $uibModal) {
                debugger
                console.log("baseController");
                $scope.data = {};
                $scope.getTypeMap = function () {
                    var params = {};
                    var promise = baseService.getTypeMap(params);
                    promise.then(function (data) {
                        if (data.success) {
                            $scope.data = data.options;
                        }
                    });
                }
                $scope.getTypeMap();
                $scope.addNewData = function () {
                    var ModalDemoCtrl = function ($scope, $uibModal) {
                        $scope.open = function () {
                            var modalInstance = $uibModal.open({
                                templateUrl: './app/pages/addNewDataPage.html',
                                controller: "addNewDataPageCtrl",
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
                                    if (value.success) {//刷新关系图
                                        $scope.getTypeMap();
                                    } else {
                                        //todo 失败提示用户
                                    }
                                });
                            }, function (reason) {
                                console.log(reason);//点击空白区域，总会输出backdrop click，点击取消，则会cancel
                            });
                        };
                        $scope.open();
                    };
                    ModalDemoCtrl($scope, $uibModal);
                };
            })
            .controller('showLineBarCtrl', function ($scope, $uibModalInstance, baseService, typeId) {
                $scope.line_bar_data = {};
                var param = {
                    typeId: typeId
                };
                var promise = baseService.getLineBarOptions(param);
                promise.then(function (data) {
                    if (data.success) {
                        $scope.line_bar_data = data.options;
                        $scope.currentType = data.options.currentType;
                    }
                });

                $scope.ok = function () {
                    debugger
                    $uibModalInstance.close();
                };
                $scope.cancel = function () {
                    debugger
                    $uibModalInstance.dismiss('cancel');
                };
            })
            .controller('addNewDataPageCtrl', function ($scope, baseService, $interval, $uibModalInstance, $timeout) {
                $scope.model = {};
                $scope.years = [];//年份数据
                var initDate = new Date();
                for (var index = initDate.getFullYear() - 20; index <= initDate.getFullYear(); index++) {
                    $scope.years.push(index);
                }
                $scope.areas = [
                    {
                        "ProID": 999,
                        "name": "专项训练",
                        "ProSort": -1,
                        "ProRemark": "专项训练"
                    },
                    {
                        "ProID": 0,
                        "name": "全国",
                        "ProSort": 0,
                        "ProRemark": "全国"
                    }, {
                        "ProID": 1,
                        "name": "北京市",
                        "ProSort": 1,
                        "ProRemark": "直辖市"
                    }, {
                        "ProID": 2,
                        "name": "天津市",
                        "ProSort": 2,
                        "ProRemark": "直辖市"
                    }, {
                        "ProID": 3,
                        "name": "河北省",
                        "ProSort": 5,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 4,
                        "name": "山西省",
                        "ProSort": 6,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 5,
                        "name": "内蒙古自治区",
                        "ProSort": 32,
                        "ProRemark": "自治区"
                    }, {
                        "ProID": 6,
                        "name": "辽宁省",
                        "ProSort": 8,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 7,
                        "name": "吉林省",
                        "ProSort": 9,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 8,
                        "name": "黑龙江省",
                        "ProSort": 10,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 9,
                        "name": "上海市",
                        "ProSort": 3,
                        "ProRemark": "直辖市"
                    }, {
                        "ProID": 10,
                        "name": "江苏省",
                        "ProSort": 11,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 11,
                        "name": "浙江省",
                        "ProSort": 12,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 12,
                        "name": "安徽省",
                        "ProSort": 13,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 13,
                        "name": "福建省",
                        "ProSort": 14,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 14,
                        "name": "江西省",
                        "ProSort": 15,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 15,
                        "name": "山东省",
                        "ProSort": 16,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 16,
                        "name": "河南省",
                        "ProSort": 17,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 17,
                        "name": "湖北省",
                        "ProSort": 18,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 18,
                        "name": "湖南省",
                        "ProSort": 19,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 19,
                        "name": "广东省",
                        "ProSort": 20,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 20,
                        "name": "海南省",
                        "ProSort": 24,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 21,
                        "name": "广西壮族自治区",
                        "ProSort": 28,
                        "ProRemark": "自治区"
                    }, {
                        "ProID": 22,
                        "name": "甘肃省",
                        "ProSort": 21,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 23,
                        "name": "陕西省",
                        "ProSort": 27,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 24,
                        "name": "新 疆维吾尔自治区",
                        "ProSort": 31,
                        "ProRemark": "自治区"
                    }, {
                        "ProID": 25,
                        "name": "青海省",
                        "ProSort": 26,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 26,
                        "name": "宁夏回族自治区",
                        "ProSort": 30,
                        "ProRemark": "自治区"
                    }, {
                        "ProID": 27,
                        "name": "重庆市",
                        "ProSort": 4,
                        "ProRemark": "直辖市"
                    }, {
                        "ProID": 28,
                        "name": "四川省",
                        "ProSort": 22,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 29,
                        "name": "贵州省",
                        "ProSort": 23,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 30,
                        "name": "云南省",
                        "ProSort": 25,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 31,
                        "name": "西藏自治区",
                        "ProSort": 29,
                        "ProRemark": "自治区"
                    }, {
                        "ProID": 32,
                        "name": "台湾省",
                        "ProSort": 7,
                        "ProRemark": "省份"
                    }, {
                        "ProID": 33,
                        "name": "澳门特别行政区",
                        "ProSort": 33,
                        "ProRemark": "特别行政区"
                    }, {
                        "ProID": 34,
                        "name": "香港特别行政区",
                        "ProSort": 34,
                        "ProRemark": "特别行政区"
                    }
                ];//省份数据

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
                        if ($scope.model.area == "专项训练") {
                            $scope.model.year = "";
                            $scope.model.examine_type = "";
                        }
                        $scope.model.examination_name = $scope.model.year + "年" + $scope.model.area + $scope.model.examine_type;
                        $uibModalInstance.close($scope.model);
                    } else {
                        //todo
                    }
                };
                $scope.cancel = function () {
                    $uibModalInstance.dismiss('cancel');
                };

                $timeout(function () {//设置默认
                    $scope.model.year = "2017";
                    $scope.model.area = "江苏省";
                    $scope.model.examine_type = "行测";
                    $scope.$apply();
                });
            });
    });