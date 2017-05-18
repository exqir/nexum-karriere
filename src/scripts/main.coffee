( ->

  angular
  .module('nexum-karrier', ['ngRoute', 'ngSanitize', 'ngAnimate', 'angular.filter'])
  .config(['$routeProvider', '$compileProvider', ($routeProvider, $compileProvider) ->
    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|data:attachment):/)
    $routeProvider
    .when('/', {
      templateUrl: 'views/_job-list.html',
      controller: 'jobListCtrl',
      controllerAs: 'vm'
    })
    .otherwise({redirectTo: '/'})
  ])
)()
