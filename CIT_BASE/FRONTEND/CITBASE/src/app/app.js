/////////////////////////////
// Parametros del sistema //
/////////////////////////////
var appSettings = {
  isDevelopment: true,

  // // Desarrollo
  restApiServiceBaseUri: 'http://localhost:8080/CITBASE/webapi/', // REST Api
  pdfVierwer : 'http://frontendappcit.oj.gob.gt/viewer/viewer.html?file=', //Visor Pdf pruebas
  pdfReportViewer : 'http://sharepointprod.oj.gob.gt:8085/Reporte.aspx?p=/', //Visor Pdf Reportes
  restOAUTH : 'http://wsdesacit:8080/OAUTH2/webapi/', //oauth
  restRRHH : 'http://servicioscit.oj.gob.gt:8080/rrhh/', //rrhh prod
  sistemaId : 1,  //id sistema  oauth
  sistemaIdOAUTH : 2,  //id sistema  oauth
  sistemaIdRRHH : 33,
  
  //Pruebas
  // restApiServiceBaseUri: 'http://localhost:8080/CITBASE/webapi/', // REST Api
  // pdfVierwer : 'http://frontendappcit.oj.gob.gt/viewer/viewer.html?file=', //Visor Pdf pruebas
  // pdfReportViewer : 'http://sharepointprod.oj.gob.gt:8085/Reporte.aspx?p=/', //Visor Pdf Reportes
  // restOAUTH : 'http://wsdesacit:8080/OAUTH2/webapi/', //oauth
  // restRRHH : 'http://servicioscit.oj.gob.gt:8080/rrhh/', //rrhh prod
  // sistemaId : 1,  //id sistema  oauth
  // sistemaIdOAUTH : 2,  //id sistema  oauth
  // sistemaIdRRHH : 33,

  // //Capacitacion
  // restApiServiceBaseUri: 'http://localhost:8080/CITBASE/webapi/', // REST Api
  // pdfVierwer : 'http://frontendappcit.oj.gob.gt/viewer/viewer.html?file=', //Visor Pdf pruebas
  // pdfReportViewer : 'http://sharepointprod.oj.gob.gt:8085/Reporte.aspx?p=/', //Visor Pdf Reportes
  // restOAUTH : 'http://wsdesacit:8080/OAUTH2/webapi/', //oauth
  // restRRHH : 'http://servicioscit.oj.gob.gt:8080/rrhh/', //rrhh prod
  // sistemaId : 1,  //id sistema  oauth
  // sistemaIdOAUTH : 2,  //id sistema  oauth
  // sistemaIdRRHH : 33,

  //Produccion
  // restApiServiceBaseUri: 'http://localhost:8080/CITBASE/webapi/', // REST Api
  // pdfVierwer : 'http://frontendappcit.oj.gob.gt/viewer/viewer.html?file=', //Visor Pdf pruebas
  // pdfReportViewer : 'http://sharepointprod.oj.gob.gt:8085/Reporte.aspx?p=/', //Visor Pdf Reportes
  // restOAUTH : 'http://wsdesacit:8080/OAUTH2/webapi/', //oauth
  // restRRHH : 'http://servicioscit.oj.gob.gt:8080/rrhh/', //rrhh prod
  // sistemaId : 1,  //id sistema  oauth
  // sistemaIdOAUTH : 2,  //id sistema  oauth
  // sistemaIdRRHH : 33,

 
 
  Sistema: 'CITBASE',
  timeOuttoastrNotifications: '15000',
  paginationPageSizes: [10, 25, 50],
  paginationMinPageSizes: [5, 10, 25],
  smartTable: { itemsByPage: 5, displayedPages: 5 },
  //constantes:[]
};

