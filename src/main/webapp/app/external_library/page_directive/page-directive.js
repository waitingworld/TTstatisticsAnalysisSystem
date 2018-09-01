define(['angular','app','bootstrap'], function (angular,app) {
    app.directive('pageDirective', ['$rootScope',function ($rootScope) {
        return {
            restrict: 'E',
            templateUrl: 'app/external_library/page_directive/pagination.html',
            replace: true,
            scope: {
                conf: '='
            },
            link: function (scope, element, attrs) {
                scope.page = {};
                scope.init = function () {
                    console.log("初始化分页控件");
                    // 初始化一页展示多少条  默认为10
                    scope.conf.pageLimit = [10, 15, 20, 30, 50];
                    if (!scope.conf.itemPageLimit) {
                        scope.conf.itemPageLimit = scope.conf.pageLimit[0];
                    } else {
                        // 把自定义的条目加入到pagelimit中
                        if (scope.conf.pageLimit.indexOf(scope.conf.itemPageLimit)) {
                            scope.conf.pageLimit.push(scope.conf.itemPageLimit);
                            scope.conf.pageLimit = scope.conf.pageLimit.sort(function (a, b) {
                                return a - b;
                            });
                        }
                    }
                    //一共多少页
                    scope.page.limit = Math.floor(scope.conf.total / scope.conf.itemPageLimit);
                }
                // 上一页
                scope.prevPage = function () {
                    console.log("上一页");
                    if (scope.conf.currentPage <= 1) return;
                    scope.conf.currentPage -= 1;
                }
                // 下一页
                scope.nextPage = function () {
                    console.log("下一页");
                    if (scope.conf.currentPage >= scope.page.limit) return;
                    scope.conf.currentPage += 1;
                }
                // 改变一页显示条目
                scope.selectPage = function () {
                    console.log("改变一页显示条数");
                    scope.conf.currentPage = 1;
                    scope.page.limit = Math.floor(scope.conf.total / scope.conf.itemPageLimit);
                }
                // 跳转页
                scope.linkPage = function () {
                    console.log("跳转页");
                }
                scope.$watch("conf.total", function (newVal) {
                    if (angular.isUndefined(newVal)) {
                        scope.conf.total = 0;
                        scope.conf.currentPage = 1;
                    } else {
                        scope.init();
                    }
                });
            }
        }
    }]);
});


