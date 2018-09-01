define(['app', 'angular','baseService'], function (webapp) {//angular指令js
    webapp.directive("test", function() {
        return {
            restrict: 'E' ,
            template: "<h1>testBaseService</h1>" ,
            link: function (scope) {
                console.log( 'test running' );
            }
        };
    });
});