/////////////////////////////
// Inicializacion de modulo//
// principal del sistema   //
/////////////////////////////
angular.module( 'app', [
  'templates-app',
  'ngSanitize',
  'ui.bootstrap',
  'ui.grid',
  'ui.grid.pagination',
  'ui.grid.selection',
  'ui.grid.exporter',
  'ui.grid.edit',
  'ui.grid.autoResize',
  'ui.grid.grouping',
  'ui.grid.treeView',
  'ui.router',
  'ui.select',
  'mwl.calendar',
  'LocalStorageModule',
  'chieffancypants.loadingBar',
  'toastr',
  'ngDialog',
  'ui.mask',
  'chart.js',
  'base64',
  'ngFileUpload',
  'swipe',
  'angular-carousel-3d',
  'treeControl',
  'ngMagnify',
  'smart-table',
  'duScroll',
  'ui.bootstrap.datetimepicker',
  'ui.bootstrap.tooltip',
  'mdo-angular-cryptography-oj',

  'app.utilsService',
  'app.authService',
  'app.authInterceptorService',
  'app.directives',
  'app.login'

])

.filter( 'dateFilter', ['$filter', function ($filter) {
  return function (input) {
    if (!input) {
      return '';
    } else {
      return $filter( 'date' )(new Date(input),'dd/MM/yyyy' );
    }
  };
}])

.filter( 'propsFilter', [function () {
  return function (items, props) {
    var out = [];

    if (angular.isArray(items)) {
      items.forEach( function (item) {
        var itemMatches = false;

        var keys = Object.keys(props);
        for (var i = 0; i < keys.length; i++) {
          var prop = keys[i];
          var text = props[prop].toLowerCase();
          if (item[prop].toString().toLowerCase().indexOf(text) !== -1) {
            itemMatches = true;
            break;
          }
        }

        if (itemMatches) {
          out.push(item);
        }
      });
    } else {
      // Let the output be the input untouched
      out = items;
    }

    return out;
  };
}])

.run(
  [          '$rootScope', '$state', '$stateParams', 'appSettings', 'toastr', 'ngDialog',
    function ($rootScope,   $state,   $stateParams,   appSettings,   toastr,   ngDialog) {

      // add references to $state and $stateParams to the $rootScope
      // For example <li ng-class="{ active: $state.includes( 'contacts.list' ) }"> will set the <li>
      // to active whenever 'contacts.list' or one of its decendents is active.
      $rootScope.$state = $state;
      $rootScope.$stateParams = $stateParams;

      $rootScope.$on( '$stateChangeError', function (event, toState, toParams, fromState, fromParams, error) {
        // prevenir accion por default
        event.preventDefault();
        // cerrar todos los dialogos abiertos si hay
        ngDialog.close();

        if ( error && error.status == 401 ) {
          console.log("a login", { error: error } );
          $state.go( 'login' );
        } else {
          console.log("state change error else", { error: error });
          location.href = '#/';
        }
      });

    }
  ]
)

.config(['$httpProvider', function ($httpProvider) {
  $httpProvider.interceptors.push( 'authInterceptorService' );
}])

.config(['cfpLoadingBarProvider', function (cfpLoadingBarProvider) {
  cfpLoadingBarProvider.spinnerTemplate = '<div class="spinner"> <div id="loading-bar-spinner"><div class="preloader pl-lg"> <svg class="pl-circular" viewBox="25 25 50 50"><circle class="plc-path" cx="50" cy="50" r="20"></circle></svg> </div></div> </div>';
}])

.config(['ngDialogProvider', function (ngDialogProvider) {
  ngDialogProvider.setDefaults({
    className: 'ngdialog-theme-flat',
    showClose: true,
    closeByDocument: true,
    closeByEscape: true,
    cache: true,
    overlay: true
  });
}])

.config(['$locationProvider', function($locationProvider) {
  $locationProvider.hashPrefix('');
  }])

.config(['toastrConfig', function (toastrConfig) {
  angular.extend(toastrConfig, {
    autoDismiss: false,
    containerId: 'toast-container',
    maxOpened: 0,
    newestOnTop: true,
    positionClass: 'toast-top-right',
    preventDuplicates: false,
    preventOpenDuplicates: false,
    //close-button: true
    closeButton: true,
    progressBar: true,
    target: 'body'
  });
}])

