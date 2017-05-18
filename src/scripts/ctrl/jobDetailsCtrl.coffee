( ->
  jobDetailsCtrl = (
    $scope,
    $filter,
    $injector,
    $routeParams,
    $location,
    jobService
  ) ->
    jobDetailsCtrl.$inject = [
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

    goToJob = (slug) =>
      $location.path('details/' + slug)

    init()
    return

  angular
  .module('nexum-karrier')
  .controller('jobDetailsCtrl', jobDetailsCtrl)
)()
