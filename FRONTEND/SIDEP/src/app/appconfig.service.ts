import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AppconfigService {

  constructor() { }
  
  //restApiServiceBaseUri= 'http://wsdesacit:8080/CCJ/webapi/' // REST Api
  //restApiServiceBaseUri= 'http://10.101.105.140:8080/SIDEP/webapi/' // REST Api
  restApiServiceBaseUri= 'http://localhost:8080/SIDEP/webapi/' // REST Api
  restOAUTH = 'http://localhost:8080/OAUTH/webapi/' //oauth
  restRRHH = 'http://servicioscit.oj.gob.gt:8080/rrhh/' //rrhh prod
  //sistemaId = 18  //id sistema  oauth  CITBASE2 16
  sistemaId = 54  //id sistema  oauth  CITBASE2 16
  sistemaIdOAUTH = 2  //id sistema  oauth
  sistemaIdRRHH = 33
  
  Sistema: 'SIDEP'
//  Sistema: 'CCJ'

}
