( ->
  jobListCtrl = (
    $scope,
    $filter,
    $injector,
    $routeParams,
    $location,
    jobService
  ) ->
    jobListCtrl.$inject = [
      '$scope',
      '$filter',
      '$injector',
      '$routeParams',
      '$location',
      'jobService'
    ]

    init = () =>
      @jobs = []
      @consultantJobs = []
      @creativeJobs = []
      @selectedCategory = []
      @show = ['all']
      @isHidden = isHidden
      @toggle = toggle
      @goToJob = goToJob

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
      if category.indexOf('all') != -1
        if !contains(category)
          @show = []
          @show.push(category)
      else
        _all = @show.indexOf('all')
        if _all != -1 then @show.splice(_all, 1)
        _index = @show.indexOf(category)
        if _index != -1
          @show.splice(_index, 1)
          @show.push('all') if @show.length == 0
        else @show.push(category)
      console.log @show

    contains = (category) =>
      @show.indexOf(category) != -1

    isHidden = (category) =>
      !contains(category) and !contains('all')

    goToJob = (slug) =>
      console.log slug
      $location.path(slug)
      # $location.search('job', slug)

    init()
    return

  angular
  .module('nexum-karrier')
  .controller('jobListCtrl', jobListCtrl)
)()
