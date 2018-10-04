define(['app'],function (baseApp) {
    baseApp.factory('baseService', function ($timeout, $q, $http) {
        var factory = {};
        factory.addNewData = function(postDate){
            return factory.sendData("baseController/addNewData",postDate);
        }
        factory.getNextTypes = function(postDate){
            return factory.sendData("baseController/getNextTypes",postDate);
        }
        factory.getMaxTypeLevel = function(postDate){
            return factory.sendData("baseController/getMaxTypeLevel",postDate);
        }
        factory.getTypeMap = function(postDate){
            return factory.sendData("baseController/getTypeMap",postDate);
        }
        factory.getLineBarOptions = function(postDate){
            return factory.sendData("baseController/getLineBarOptions",postDate);
        }
        factory.getAllExaminationName = function(postDate){
            return factory.sendData("baseController/getAllExaminationName",postDate);
        }
        factory.addExaminationData = function(postDate){
            return factory.sendData("baseController/addExaminationData",postDate);
        }
        factory.getAnalyzeData = function(postDate){
            return factory.sendData("baseController/getAnalyzeData",postDate);
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