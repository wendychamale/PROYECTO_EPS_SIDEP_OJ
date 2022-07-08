angular.module( 'app.authInterceptorService', [
  'LocalStorageModule'
])

.factory( 'authInterceptorService',
  ['$q', '$injector', '$location', 'localStorageService', '$cryptoOJ',
  function ($q, $injector, $location, localStorageService, $cryptoOJ) {

  var authInterceptor = {};

  authInterceptor.request = function ( config ) {

    //startwith, para internet explorer
    if (!String.prototype.startsWith) {
        String.prototype.startsWith = function(searchString, position) {
        position = position || 0;
        return this.indexOf(searchString, position) === position;
      };
    }

    if (config.url.startsWith(appSettings.restApiServiceBaseUri)) {
      config.headers = config.headers || {};
      var token = localStorageService.get('token' + appSettings.sistemaId);
      if (token) {
        config.headers.Authorization = 'Bearer ' + token;
      } else {//si no hay token enviamos la fecha
        //CIT-CAPE-D124-M4-Y2018
        if (!(config.headers.Authorization)) {
          var dateObj = new Date();
          var fecha256 = $cryptoOJ.sha256("CIT-" + appSettings.Sistema + "-D" + dateObj.getDate() + "-M" + dateObj.getMonth() + "-Y" + dateObj.getFullYear());
          config.headers.Authorization = 'Bearer ' + fecha256;
        }
      }
      if (config.method == 'POST' || config.method == 'PUT') {
        var jwtData = token.split('.')[1];
        var decodedJwtJsonData = window.atob(jwtData);
        var decodedJwtData = JSON.parse(decodedJwtJsonData);
        var ID_USUARIO = decodedJwtData.ID_USUARIO;
        config.data.ID_USUARIO = ID_USUARIO;
      }
    }

    if(config.url.startsWith(appSettings.restOAUTH)){
      config.headers = config.headers || {};
      var tokenOAUTH = localStorageService.get( 'token' + appSettings.sistemaIdOAUTH );
      if(tokenOAUTH){
        config.headers.Authorization = 'Bearer ' + tokenOAUTH;
      }
    }

    return config;
  }

  // authInterceptor.responseError = function ( rejection ) {
  //   //console.log("rejection", rejection);
  //   if ( rejection.status === 401 ) {
  //     /*var authService = $injector.get( 'authService' );
  //     var authData = localStorageService.get( 'loginData' );

  //     if (authData) {
  //       if (authData.useRefreshTokens) {
  //         $location.path( '/refresh' );
  //         return $q.reject(rejection);
  //       }
  //     }*/
  //     //authService.logOut();
  //     //localStorageService.remove( 'loginData' + appSettings.sistemaId);
  //     //localStorageService.remove( 'permiso' + appSettings.sistemaId );
  //     //localStorageService.remove( 'menu' + appSettings.sistemaId);
  //     //$location.path( '/login' );
  //     //$state.go('login');
  //    // console.log("location.href", '/#/login' );
  //     // $location.path( '/login' );
  //    // location.href = "#/login";
  //   }
  //   return rejection;
  // }

  authInterceptor.responseError = function ( rejection ) {
    console.log("rejection", rejection);
    if ( rejection.status === 401 ) {
      var authService = $injector.get( 'authService' );
      var $state = $injector.get( '$state' );
      var toastr = $injector.get( 'toastr' );
      var authData = localStorageService.get( 'loginData' );

     /* if (authData) {
        if (authData.useRefreshTokens) {
          $location.path( '/refresh' );
          return $q.reject(rejection);
        }
      }*/

      rejection.data="Su Session Ha Expirado, Ingrese de Nuevo al Sistema";
      toastr.warning(rejection.data);
      //toastr.error= function (){};

      authService.logOut();
      $state.go('login');

     // console.log("location.href", '/#/login' );
      // $location.path( '/login' );
     // location.href = "#/login";
    }
    return $q.reject(rejection);
  }

  return authInterceptor;
}]);
