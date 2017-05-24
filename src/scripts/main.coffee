( ->

  angular
  .module('nexum-karrier', ['ngRoute', 'ngSanitize', 'ngAnimate', 'angular.filter'])
  .config(['$routeProvider', '$compileProvider', ($routeProvider, $compileProvider) ->
    # $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|data:attachment):/)
    $routeProvider
    .when('/', {
      templateUrl: 'views/_job-list.html',
      controller: 'jobListCtrl',
      controllerAs: 'vm'
    })
    .when('/:title', {
      templateUrl: 'views/_job-details.html',
      controller: 'jobDetailsCtrl',
      controllerAs: 'vm'
      })
    .when('/:title/apply', {
      templateUrl: 'views/_job-apply.html',
      controller: 'jobApplyCtrl',
      controllerAs: 'vm'
      })
    .otherwise({redirectTo: '/'})
  ])
)()
