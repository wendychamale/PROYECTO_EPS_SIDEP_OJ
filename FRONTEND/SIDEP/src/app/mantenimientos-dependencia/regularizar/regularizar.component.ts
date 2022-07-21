import { Component, OnInit } from '@angular/core';
import { MatDatepickerModule, MatSelect, MatInput, MatButton, MatAutocomplete, MatChipInputEvent, MatAutocompleteSelectedEvent, MatTableDataSource, MatPaginator } from '@angular/material';
import { FormGroup, FormBuilder, Validators, ValidationErrors, FormControl, ValidatorFn, AbstractControl } from '@angular/forms';
import { Observable, Subscription } from '../../../../node_modules/rxjs';
import { HttpEvent, HttpRequest, HttpClient, HttpResponse } from '../../../../node_modules/@angular/common/http';
import { ngf } from "angular-file"
import { DatePipe, Location } from '@angular/common';
import swal from 'sweetalert2';
import { MantenimientosDependenciaService } from '../mantenimientos-dependencia.service';
import { AuthService } from '../../recursos/auth.service';
import { Router, ActivatedRoute } from '@angular/router';

interface Funcionalidad {
  value: string;
  viewValue: string;
}

interface Conector {
  value: string;
  viewValue: string;
}

interface Filex extends Blob {
 // lastModified: number;
 // lastModifiedDate: Date;
  name: string;
 // webkitRelativePath: string;
 // observ: string;
}


@Component({
  selector: 'app-regularizar',
  templateUrl: './regularizar.component.html',
  styleUrls: ['./regularizar.component.scss']
})
export class RegularizarComponent implements OnInit {

  regularizar: FormGroup;
  //hideRequiredControl = new FormControl(false);
  floatLabelControl = new FormControl('none');
  departamentos;
  listArea;
  municipios;
  ngf: ngf;
  validaCodDep=false;
  validaCodPres=false;
  valDepto;
  session;
  idDepto=0;
  idMuni=0;
  idDependencia;
  validaFecha = false;
  validaFechaPublica = false;
  checked = false;

/* Controles */
  codDependencia;
  codPresupuestario;
  nombreDep;
  cortoDep;
  gafeteDep;
  documentoDep;
  selConector;
  selFuncionalidad;
  selArea;
  fechaAcuerdo;
  fechaPublicacion;
  inicioVigencia;
  selMunicipio;
  municipioDep;
  selDepartamento;
  departametoDep;
  referencia;
  inicioVigRef;
  chkRefVigencia;

  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public authService: AuthService,
    public HttpClient: HttpClient,private fb: FormBuilder,  private _location: Location, private datePipe : DatePipe,
    private router: Router,private route:ActivatedRoute
  ) { 
    this.session=this.authService.getsession().SESSION;
  }

  ngOnInit() {

    this.idDependencia = this.route.snapshot.paramMap.get('id');
    
    this.regularizar = this.fb.group({
      //hideRequired: this.hideRequiredControl,
      floatLabel: this.floatLabelControl,
      codDependencia: ['', Validators.required],      
      codPresupuestario: ['', Validators.required],      
      nombreDep: ['', Validators.required],      
      cortoDep: ['', Validators.required],      
      gafeteDep: ['', Validators.required],      
      documentoDep: ['', Validators.required],      
      selConector: ['', Validators.required],      
      selFuncionalidad: ['', Validators.required],      
      selArea: ['', Validators.required],      
      fechaAcuerdo: ['', Validators.required],      
      //selDepartamento: ['', Validators.required],      
      //selMunicipio: ['', Validators.required],      
      departamentoDep: ['', Validators.required],      
      municipioDep: ['', Validators.required],      
      referencia: ['', Validators.required],      
      inicioVigencia: [''],
      fechaPublicacion: [''],      
      inicioVigRef: [''],
      chkRefVigencia:['']            
    });

    this.loadDependencia();

    this.mantenimientoDependenciaService.getListaDepartamento().subscribe(
      data => {
        this.departamentos = data;
      });

    this.mantenimientoDependenciaService.getListaArea().subscribe(
      data => {
        this.listArea = data;
      });

  }

  listFuncionalidad: Funcionalidad[] = [
    { value: 'T', viewValue: 'TURNO' },
    { value: 'N', viewValue: 'JORNADA' }
  ];

  listConector: Conector[] = [
    { value: 'DE', viewValue: 'DE' },
    { value: 'DEL', viewValue: 'DEL' },
    { value: 'DE LA', viewValue: 'DE LA' }
  ];

  loadDependencia(){
    this.mantenimientoDependenciaService.getDataDependencia(this.idDependencia).subscribe(
      data => {
        if(data.length>0){
        this.asignarData(data[0]);
        }else{ 
          swal("Error", data.msj, "error")
        }
      });
}

