angular.module( 'app.authService', [
  'LocalStorageModule',
  'app.utilsService'
])

.factory( 'authService', ['$http', '$q', 'localStorageService', 'utilsService', 'appSettings','toastr',  function ($http, $q, localStorageService, utilsService, appSettings,toastr) {

  var auth = {};

  


  auth.login = function ( data ) {
    var deferred = $q.defer();
    $http.post( appSettings.restOAUTH + 'Login/validarUsuarioInterno', data).then(successCallback, errorCallback); 
      function successCallback(data){
        deferred.resolve( data );        
      }
      function errorCallback(error){
                //error code
        deferred.reject( error );
      }
    return deferred.promise;
  };

  auth.InsUsuario = function( data ) {
        var deferred = $q.defer();
        $http.post( appSettings.restApiServiceBaseUri + 'Login/insUsuario', data )
        .then(successCallback, errorCallback);
            function successCallback(data){
                //success code
                deferred.resolve( data );
            }
            function errorCallback(error){
                //error code
                deferred.reject( error );
            }
        return deferred.promise;
  };  

 /* auth.getmenu = function ( usuarioId,sistemaId ) {
    var deferred = $q.defer();
    $http.get( appSettings.restActiveDirectory + 'usuario/' + usuarioId + '/sistema/' + sistemaId + '/permiso/lista').then(successCallback, errorCallback); 
      function successCallback(data){
        deferred.resolve( data );        
      }
      function errorCallback(error){
                //error code
        deferred.reject( error );
      }
    return deferred.promise;
  };*/

  auth.logOut = function () {
    localStorageService.remove( 'permisos' + appSettings.sistemaId );
    localStorageService.remove( 'token' + appSettings.sistemaId);
    localStorageService.remove( 'token' + appSettings.sistemaIdOAUTH);
  };

  auth.isLoggedIn = function () {
    token=auth.getLocalData( 'token' + appSettings.sistemaId);
    tokenOAUTH=auth.getLocalData( 'token' + appSettings.sistemaIdOAUTH);
    if(token && tokenOAUTH){
      return true;
    }else{
      return false;
    }
  };

  auth.loginPermission = function ( ID_MENU ) {
    var deferred = $q.defer();
    var permisos = auth.getLocalData( 'permisos' + appSettings.sistemaId );
    var permiso = false;
    for (var i = 0; i < permisos.length; i++) {
      if (permisos[i]==ID_MENU) {
        permiso = true;
        break;
      }
    }
    if ( !permiso ) {
      deferred.reject( {status : 403 });
    } else {
      deferred.resolve();
    }
    return deferred.promise;
  };


  auth.getLocalData = function ( dataName ) {
              return localStorageService.get( dataName );
  };

  auth.saveLocalData = function ( dataName, data ) {
    var deferred = $q.defer();
    if(localStorageService.set( dataName, data)){
      deferred.resolve(true);
    }else{
      deferred.reject( false );
    }  
    return deferred.promise;        
  };

  auth.getIdUsuario = function(){
    var jwt = localStorageService.get( 'token' + appSettings.sistemaId );
   var jwtData = jwt.split('.')[1];
   var decodedJwtJsonData = window.atob(jwtData);
   var decodedJwtData = JSON.parse(decodedJwtJsonData);
   var ID_USUARIO = decodedJwtData.ID_USUARIO;
    if (ID_USUARIO) {
      return ID_USUARIO;
    }else{
       return -1;
    }
  };

   auth.validarPin = function( data ) {
        var deferred = $q.defer();
        $http.post( appSettings.restRRHH + 'catalogo/validapin', data )
        .then(successCallback, errorCallback);
            function successCallback(data){
                //success code
                deferred.resolve( data );
                //toastr.success("Consumi Servicio")
            }
            function errorCallback(error){
                //error code
                deferred.reject( error );
            }
        return deferred.promise;
    };  

  auth.getConstantes = function( ) {
        var deferred = $q.defer();
        $http.get( appSettings.restApiServiceBaseUri + 'Login/getConstantes')
        .then(successCallback, errorCallback);
            function successCallback(data){
                //success code
                deferred.resolve( data );
            }
            function errorCallback(error){
                //error code
                deferred.reject( error );
            }
        return deferred.promise;
  }; 

  auth.getSessionUsuario = function( p_id_sistema ) {
        var deferred = $q.defer();
        $http.get( appSettings.restOAUTH + 'Login/Sistema/'+p_id_sistema+'/getSessionUsuario')
        .then(successCallback, errorCallback);
            function successCallback(data){
                //success code
                deferred.resolve( data );
            }
            function errorCallback(error){
                //error code
                deferred.reject( error );
            }
        return deferred.promise;
  }; 
  

  return auth;

}]);

