import { Injectable } from '@angular/core';
import { AppconfigService } from '../appconfig.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class OrganigramaServiceService {
 
  getNodosPadre(): Observable<any> {
    //console.log("entramos a "+this.appSettings.restApiServiceBaseUri + 'Organigrama/getPadreOrganigrama');
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Organigrama/getPadreOrganigrama')
      .pipe(
        catchError(this.handleError('getOrganigrama', []))
      );
  }
  getNodosHijos(idPadre): Observable<any> {
    //console.log("entramos a "+this.appSettings.restApiServiceBaseUri + 'Organigrama/getHijosOrganigrama/' + idPadre);
    return this.http.get<any>(this.appSettings.restApiServiceBaseUri + 'Organigrama/getHijosOrganigrama/' + idPadre)
      .pipe(
        catchError(this.handleError('getOrganigrama', []))
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