asignarData(data){
  this.regularizar.controls.codDependencia.setValue(data.DEPENDENCIA);
  this.regularizar.controls.codPresupuestario.setValue(data.CODIGO_PRESUPUESTARIO);
  this.regularizar.controls.nombreDep.setValue(data.NOMBRE_DEPENDENCIA); 
  this.regularizar.controls.gafeteDep.setValue(data.NOMBRE_GAFETE);
  this.regularizar.controls.cortoDep.setValue(data.NOMBRE_ABREVIADO);
  this.regularizar.controls.documentoDep.setValue(data.NOMBRE_DEPENDENCIA_DOCUMENTO);
  this.regularizar.controls.selConector.setValue(data.CONECTOR_DEPENDENCIA.trim().toUpperCase());
  this.regularizar.controls.selFuncionalidad.setValue(data.FUNCION_UNIDAD);
  this.idDepto = data.DEPARTAMENTO;
  this.idMuni = data.MUNICIPIO;
  this.regularizar.controls.selArea.setValue(data.ID_AREA);
  this.regularizar.controls.inicioVigencia.setValue(data.FECHA_ENTRA_VIGENCIA.length > 0 ? new Date(data.FECHA_ENTRA_VIGENCIA):"");
  this.regularizar.controls.fechaAcuerdo.setValue(data.FECHA_CREACION_DEPENDENCIA.length > 0 ? new Date(data.FECHA_CREACION_DEPENDENCIA):"");
  this.regularizar.controls.fechaPublicacion.setValue(data.FECHA_PUBLICACION.length > 0 ? new Date(data.FECHA_PUBLICACION):"");
  this.regularizar.controls.inicioVigRef.setValue(data.OBS_FECHA_VIGENCIA);
  this.regularizar.controls.departamentoDep.setValue(this.idDepto != 0 ? data.NOMBRE_DEPARTAMENTO : "");
  this.regularizar.controls.municipioDep.setValue(this.idMuni != 0 ? data.NOMBRE_MUNICIPIO : "");
  
}

nombreArchivo(ruta){
    var dataRuta = ruta.split("/");
    
    return dataRuta.length > 0 ? dataRuta[dataRuta.length - 1] : null;
}

archivo(nombre, idDependencia){

  this.mantenimientoDependenciaService.viewFileDep(idDependencia).subscribe(
    data => {      
      if(data.length > 0){
        let blob: Blob = new Blob([data.body], { type: 'application/pdf'});
      var b = new File([blob],nombre, { type: 'application/pdf'});
      this.files.push(b);
      }  
    });    

}

regularizarDependencia(){

  let dependencia={
   CODIGO_DEPENDENCIA:this.regularizar.value.codDependencia,
   CODIGO_PRESUPUESTARIO:this.regularizar.value.codPresupuestario,
   NOMBRE_DEPENDENCIA:this.regularizar.value.nombreDep.toUpperCase(),
   NOMBRE_GAFETE:this.regularizar.value.gafeteDep.toUpperCase(),
   NOMBRE_ABREVIADO:this.regularizar.value.cortoDep.toUpperCase(),
   NOMBRE_DOCUMENTO:this.regularizar.value.documentoDep.toUpperCase(),
   CONECTOR:this.regularizar.value.selConector,
   FECHA_DEL_ACUERDO:this.datePipe.transform(this.regularizar.value.fechaAcuerdo, 'dd/MM/yyyy'),
   FECHA_ENTRA_VIGENCIA:this.datePipe.transform(this.regularizar.value.inicioVigencia, 'dd/MM/yyyy'),
   FECHA_PUBLICACION:this.datePipe.transform(this.regularizar.value.fechaPublicacion, 'dd/MM/yyyy'),
   OBS_FECHA_VIGENCIA:this.regularizar.value.inicioVigRef.toUpperCase(),
   FECHA_ANULACION:"",
   REFERENCIA:this.regularizar.value.referencia.toUpperCase(),
   FUNCION_UNIDAD:this.regularizar.value.selFuncionalidad,
   DEPARTAMENTO:this.idDepto,
   MUNICIPIO:this.idMuni,
   TIPO_AREA:this.regularizar.value.selArea,
   IP:"",
   ID_USUARIO_REGISTRO:this.session.ID_USUARIO,
   ARCHIVO:"",
   NOMBRE_ARCHIVO:"",
   ID_SOLICITUD:""
  }

  if(this.files.length>0){
    this.files.forEach(element => {   
      this.getBase64(element).then(
        data => {

          if(data){

            dependencia.NOMBRE_ARCHIVO = element.name;
            dependencia.ARCHIVO = data.toString();
        
            this.regularDependencia(dependencia);

          }
        }
      );
    });    
  }

}


