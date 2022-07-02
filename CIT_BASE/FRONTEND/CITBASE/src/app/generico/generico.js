angular.module('app.generico', [
  'ui.router',
  'toastr',
  'app.genericoService'
])
  
.config(
  [          '$stateProvider', '$urlRouterProvider',
    function ($stateProvider,   $urlRouterProvider) {
      $stateProvider
        .state('index.generico', {

          abstract: true,

          url: 'generico',

          params: {
            
          },

          views: {
            '': {
              templateUrl: 'app/generico/generico.tpl.html',
              resolve: {

              },
              controller: ['$scope', '$state', 'toastr',
                function (  $scope,   $state,   toastr) {

                  
                  
                }]
            }
          }
          
        })
        .state( 'index.generico.subestado', {

          url: '',

          views: {
            '': {
              templateUrl: 'app/generico/generico.subestado.tpl.html',
              resolve: {
                
              },
              controller: ['$scope', '$state', 'toastr',
                function (  $scope,   $state,   toastr) {

                  

                }]
            }
          }
        })
    }
  ]
);