.constant('uiDatetimePickerConfig', {
    dateFormat: 'yyyy-MM-dd HH:mm',
    defaultTime: '00:00:00',
    html5Types: {
        date: 'yyyy-MM-dd',
        'datetime-local': 'yyyy-MM-ddTHH:mm:ss.sss',
        'month': 'yyyy-MM'
    },
    initialPicker: 'date',
    reOpenDefault: false,
    enableDate: true,
    enableTime: true,
    buttonBar: {
        show: true,
        now: {
            show: true,
            text: 'Ahora',
            cls: 'btn-sm btn-default'
        },
        today: {
            show: true,
            text: 'Hoy',
            cls: 'btn-sm btn-default'
        },
        clear: {
            show: true,
            text: 'Limpiar',
            cls: 'btn-sm btn-default'
        },
        date: {
            show: true,
            text: 'Fecha',
            cls: 'btn-sm btn-warning'
        },
        time: {
            show: true,
            text: 'Hora',
            cls: 'btn-sm btn-warning'
        },
        close: {
            show: true,
            text: 'Confirmar',
            cls: 'btn-sm btn-info'
        },
        cancel: {
            show: false,
            text: 'Cancelar',
            cls: 'btn-sm btn-danger'
        }
    },
    closeOnDateSelection: true,
    closeOnTimeNow: true,
    appendToBody: false,
    altInputFormats: [],
    ngModelOptions: {},
    saveAs: false,
    readAs: false
})

/* .config( function (calendarConfig) {
  calendarConfig.showTimesOnWeekView = true; //Make the week view more like the day view, with the caveat that event end times are ignored.
})*/