regularDependencia(dependencia){
  this.mantenimientoDependenciaService.regulaDependencia(dependencia).subscribe(
    data=>{
      if(data.result=='OK'){
       swal("Solicitud de Regularización", data.msj, "success")
       this.router.navigate(['/mantenimientos/dependencias']);
      }else{
       swal("Error", data.msj, "error")
     }
    })
}



  getMunicipio(event: any, valDepto: number) {
    if (event.isUserInput) {
      if(valDepto !== this.idDepto){
        this.regularizar.controls.selMunicipio.setValue("");
        }
        this.mantenimientoDependenciaService.getListaMunicipio(valDepto).subscribe(
        data => {
          this.municipios = data;
        });
    }
  }


  valCodDep(valor : any): boolean{
    
    if(valor !== null && valor !== undefined &&  valor !== ""){
    this.mantenimientoDependenciaService.validaCodigosCreacion(valor,1).subscribe(
      data => {
        this.validaCodDep = data.id !== 0;       
      });
    }

    return this.validaCodDep;
  }


  valCodPres(valor : any): boolean{
    
    if(valor !== null && valor !== undefined &&  valor !== ""){
    this.mantenimientoDependenciaService.validaCodigosCreacion(valor,2).subscribe(
      data => {
        this.validaCodPres = data.id !== 0;       
      });
    }

    return this.validaCodPres;
  }

  asignaNombreDoc(valor: any) : void{
    this.regularizar.controls.documentoDep.setValue(valor);
  }  
  
  parseDate(dateString: any): any {
    if (dateString) {
      if(this.valDates()){
        swal("Fecha Inválida", "Fecha Inicio de Vigencia no puede ser anterior a Fecha de Acuerdo", "info")
        }
          return this.datePipe.transform(dateString, 'yyyy-MM-dd')
    } else {
        return null;
    }
  }

  parseDatePublicacion(dateString: any): any {
    if (dateString) {        
      if(this.valDatesPublicacion()){
      swal("Fecha Inválida", "Fecha de Publicación no puede ser anterior a Fecha de Acuerdo", "info")
      }
        return this.datePipe.transform(dateString, 'yyyy-MM-dd')
    } else {
        return null;
    }
  }
  
  valDates(){
    let acuerdo = new Date(this.regularizar.value.fechaAcuerdo);
    let vigencia = new Date(this.regularizar.value.inicioVigencia);
    
   this.validaFecha = false;
   
    if(acuerdo.getFullYear() > vigencia.getFullYear()){
      this.validaFecha = true;
    }else if(acuerdo.getMonth() == vigencia.getMonth() && acuerdo.getFullYear() == vigencia.getFullYear()){
      this.validaFecha = acuerdo.getDate() > vigencia.getDate();
    }else if(acuerdo.getMonth() > vigencia.getMonth() && acuerdo.getFullYear() == vigencia.getFullYear()){
      this.validaFecha = true;
    }

    return this.validaFecha;
  }

  valDatesPublicacion(){
    let acuerdo = new Date(this.regularizar.value.fechaAcuerdo);
    let publicacion = new Date(this.regularizar.value.fechaPublicacion);
    
   this.validaFechaPublica = false;
   
    if(acuerdo.getFullYear() > publicacion.getFullYear()){
      this.validaFechaPublica = true;
    }else if(acuerdo.getMonth() == publicacion.getMonth() && acuerdo.getFullYear() == publicacion.getFullYear()){
      this.validaFechaPublica = acuerdo.getDate() > publicacion.getDate();
    }else if(acuerdo.getMonth() > publicacion.getMonth() && acuerdo.getFullYear() == publicacion.getFullYear()){
      this.validaFechaPublica = true;
    }

    return this.validaFechaPublica;
  }

  asignarRequerido(valor:any){
    if(this.checked){
      this.regularizar.controls.inicioVigRef.setValidators(Validators.required);
      this.regularizar.controls.inicioVigencia.setValidators([]);
      this.regularizar.controls.inicioVigencia.updateValueAndValidity();
    }else{
    this.regularizar.controls.inicioVigencia.setValidators(Validators.required);
    this.regularizar.controls.inicioVigRef.setValidators([]);
    this.regularizar.controls.inicioVigRef.updateValueAndValidity();
  }
  }

  get f() { return this.regularizar.controls; }

  /* upload file*/
  accept = '*'
  files: Filex[] = []
  progress: number
  hasBaseDropZoneOver: boolean = false
  httpEmitter: Subscription
  httpEvent: HttpEvent<{}>
  lastFileAt: Date

  sendableFormData: FormData//populated via ngfFormData directive 

  cancel() {
    this.progress = 0
    if (this.httpEmitter) {
      //console.log('cancelled')
      this.httpEmitter.unsubscribe()
    }
  }

  getDate() {
    return new Date()
  }

  getBase64(file) {
    return new Promise((resolve, reject) => {
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => {
        let encoded = reader.result.toString().replace(/^data:(.*;base64,)?/, '');
        resolve(encoded);
      };
      reader.onerror = error => reject(error);
    });
  }

  /* fin upload file*/

  cancelar(){
    this.router.navigate(['/mantenimientos/dependencias']);
  }

}
