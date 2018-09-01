define(['app'],function (baseApp) {
    baseApp.factory('baseService', function ($timeout, $q, $http) {
        var factory = {};
        factory.selectAllCity = function(postDate){
            return factory.sendData("baseController/selectAllCity",postDate);
        }
        factory.sendData = function (url, params) {
            var defer = $q.defer();
            $http({
                url: url,
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                data: params,
            }).success(function (data) {
                defer.resolve(data);
            }).error(function (data, status, headers, config) {
                defer.reject(data);
            });
            return defer.promise;
        };
        return factory;
    });
});