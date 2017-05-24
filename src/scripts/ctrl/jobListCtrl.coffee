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
      @technologyJobs = []
      @financeJobs = []

      @category = ['all']
      @location = ['all']
      @isHidden = isHidden
      @toggle = toggle
      @contains = contains
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
        @technologyJobs = data.filter (job) ->
          job.category.indexOf('technology') != -1
        @financeJobs = data.filter (job) ->
          job.category.indexOf('finance') != -1

    toggle = (category, selection) =>
      if category.indexOf('all') != -1
        if !contains(category, selection)
          selection = []
          selection.push(category)
      else
        _all = selection.indexOf('all')
        if _all != -1 then selection.splice(_all, 1)
        _index = selection.indexOf(category)
        if _index != -1
          selection.splice(_index, 1)
          selection.push('all') if selection.length == 0
        else selection.push(category)

    contains = (category, selection) =>
      selection.indexOf(category) != -1

    isHidden = (category, selection) =>
      !contains(category, selection) and !contains('all', selection)

    goToJob = (slug) =>
      $location.path(slug)

    init()
    return

  angular
  .module('nexum-karrier')
  .controller('jobListCtrl', jobListCtrl)
)()
