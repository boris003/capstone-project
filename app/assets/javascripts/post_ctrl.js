(function() {
  "use strict";

  angular.module("app").controller("postCtrl", function($scope){

    $scope.message = "Hello World!";

    $scope.like = function(photo, photoScope){
      photo.liked = true;
    };

  });
})();