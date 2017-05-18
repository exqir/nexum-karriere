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
      @creativeJobs = []
      @selectedCategory = []

      @hideConsultant = false
      @hideCreative = false

      @toggle = toggle

      getJobs()

    getJobs = () =>
      jobService.getJobs()
      .then (data) =>
        @jobs = data
        @consultantJobs = data.filter (job) ->
          job.category.indexOf('consultant') != -1
        @creativeJobs = data.filter (job) ->
          job.category.indexOf('creative') != -1

    toggle = (category) =>
      switch category
        when 'consultant' then @hideConsultant = !@hideConsultant
        when 'creative' then @hideCreative = !@hideCreative
      console.log @hideConsultant

    init()
    return

  angular
  .module('nexum-karrier')
  .controller('jobListCtrl', jobListCtrl)
)()
