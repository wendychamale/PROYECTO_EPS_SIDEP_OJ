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

interface Filex extends Blob {
   lastModified: number;
   lastModifiedDate: Date;
   name: string;
   webkitRelativePath: string;
   observ: string;
 }
 
@Component({
  selector: 'app-baja',
  templateUrl: './baja.component.html',
  styleUrls: ['./baja.component.scss']
})
export class BajaComponent implements OnInit {

  baja: FormGroup;
  floatLabelControl = new FormControl('none');
  departamentos;
  listArea;
  municipios;
  ngf: ngf;
  soloLectura=true;
  valDepto;
  session;
  idDependencia;

/* Controles */
  codDependencia;
  codPresupuestario;
  nombreDep;
  funcionalidad;
  area;
  fechaAcuerdo;
  inicioVigencia;
  municipio;
  departamento;
  referencia;

  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public authService: AuthService,
    public HttpClient: HttpClient,private fb: FormBuilder,  private _location: Location, private datePipe : DatePipe,
    private router: Router,private route:ActivatedRoute
   ) { 
    this.session=this.authService.getsession().SESSION;
  }

  ngOnInit() {

    this.idDependencia = this.route.snapshot.paramMap.get('id');

    this.baja = this.fb.group({
      //hideRequired: this.hideRequiredControl,
      floatLabel: this.floatLabelControl,
      codDependencia: ['', Validators.required],      
      codPresupuestario: ['', Validators.required],      
      nombreDep: ['', Validators.required],      
      funcionalidad: ['', Validators.required],      
      area: ['', Validators.required],      
      fechaAcuerdo: ['', Validators.required],      
      fechaAnulacion: ['', Validators.required],      
      departamento: ['', Validators.required],      
      municipio: ['', Validators.required],      
      referencia: ['', Validators.required],      
      inicioVigencia: ['']      
    });

    this.loadDependencia();

  }

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
  this.baja.controls.codDependencia.setValue(data.DEPENDENCIA);
  this.baja.controls.codPresupuestario.setValue(data.CODIGO_PRESUPUESTARIO);
  this.baja.controls.nombreDep.setValue(data.NOMBRE_DEPENDENCIA); 
  this.baja.controls.fechaAcuerdo.setValue(new Date(data.FECHA_CREACION_DEPENDENCIA)); 
 // this.baja.controls.referencia.setValue(data.REFERENCIA);
  this.baja.controls.funcionalidad.setValue(data.FUNCION_UNIDAD == 'N' ? 'JORNADA' : 'TURNO');
  this.baja.controls.departamento.setValue(data.NOMBRE_DEPARTAMENTO);
  this.baja.controls.municipio.setValue(data.NOMBRE_MUNICIPIO);
  this.baja.controls.area.setValue(data.NOMBRE_AREA);
  this.baja.controls.inicioVigencia.setValue(data.FECHA_ENTRA_VIGENCIA != "" || data.FECHA_ENTRA_VIGENCIA != undefined ? this.datePipe.transform(new Date(data.FECHA_ENTRA_VIGENCIA), 'dd/MM/yyyy') : "");

}

parseDate(dateString: any): any {
  if (dateString) {        
      return this.datePipe.transform(dateString, 'yyyy-MM-dd')
  } else {
      return null;
  }
}

bajaDependencia(){

  let dependencia={
     
    CODIGO_DEPENDENCIA:this.baja.value.codDependencia,
    CODIGO_PRESUPUESTARIO:this.baja.value.codPresupuestario,
    NOMBRE_DEPENDENCIA:this.baja.value.nombreDep.toUpperCase(),
    FECHA_ANULACION:this.datePipe.transform(this.baja.value.fechaAnulacion, 'dd/MM/yyyy'),
    REFERENCIA:this.baja.value.referencia.toUpperCase(),
    IP:"",
    ID_USUARIO_REGISTRO:this.session.ID_USUARIO,
    ARCHIVO:"",
    NOMBRE_ARCHIVO:""
   }

   if(this.files.length!=0){
     this.files.forEach(element => {   
       this.getBase64(element).then(
         data => {

           if(data){

             dependencia.NOMBRE_ARCHIVO = element.name;
             dependencia.ARCHIVO = data.toString();
         
             this.serviceBajaDependencia(dependencia);

           }
         }
       );
     });    
   } 

}

serviceBajaDependencia(dependencia){
  console.log("daremos de baja");

  this.mantenimientoDependenciaService.bajaDependencia(dependencia).subscribe(
    data=>{
      if(data.result=='OK'){
       swal("Baja de Dependencia", data.msj, "success")
       this.router.navigate(['/mantenimientos/dependencias']);
      }else{
       swal("Error", data.msj, "error")
     }
    })

}


  validaPlazasDependencia(){
    this.mantenimientoDependenciaService.getValidaPlazasDep(this.idDependencia).subscribe(
      data=>{
        if(data.result=='ok'){
          this.bajaDependencia();
        }else{
         swal("Error", data.msj, "error")
       }
      })      
  }

  get f() { return this.baja.controls; }

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
