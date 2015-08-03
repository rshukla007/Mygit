<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring MVC AngularJS demo</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script>
//// For Testing Purpose
/* var ptest = "json=" + encodeURI(JSON.stringify([
                                                {
                                                    name: "Peter",
                                                    age: 10},
                                                {
                                                    name: "David",
                                                    age: 20}
                                                ])); 
 var app = angular.module('myApp', []);  
 function MyController1($scope, $http){
        $scope.people = [];

        $scope.loadPeople = function() {
            var httpRequest = $http({
                method: 'GET',
                url: 'springAngularJS',
                data: ptest

            }).success(function(data, status) {
                $scope.person = data;
            });

        };
    }; */
    
    var app = angular.module('myApp', []);
    function MyController($scope, $http){
        
        $scope.getPersonDataFromServer = function() {           
            $http({method: 'GET', url: 'springAngularJS'}).success(function(data, status, headers, config) {
              // $scope.person = JSON.stringify(data);
              $scope.person = data;
               
            }).
            error(function(data, status, headers, config) {
              // called asynchronously if an error occurs
              // or server returns response with an error status.
            });
        };
    };
</script>
</head>
<body>
    <div data-ng-app="myApp">
        <div data-ng-controller="MyController">
            <button data-ng-click="getPersonDataFromServer()">Get Person data from server</button>
            <p>First Name : {{person.name}}</p>
            <p>Last Name : {{person.age}}</p>
        </div>
    </div>
</body>
</html>