.config(
  [          '$stateProvider', '$urlRouterProvider',
    function ($stateProvider,   $urlRouterProvider) {

     /* var authenticated = ['$location', '$q', 'authService', function ($location, $q, authService) {
        console.log("authenticated");
        var deferred = $q.defer();
        if ( authService.isLoggedIn() ) {
          deferred.resolve();
        } else {
          deferred.reject( { status: 401 } );
        }
        return deferred.promise;
      }];*/

      var authenticated = ['$location', '$q', 'authService','$stateParams','toastr',
                   function ($location,   $q,   authService , $stateParams, toastr ) {
        //console.log("authenticatedX",$stateParams);
        var deferred = $q.defer();
        var salida={};
        if ( authService.isLoggedIn() ) {
          console.log("EstaLogeado");
          authService.getSessionUsuario(appSettings.sistemaId)
                .then(function(response){
                  console.log("Session de Usuario Obtenida");
                  salida.SESSION=response.data;
                  authService.saveLocalData("token"+appSettings.sistemaId,salida.SESSION.SISTEMA.TOKEN)
                  .then(function(guardado){
                    if(guardado){
                        console.log("Token SISTEMA Guardado");
                        authService.saveLocalData("permisos"+appSettings.sistemaId,salida.SESSION.PERMISOS);
                        authService.getConstantes()
                        .then(function(response){
                          console.log("Constantes de Sistema Obtenidas");
                          salida.CONSTANTES=response.data;
                              authService.InsUsuario( salida.SESSION )
                              .then( function ( response ) {
                                if(response.data.result=='OK'){
                                  toastr.success( response.data.msj ); 
                                  deferred.resolve(salida);      
                                }else{
                                  toastr.error(response.data.msj );
                                  $state.go( 'logout' );
                                }
                              }, function ( error ) {
                                        toastr.error( error );
                              });
                        },function ( error ) {
                          deferred.reject( { status: 401 } );
                        });
                    }else{
                      deferred.reject( { status: 401 } );
                    }
                  },function ( guardado ) {
                    deferred.reject( { status: 401 } );
                  });
                },function ( error ) {
                  deferred.reject( { status: 401 } );
                });
        } else {
          console.log("No EstaLogeado");
          if($stateParams.token){
            console.log("Viene Token OATUH");
            authService.saveLocalData("token"+appSettings.sistemaIdOAUTH,$stateParams.token)
            .then(function(guardado){
              if(guardado){
                console.log("Token OAUTH Guardado");
                authService.getSessionUsuario(appSettings.sistemaId)
                .then(function(response){
                  console.log("Session de Usuario Obtenida");
                  salida.SESSION=response.data;
                  authService.saveLocalData("token"+appSettings.sistemaId,salida.SESSION.SISTEMA.TOKEN)
                  .then(function(guardado){
                    if(guardado){
                        console.log("Token SISTEMA Guardado");
                        authService.saveLocalData("permisos"+appSettings.sistemaId,salida.SESSION.PERMISOS);
                        authService.getConstantes()
                        .then(function(response){
                          console.log("Constantes de Sistema Obtenidas");
                          salida.CONSTANTES=response.data;
                              authService.InsUsuario( salida.SESSION )
                              .then( function ( response ) {
                                if(response.data.result=='OK'){
                                  toastr.success( response.data.msj ); 
                                  deferred.resolve(salida);      
                                }else{
                                  toastr.error(response.data.msj );
                                  $state.go( 'logout' );
                                }
                              }, function ( error ) {
                                        toastr.error( error );
                              });
                        },function ( error ) {
                          deferred.reject( { status: 401 } );
                        });
                    }else{
                      deferred.reject( { status: 401 } );
                    }
                  },function ( guardado ) {
                    deferred.reject( { status: 401 } );
                  });
                },function ( error ) {
                  deferred.reject( { status: 401 } );
                });

              }else{
                deferred.reject( { status: 401 } );
              }
              
            },function ( guardado ) {
              deferred.reject( { status: 401 } );
            });
          }else{
            deferred.reject( { status: 401 } );
          }
        }
        return deferred.promise;
      }];
      

      /////////////////////////////
      // Redirects and Otherwise //
      /////////////////////////////

      $urlRouterProvider

        // If the url is ever invalid, e.g. '/asdf', then redirect to '/' aka the home state
        .otherwise( '/' );


      //////////////////////////
      // State Configurations //
      //////////////////////////

      // Use $stateProvider to configure your states.
      $stateProvider

        //////////
        // Home //
        //////////

        .state("index", {

          abstract: true,

          url: "/?token",

          templateUrl: 'app/index.tpl.html',

          resolve: {
              authenticated:authenticated
          },

          controller: ['$scope', 'toastr', 'appSettings', 'utilsService', 'authService', '$state', '$window',
            'localStorageService','ngDialog','authenticated',
            function ($scope, toastr, appSettings, utilsService, authService, $state, $window,
             localStorageService ,  ngDialog , authenticated) {
             //console.log("authenticated",authenticated);
             $scope.loginData=authenticated.SESSION;
  

              // inicializar la plantilla AdminLTE
              _initAdminLTETemplate();


              

              
              

              //trae las constantes
              $scope.constantes=authenticated.CONSTANTES;
              // oculta la consola en modo que no sea desarrollo
              if ( $scope.constantes.ES_DESARROLLO == '0' ) {
                console.log = function () {};

                //para prevenir de que se va a cerrar el sistema
                /*angular.element($window).bind("beforeunload", function (event) {
                console.log("cerrandola");
                  return 'Sure?';
                });*/
              }



              console.log( 'constantes en index',$scope.constantes);
              console.log(  "Ver.Sistema_Session",$scope.loginData.SISTEMA.VERSION_SISTEMA,
                            "Ver.Sistema_LocSt",localStorageService.get( 'appVersion' + appSettings.sistemaId));

             
              //verifica la version del sistema y la actualiza, 
              //funciona con F5, deslogearser o que se cierre la ventana
              (function(){
                  if($scope.loginData.SISTEMA.VERSION_SISTEMA!=localStorageService.get( 'appVersion' + appSettings.sistemaId)){
                  console.log("Actualiza Sistema de ",localStorageService.get( 'appVersion' + appSettings.sistemaId)," a ",$scope.loginData.SISTEMA.VERSION_SISTEMA);
                  localStorageService.set( 'appVersion' + appSettings.sistemaId, $scope.loginData.SISTEMA.VERSION_SISTEMA);
                  window.location.reload(true);
                }else{
                  console.log("Sistema Actualizado");
                }
              }());



              //aqui funcionaria en todo momemto pero se consumiiria le servicio de verion muchas 
              //veces
             /* $scope.$on('$viewContentLoaded', function() {
                 if($scope.constantes.VERSION_SISTEMA!=$scope.appVersion){
                  console.log("Actualiza Sistema de",$scope.appVersion,"a",$scope.constantes.VERSION_SISTEMA);
                  $scope.appVersion=$scope.constantes.VERSION_SISTEMA;
                  localStorageService.set( 'appVersion' + appSettings.sistemaId, $scope.constantes.VERSION_SISTEMA);
                  window.location.reload();
                }else{
                  console.log("Sistema Actualizado");
                }
              });*/

             
              $scope.TextClick = function ($event) {
                       $event.target.select();
              };

              buildTableBody = function (data, columns,titulos,sum) {
                  var body = [];
                  body.push(titulos);
                  data.forEach(function(row) {
                      var dataRow = [];
                      columns.forEach(function(column,index) {
                          dataRow.push(row[column].toString());
                          if(sum!==undefined){
                            if(!isNaN(sum[index])){
                              sum[index]=+sum[index] + +row[column];
                              sum[index]=sum[index].toFixed(2);
                            }
                            
                          }
                      })

                      body.push(dataRow);
                  });
                  if(sum!==undefined){
                    body.push(sum);
                  }
                return body;
                }

             tablaPDF =   function (data, columns,titulos,sum) {
                    return {
                        style: 'tabla',
                        table: {
                            headerRows: 1,
                            body: buildTableBody(data, columns,titulos,sum)
                        }
                    };
                }

             

             


              // dateOptions
              $scope.dateOptions = {
                formatYear: 'yy',
                startingDay: 0,
                format: 'dd/MM/yyyy',
                formatDateTime: 'dd/MM/yyyy HH:mm',
                showMeridian: false
              };


              // dateOptions
              $scope.dateOptions = {
                formatYear: 'yy',
                startingDay: 0,
                format: 'dd/MM/yyyy',
                formatDateTime: 'dd/MM/yyyy HH:mm',
                showMeridian: false
              };

              // objeto fechas que contiene todas las fechas de los forms
              $scope.openedDates = {};

              // funcion que muestra el datepicker
              $scope.openDate = function($event, field) {
                $event.preventDefault();
                $event.stopPropagation();
                $scope.openedDates[field] = true;
              };

              $scope.smartTable = appSettings.smartTable;

              // grid
              $scope.gridOptions = {
                enableRowSelection: true,
                multiSelect: true,
                enableSelectAll: true,
                enableRowSelection: true,
                enableRowHeaderSelection: false,
                selectionRowHeaderWidth: 35,
                groupingRowHeaderWidth: 50,
                paginationPageSizes: appSettings.paginationPageSizes,
                data: []
              };

              $scope.gridOptionsThin = {
                enableRowSelection: true,
                multiSelect: false,
                enableSelectAll: false,
                enableRowSelection: true,
                enableRowHeaderSelection: false,
                //selectionRowHeaderWidth: 35,
                //groupingRowHeaderWidth: 50,
                paginationPageSizes: [5, 10, 50],
                data: []
              };

              $scope.gridOptionsLarge = {
                enableRowSelection: true,
                multiSelect: false,
                enableSelectAll: false,
                enableRowSelection: true,
                enableFiltering: true,
                enableRowHeaderSelection: false,
                //selectionRowHeaderWidth: 35,
                //groupingRowHeaderWidth: 50,
                paginationPageSizes: [10, 25, 50],
                data: []
              };


              $scope.gridOptionsReport = {
                enableRowSelection: true,
                multiSelect: false,
                enableSelectAll: false,
                enableRowSelection: true,
                enableRowHeaderSelection: false,
                enableFiltering: true,
                enableGridMenu: true,
                //selectionRowHeaderWidth: 35,
                //groupingRowHeaderWidth: 50,
                paginationPageSizes: [15, 25, 50],
                data: []
              };

              $scope.gridOptionsComplex = {
                enableRowSelection: true,
                multiSelect: false,
                enableSelectAll: false,
                enableRowSelection: true,
                enableRowHeaderSelection: false,
                enableFiltering: true,
                //selectionRowHeaderWidth: 35,
                //groupingRowHeaderWidth: 50,
                paginationPageSizes: [15, 25, 100],
                data: []
              };

              $scope.gridOptionsSelection = {
                enableRowSelection: true,
                multiSelect:false,
                enableSelectAll: false,
                enableRowHeaderSelection: false,
                paginationPageSizes: appSettings.paginationPageSizes,
                data: []
              };

           

              //Charts
               $scope.chartOptionsNormal = { 
                  legend: {
                      display: false
                  }
                };

              $scope.chartOptionsLegend = { 
                  legend: {
                      display: true
                  }
                };
                $scope.chartOptionsLegendBar={
                  legend: {
                            display: true
                        },
                  animation: {
                      duration: 500,
                      onComplete: function () {
                          // render the value of the chart above the bar
                          var ctx = this.chart.ctx;
                          ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, 'normal', Chart.defaults.global.defaultFontFamily);
                          ctx.fillStyle = this.chart.config.options.defaultFontColor;
                          ctx.textAlign = 'center';
                          ctx.textBaseline = 'bottom';
                          this.data.datasets.forEach(function (dataset) {
                              for (var i = 0; i < dataset.data.length; i++) {
                                  var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model;
                                  ctx.fillText(dataset.data[i], model.x, model.y - 5);
                              }
                          });
                      }
                  }
                }
               $scope.chartOptionsLegendDetail = { 
                          legend: {
                            display: true,
                            labels: {
                                generateLabels: function(chart) {
                                    var data = chart.data;
                                    if (data.labels.length && data.datasets.length) {
                                        return data.labels.map(function(label, i) {
                                            var meta = chart.getDatasetMeta(0);
                                            var ds = data.datasets[0];
                                            var arc = meta.data[i];
                                            var custom = arc && arc.custom || {};
                                            var getValueAtIndexOrDefault = Chart.helpers.getValueAtIndexOrDefault;
                                            var arcOpts = chart.options.elements.arc;
                                            var fill = custom.backgroundColor ? custom.backgroundColor : getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts.backgroundColor);
                                            var stroke = custom.borderColor ? custom.borderColor : getValueAtIndexOrDefault(ds.borderColor, i, arcOpts.borderColor);
                                            var bw = custom.borderWidth ? custom.borderWidth : getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts.borderWidth);

                              // We get the value of the current label
                              var value = chart.config.data.datasets[arc._datasetIndex].data[arc._index];

                                            return {
                                                // Instead of `text: label,`
                                                // We add the value to the string
                                                text: label + "(" + value+")",
                                                fillStyle: fill,
                                                strokeStyle: stroke,
                                                lineWidth: bw,
                                                hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                                index: i
                                            };
                                        });
                                    } else {
                                        return [];
                                    }
                                }
                            }
                        }
                };

              $scope.goTab = function(event) {
                event.preventDefault();
              };

              $scope.typeof = function(value, type) {
                return typeof value === type
              };

              $scope.logout = function(isValid) {
                authService.logOut();
                $state.go('login');
              };
            }]

        })
        .state("index.home", {

          url: "",

          views: {
            '': {
              templateUrl: 'app/home/home.tpl.html',
              resolve: {

              },
              controller: ['$scope', 'toastr',
                function (  $scope,   toastr) {
                 $scope.bg='img/bg_home.jpg';


              }]
            },

          }

        })

    }
  ]
)

.constant( 'appSettings', appSettings);
