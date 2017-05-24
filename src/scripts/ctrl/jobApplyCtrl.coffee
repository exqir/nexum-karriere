( ->
  jobApplyCtrl = (
    $scope,
    $filter,
    $injector,
    $routeParams,
    $location,
    jobService
  ) ->
    jobApplyCtrl.$inject = [
      '$scope',
      '$filter',
      '$injector',
      '$routeParams',
      '$location',
      'jobService'
    ]

    init = () =>
      @job = {}

      getJob()

    getJob = () =>
      _slug = $location.path().split('/')[1]
      jobService.getJobs()
      .then (data) =>
        for job in data
          do (job) =>
            if job.slug.indexOf(_slug) != -1
              @job = job
              console.log job
              return

    init()
    return

  angular
  .module('nexum-karrier')
  .controller('jobApplyCtrl', jobApplyCtrl)
)()
