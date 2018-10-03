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
        "toastr": "./external_library/toastr/toastr.min",
        "toastr-css": "./external_library/toastr/toastr.min",
        "bootstrap": "./external_library/bootstrap/bootstrap.min",
        "echarts": "./external_library/echarts/echarts",
        "bootstrap-css": "./external_library/bootstrap/bootstrap",
        "uiBootstrap": "./external_library/bootstrap/ui-bootstrap-tpls",
        "datetimepicker": "./external_library/bootstrap/bootstrap-datetimepicker",
        "datetimepicker.zh-CN": "./external_library/bootstrap/locales/bootstrap-datetimepicker.zh-CN",
        "datetimepicker-css": "./external_library/bootstrap/bootstrap-datetimepicker",
        "base-css": "./css/baseCss",
        "bootstrap-table-css": "./external_library/bootstrap/bootstrap-table",
        "bootstrapTable": "./external_library/bootstrap/bootstrap-table",
        "bootstrap-table-zh-CN": "./external_library/bootstrap/locales/bootstrap-table-zh-CN",
        "bootstrap-theme": "./external_library/bootstrap/bootstrap-theme",
        "font-awesome": "./external_library/font_awesome/css/font-awesome",
        "math": "./external_library/math/Math.uuid",
        //自己的JavaScript文件
        "baseController": "./controller/baseController",
        "firstController": "./controller/firstController",
        "secondController": "./controller/secondController",
        "baseDirective": "./directive/baseDirective",
        "pageDirective": "./external_library/page_directive/page-directive",
        "app": "./app",
        "baseModel": "./model/baseModule",
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
            deps: ['jquery', 'css!./bootstrap-theme', 'css!./bootstrap-css', 'css!./font-awesome']
        },
        'bootstrapTable': {
            deps: ['jquery', 'bootstrap','css!./bootstrap-table-css']
        },
        'bootstrap-table-zh-CN': {
            deps: ['bootstrapTable']
        },
        'uiBootstrap': {
            deps: ['jquery', 'angular']
        },
        'datetimepicker': {
            deps: ['jquery', 'angular', 'bootstrap','datetimepicker.zh-CN', 'css!./datetimepicker-css']
        },
        'baseModel': {
            deps: ['jquery', 'angular']
        },
        'uiRouter': {
            deps: ['angular'],
            exports: 'angular-route'
        },
        'toastr': {
            deps: ['jquery','css!./toastr-css'],
            exports: 'toastr'
        },
        'angularAMD': ['angular', 'uiRouter'],
        'ngLoad': {
            deps: ["angularAMD"],
            experts: "ngLoad"
        }
    },
    deps: ['app', 'css!base-css'],//首先启动初始化的JavaScript，用来手动启动angularjs应用
    urlArgs: "v=" + (new Date()).getTime()//防止读取缓存，调试用
});