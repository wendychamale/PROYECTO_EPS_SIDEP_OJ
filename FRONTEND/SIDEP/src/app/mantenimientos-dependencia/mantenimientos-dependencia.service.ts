import { Injectable } from '@angular/core';
import { AppconfigService } from '../appconfig.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})

export class MantenimientosDependenciaService {

  getListaDepartamento(): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Catalogo/getDepartamentos')
      .pipe(
        catchError(this.handleError('getListaDepartamento', []))
      );
  }

  getListaMunicipio(depto): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Catalogo/Departamento/' + depto + '/getMunicipios')
      .pipe(
        catchError(this.handleError('getListaMunicipio', []))
      );
  }

  getListaArea(): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Catalogo/getDependenciaArea')
      .pipe(
        catchError(this.handleError('getListaArea', []))
      );
  }

  /*Valida códigos de dependencia (1) y presupuestarios (2)*/
  validaCodigosCreacion(valor, tipo): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Catalogo/Dependencia/' + valor + '/Valor/' + tipo + '/validaCodigoDependencia')
      .pipe(
        catchError(this.handleError('validaCodigosCreacion', []))
      );
  }

  insDependencia(dependencia): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'CreaDependencia/insDependencia', dependencia)
      .pipe(
        catchError(this.handleError('insDependencia', []))
      );
  }

  getGestDependencia(idGestion): Observable<any> {
    console.log("entramos a "+this.appSettings.restApiServiceBaseUri + 'CreaDependencia/getGestDependencia/' + idGestion + '/getGestion');
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'CreaDependencia/getGestDependencia/' + idGestion + '/getGestion')
      .pipe(
        catchError(this.handleError('getGestDependencia', []))
      );
  }

  getGestiones(idEstado, idTipo): Observable<any> {
    console.log('consultamos a ver dependencia'+this.appSettings.restApiServiceBaseUri + 'Dependencia/getProceso/' + idEstado + '/getTipo/' + idTipo);
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/getProceso/' + idEstado + '/getTipo/' + idTipo)
      .pipe(
        catchError(this.handleError('getGestDependencia', []))
      );
  }

  getGestionesArea(idEstado, idTipo, area): Observable<any> {
    console.log('consultamos a ver dependencia'+this.appSettings.restApiServiceBaseUri + 'Dependencia/getProcesoArea/' + idEstado + '/getTipo/' + idTipo+'/getArea/'+area);
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/getProcesoArea/' + idEstado + '/getTipo/' + idTipo+'/getArea/'+ area)
      .pipe(
        catchError(this.handleError('getGestDependencia', []))
      );
  }

  viewFile(idGestion): Observable<any> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      }),
      observe: 'response' as 'body',
      responseType: 'blob' as 'json'
    }; return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/' + idGestion + '/visualizarDocumento', httpOptions)
      .pipe(
        catchError(this.handleError('viewFile', []))
      );
  }

  viewFileDep(idDependencia): Observable<any> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      }),
      observe: 'response' as 'body',
      responseType: 'blob' as 'json'
    }; return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/' + idDependencia + '/visualizarDocumentoDep', httpOptions)
      .pipe(
        catchError(this.handleError('viewFile', []))
      );
  }
  
  updateDependencia(dependencia): Observable<any> {
    console.log('actualizamos');
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'CreaDependencia/modSolicitudDependencia', dependencia)
      .pipe(
        catchError(this.handleError('updateDependencia', []))
      );
  }

  updateActualizaDependencia(dependencia): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'ActualizaDependencia/modSolitudActDependencia', dependencia)
      .pipe(
        catchError(this.handleError('updateActualizaDependencia', []))
      );
  }

  updateBajaDependencia(dependencia): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'BajaDependencia/modSolitudBajaDependencia', dependencia)
      .pipe(
        catchError(this.handleError('updateBajaDependencia', []))
      );
  }

  updateRegulaDependencia(dependencia): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'RegulaDependencia/modSolicitudRegularizacion', dependencia)
      .pipe(
        catchError(this.handleError('updateRegulaDependencia', []))
      );
  }
  
  updateDependenciaNominal(dependencia): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'ActualizaDependencia/insSolitudActDependencia', dependencia)
      .pipe(
        catchError(this.handleError('updateDependenciaNominal', []))
      );
  }
  
  regulaDependencia(dependencia): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'RegulaDependencia/insSolicitudRegularizacion', dependencia)
      .pipe(
        catchError(this.handleError('regulaDependencia', []))
      );
  }

  bajaDependencia(dependencia): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'BajaDependencia/insSolitudBajaDependencia', dependencia)
      .pipe(
        catchError(this.handleError('bajaDependencia', []))
      );
  }
  
  rechazoGestion(gestion): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/rechazaSolicitud', gestion)
      .pipe(
        catchError(this.handleError('rechazoGestion', []))
      );
  }
  rechazoGestion1(gestion): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/rechazaSolicitudArea', gestion)
      .pipe(
        catchError(this.handleError('rechazoGestion', []))
      );
  }
  confirmarGestion(gestion): Observable<any> {
    console.log("estamos confirmarGestion"+gestion);
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'CreaDependencia/insDependenciaNominal', gestion)
      .pipe(
        catchError(this.handleError('confirmarGestion', []))
      );
  }

  confirmarBaja(gestion): Observable<any> {
    console.log("estamos en confirmabaja"+gestion);
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'BajaDependencia/procBajaDependencia', gestion)
      .pipe(
        catchError(this.handleError('confirmarBaja', []))
      );
  }

  confirmarActualizacion(gestion): Observable<any> {
    console.log("estamos confirmarActualizacion"+gestion);
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'ActualizaDependencia/procActDependencia', gestion)
      .pipe(
        catchError(this.handleError('confirmarActualizacion', []))
      );
  }
  
  confirmarRegularizacion(gestion): Observable<any> {
    console.log("estamos confirmarBaja"+gestion);
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'RegulaDependencia/insDependenciaNominal', gestion)
      .pipe(
        catchError(this.handleError('confirmarBaja', []))
      );
  }
  

  getDependencias(): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Catalogo/catalogoDependencias')
      .pipe(
        catchError(this.handleError('getDependencias', []))
      );
  }

  getDependenciasArea(area): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Catalogo/catalogoDependencias/getArea/'+area)
      .pipe(
        catchError(this.handleError('getDependencias', []))
      );
  }
  getDataDependencia(idDependencia): Observable<any> {
    console.log(this.appSettings.restApiServiceBaseUri + 'Dependencia/catalogoDependencias/'+ idDependencia +'/getDependencia');
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/catalogoDependencias/'+ idDependencia +'/getDependencia')
      .pipe(
        catchError(this.handleError('getDataDependencia', []))
      );
  }

  getValidaPlazasDep(idDependencia): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'BajaDependencia/' + idDependencia + '/getPlazaDependencia')
      .pipe(
        catchError(this.handleError('getValidaPlazasDep', []))
      );
  }
  
  getDepedenciasComplementos(): Observable<any> {
    console.log("consulta a-----"+this.appSettings.restApiServiceBaseUri + 'Catalogo/depCorreoCidej');
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Catalogo/depCorreoCidej')
      .pipe(
        catchError(this.handleError('getDepedenciasComplementos', []))
      );
  }

  correoDependencia(correoDep): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'DependeciaCorreo/insDependenciaCorreo', correoDep)
      .pipe(
        catchError(this.handleError('correoDependencia', []))
      );
  }

  codDespachoDependencia(codDespachoDep): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'DependeciaDespacho/insDependenciaDespacho', codDespachoDep)
      .pipe(
        catchError(this.handleError('codDespachoDependencia', []))
      );
  }

  getValidaDespacho(codDespacho): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/'+ codDespacho +'/validaDespacho')
      .pipe(
        catchError(this.handleError('getValidaDespacho', []))
      );
  }

  eliminarGestion(gestion): Observable<any> {
    return this.http.post<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/eliminarSolicitud', gestion)
      .pipe(
        catchError(this.handleError('eliminarGestion', []))
      );
  }

  getReferenciaDepRegularizar(codPres): Observable<any> {
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Dependencia/'+ codPres +'/getNombreDependencia')
      .pipe(
        catchError(this.handleError('getReferenciaDepRegularizar', []))
      );
  }
  
  constructor(private http: HttpClient, private appSettings: AppconfigService) { }
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(error); // log to console instead
      return of(result as T);
    };
  }

}