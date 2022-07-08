angular.module( 'app.login', [
  'ui.router',
  'toastr',
  'app.authService'
])

.config(
  [          '$stateProvider', '$urlRouterProvider',
    function ($stateProvider,   $urlRouterProvider) {
      $stateProvider
        //////////////
        // Login //
        //////////////
        .state( 'login', {

          url: '/login',

          templateUrl: 'app/login/login.tpl.html',
          
          controller: ['$scope', '$state', '$timeout', 'toastr', 'authService', '$base64','$location','$q','$cryptoOJ','utilsService',
            function (  $scope,   $state,   $timeout,   toastr,   authService,  $base64 ,  $location , $q , $cryptoOJ , utilsService) {
              $scope.loginData={};

              


  


              $scope.submitForm = function (isValid) {
               if (isValid) {
                 $scope.loginData.CLAVE = $cryptoOJ.encrypt($scope.loginData.USUARIO,$scope.loginData.CLAVE);
                 authService.login($scope.loginData)
                 .then( function ( responseLogin ) {
                    console.log(responseLogin.data)
                    if ( responseLogin.data.mensaje.result == 'OK' ) {
                      toastr.success(responseLogin.data.mensaje.msj);
                  //    var sistemaActual=utilsService.findByField(responseLogin.data.sistemas,'ID_SISTEMA',appSettings.sistemaId);
                   //   var sistemaOAUTH=utilsService.findByField(responseLogin.data.sistemas,'ID_SISTEMA',appSettings.sistemaIdOAUTH);
                      if(responseLogin.data.oauth){
                        //console.log("sistemas",sistemaActual,sistemaOAUTH);
//                        authService.saveLocalData("version"+appSettings.sistemaIdOAUTH,sistemaOAUTH.VERSION_SISTEMA);
//                       authService.saveLocalData("token"+appSettings.sistemaIdOAUTH,sistemaOAUTH.TOKEN);
                          $state.go( 'index.home',{"token":responseLogin.data.oauth.TOKEN});   
                    /*    authService.saveLocalData("token"+appSettings.sistemaId,sistemaOAUTH.TOKEN)
                        .then(function(guardado){
                           $state.go( 'index.home',{"token":sistemaOAUTH.TOKEN});   
                          // $state.go( 'index.home');   
                          //console.log(guardado);
                          /*authService.InsUsuario( responseLogin.data.usuario )
                          .then( function ( response ) {
                            if(response.data.result=='OK'){
                              toastr.success( response.data.msj ); 
                                        
                            }else{
                              toastr.error(response.data.msj );
                              $state.go( 'logout' );
                            }
                          }, function ( error ) {
                                    toastr.error( error );
                          });
                        });*/
                      }else{
                        toastr.error("No tienes permisos para ingrersar al sistema");
                      }
                      
                      
                      

                    // }
                       // // console.log("Login",responseLogin.data);
                       // authService.getmenu(responseLogin.data.data[0].usuarioId,appSettings.sistemaId).then( function ( response ) {
                       //   // console.log("response Menu", response);
                       //    if (response.data.status == 'OK') {
                       //        console.log("Menu", response.data);
                       //      if (response.data.data[0].permiso.length > 0) {
                       //        var menu = obtenerHijos(response.data.data[0].menu, 0);
                       //        authService.saveLocalData('loginData' + appSettings.sistemaId, responseLogin.data.data[0]);
                       //        authService.saveLocalData('permiso' + appSettings.sistemaId, response.data.data[0].permiso);
                       //        authService.saveLocalData('menu' + appSettings.sistemaId, menu);

                       //        // Obtiene Token
                       //        authService.generaToken( responseLogin.data.data[0].codigoEmpleado,appSettings.sistemaId).then( function ( response ) {
                       //          if(response.data.result=='OK'){
                       //           // toastr.success('Token Obtenido :' + response.data.msj );  
                       //            authService.saveLocalData('token' + appSettings.sistemaId, response.data.msj);             
                       //          }else{
                       //            toastr.error(response.data.msj );
                       //          }
                       //        }, function ( error ) {
                       //          toastr.error( error );
                       //        });

                       //        // ingresa usuario a tabla del sistema
                       //        authService.InsUsuario( responseLogin.data.data[0] ).then( function ( response ) {
                       //          if(response.data.result=='OK'){
                       //            toastr.success( response.data.msj );               
                       //          }else{
                       //            toastr.error(response.data.msj );
                       //            $state.go( 'logout' );
                       //          }
                       //        }, function ( error ) {
                       //          toastr.error( error );
                       //        });

                       //        $state.go( 'index.home' );
                       //      } else {
                       //      //  res.status = 'error';
                       //        $scope.response.message = 'No tiene permisos para ingresar al sistema';
                       //      }
                       //    }
                       // }, function ( error ) {
                       //   toastr.error( error );
                       // });

                     
                    } else {
                       toastr.error( responseLogin.data.mensaje.msj );
                       $scope.loginData.CLAVE=null;
                       /*$timeout( function () {$scope.form.$submitted = false;}, 1300);*/
                    }
                 }, function ( error ) {
                   toastr.error( error );
                 });
               }
             }



             obtenerHijos = function (data, padreId) {
              data.sort(compare);
              var hijos = [];
              var dataNew = [];
              if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                  var hijo = data[i];
                  if (padreId == data[i].padreId) {
                    hijos.push(hijo);
                  } else {
                    dataNew.push(hijo);
                  }
                }
              }
              if (hijos.length > 0) {
                for (var i = 0; i < hijos.length; i++) {
                  var nietos = obtenerHijos(dataNew, hijos[i].menuId);
                  hijos[i].hijos = nietos;
                }
              }
              return hijos;
            }

            

            

            compare = function (a,b) {
              if (a.nombreCorto < b.nombreCorto)
                return -1;
              if (a.nombreCorto > b.nombreCorto)
                return 1;
              return 0;
            }

            


           }]
        })
        .state( 'logout', {

          url: '/logout',

          templateUrl: 'app/login/login.tpl.html',
          controller: ['$scope', '$state', '$timeout', 'toastr', 'authService', '$base64',
            function (  $scope,   $state,   $timeout,   toastr,   authService,  $base64) {
              authService.logOut();
              $state.go('login');
           }]
        })
    }
  ]
);
