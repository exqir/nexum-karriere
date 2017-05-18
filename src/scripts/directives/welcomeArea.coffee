( ->
  welcomeArea = () =>
    templateUrl: './views/welcomeArea.html'

  angular
  .module('nexum-karrier')
  .directive('nxmWelcomeArea', welcomeArea)

)()
