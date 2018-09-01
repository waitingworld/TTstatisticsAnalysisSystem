//创建Angularjs应用模块。
define(["angular", "angularAMD", "uiRouter"], function (angular, angularAMD) {
    var registerRoutes = function ($stateProvider, $urlRouterProvider) {
        var baseControllerURL = './controller/';
        var basePagesURL = './app/pages/';
        $urlRouterProvider.otherwise("/home");
        $stateProvider.state('home', angularAMD.route({
            url: '/home',
            templateUrl: basePagesURL + 'home.html',
            controllerUrl: baseControllerURL + 'baseController'
        })).state('firstPage', angularAMD.route({
            url: '/firstPage',
            templateUrl: basePagesURL + 'firstPage.html',
            controllerUrl: baseControllerURL + 'firstController'
        })).state('secondPage', angularAMD.route({
            url: '/secondPage',
            templateUrl: basePagesURL + 'secondPage.html',
            controllerUrl: baseControllerURL + 'secondController'
        }));
    };
    var app = angular.module("app", ["ui.router"]);
    app.config(["$stateProvider", "$urlRouterProvider", registerRoutes]);
    return angularAMD.bootstrap(app);
});