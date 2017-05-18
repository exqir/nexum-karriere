(->

  jobService = ($http) =>
    base = './assets/'

    @get = (url) =>
      return $http
      .get(url)
      .then (result) =>
        return result.data.data

    @getJobs = () =>
      get(base + 'jobs.json')

    return @

  angular
  .module('nexum-karrier')
  .service('jobService', jobService)
)()
