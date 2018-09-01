/**
 * main.js这个文件完成的事情简单来说就是：载入所有文件，然后在document上运行Angular并将ng-app属性设置为’app’。
 * 这些文件因为是由RequireJS异步载入，因此我们需要来“手动启动”Angular应用。
 * */
requirejs.config({
    // baseUrl: "/",
    paths: {
        //库文件
        "angular": "./external_library/angular/angular",
        "angularAMD": "./external_library/angular/angularAMD",
        "ngLoad": "./external_library/angular/ng-load",
        "ngRouter": "./external_library/angular/angular-route",
        "uiRouter": "./external_library/angular/angular-ui-router",
        "domReady": "./external_library/require/domReady",
        "jquery": "./external_library/jquery/jquery-3.3.1",
        "bootstrap": "./external_library/bootstrap/bootstrap.min",
        "bootstrap-css": "./external_library/bootstrap/bootstrap",
        "base-css": "./css/baseCss",
        "bootstrap-theme": "./external_library/bootstrap/bootstrap-theme",
        "math": "./external_library/math/Math.uuid",
        //自己的JavaScript文件
        "baseController": "./controller/baseController",
        "firstController": "./controller/firstController",
        "secondController": "./controller/secondController",
        "baseDirective": "./directive/baseDirective",
        "pageDirective": "./external_library/page_directive/page-directive",
        "app": "./app",
        "baseService": "./service/baseService"
    },
    map: {
        '*': {
            'css': './external_library/require/require-css'
        }
    },
    shim: {
        'angular': {
            deps: ['jquery'],
            exports: 'angular'
        },
        'bootstrap': {
            deps: ['jquery', 'css!./bootstrap-theme', 'css!./bootstrap-css']
        },
        'uiRouter': {
            deps: ['angular'],
            exports: 'angular-route'
        },
        'angularAMD': ['angular', 'uiRouter'],
        'ngLoad': {
            deps: ["angularAMD"],
            experts: "ngLoad"
        }
    },
    deps: ['app','css!base-css'],//首先启动初始化的JavaScript，用来手动启动angularjs应用
    urlArgs: "v=" + (new Date()).getTime()//防止读取缓存，调试用
});