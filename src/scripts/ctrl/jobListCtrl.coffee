( ->
  jobListCtrl = (
    $scope,
    $filter,
    $injector,
    $routeParams,
    jobService
  ) ->
    jobListCtrl.$inject = [
      '$scope',
      '$filter',
      '$injector',
      '$routeParams',
      'jobService'
    ]

    init = () =>
      @jobs = []
      @consultantJobs = []
      @selectedCategory = []

    getJobs = () =>
      jobService.getJobs()
      .then (data) =>
        @jobs = data


    init()
    return

  angular
  .module('nexum-karrier')
  .controller('jobListCtrl', jobListCtrl)
)()
