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
  lastModified: number;
  //lastModifiedDate: Date;
  name: string;
 // webkitRelativePath: string;
 // observ:string;
  
}

@Component({
  selector: 'app-actualizacion-nominal',
  templateUrl: './actualizacion-nominal.component.html',
  styleUrls: ['./actualizacion-nominal.component.scss']
})
export class ActualizacionNominalComponent implements OnInit {

  updateNominal: FormGroup;
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
  idDepto;
  idDependencia;
  idGestion;
  idGes;
  idTipoGestion;
  iniciaValDep = false;
  iniciaValPres = false;
  validaFecha = false;
  divFechas = "class='row row-cols-2'";
  observaciones;
  validaFechaPublica = false;
  checked = false;
  archivoPrevio = false;

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
  muncipioDep;
  selDepartamento;
  departamentoDep;
  referencia;
  fechaAnulacion;
  inicioVigRef;
  chkRefVigencia;
areaActual;

//Variables para verificar que usuario esta logueado
viewSecrePresi=false;
viewSecretaria=false;
viewPresidencia=false;
viewNominas = false;
viewUcpas = false;
viewCidej=false;
viewCit=false;
viewAdmin=false;

  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public authService: AuthService,
    public HttpClient: HttpClient,private fb: FormBuilder,  private _location: Location, private datePipe : DatePipe,
    private router: Router,private route:ActivatedRoute
  ) { 
    this.session=this.authService.getsession().SESSION;
  }

  ngOnInit() {

    this.idGes = this.route.snapshot.paramMap.get('id');
    this.idTipoGestion = this.route.snapshot.paramMap.get('idTipoGestion');
    this.idDependencia = this.route.snapshot.paramMap.get('id');

    this.updateNominal = this.fb.group({
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
      departamentoDep: ['', Validators.required],      
      //selMunicipio: ['', Validators.required],      
      municipioDep: ['', Validators.required],      
      referencia: ['', Validators.required],      
      //fechaAnulacion: ['', Validators.required],      
      inicioVigencia: ['', Validators.required],
      fechaPublicacion:[''],      
      inicioVigRef: [''],
      chkRefVigencia:['']      
    });
 
    this.valProfile();
    this.updateNominal.get('codDependencia').valueChanges.subscribe((v)=> {if(v.length > 3){this.iniciaValDep = true }else{this.iniciaValDep = false}} );
    this.updateNominal.get('codPresupuestario').valueChanges.subscribe((v)=> {if(v.length > 3){this.iniciaValPres = true }else{this.iniciaValPres = false}});
    
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

  valProfile() {
    // esto despues hay que quitarlo 

this.viewSecretaria=false;
this.viewPresidencia=false;
this.viewUcpas = true;
this.viewNominas = false;
this.viewCidej=false;
this.viewCit=false;
this.viewSecrePresi=false;
this.viewAdmin=false;

if (this.viewPresidencia){
  this.viewSecrePresi=true;
  this.areaActual="PRESIDENCIA"
 }else if (this.viewSecretaria){
  this.viewSecrePresi=true;
  this.areaActual="SECRETARIA"
 }else if (this.viewUcpas){
 this.areaActual="UCPAS"
 }else if (this.viewNominas){
  this.viewSecrePresi=false;
  this.viewUcpas = false;
  this.areaActual="NOMINAS"
 }else if (this.viewAdmin){
this.viewSecrePresi=true;
this.viewUcpas = true;
this.areaActual="UCPAS"
}

if(this.viewCidej || this.viewCit||this.viewNominas){
  this.viewSecrePresi=false;
  this.viewUcpas = false;
}
  /*  for (var i = 0; i < this.session.PERFILES.length; i++) {
      if (this.constantes.SNP == this.session.PERFILES[i].ID_PERFIL) {
        this.viewNominas = true;
      } else if (this.constantes.UCPAS == this.session.PERFILES[i].ID_PERFIL) {
        this.viewUcpas = true;
      }
    }*/
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
    console.log("load Dependencia");
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

    this.updateNominal.controls.codDependencia.setValue(data.DEPENDENCIA);
    this.updateNominal.controls.codPresupuestario.setValue(data.CODIGO_PRESUPUESTARIO);
    this.updateNominal.controls.nombreDep.setValue(data.NOMBRE_DEPENDENCIA); 
    this.updateNominal.controls.gafeteDep.setValue(data.NOMBRE_GAFETE);
    this.updateNominal.controls.cortoDep.setValue(data.NOMBRE_ABREVIADO);
    this.updateNominal.controls.documentoDep.setValue(data.NOMBRE_DEPENDENCIA_DOCUMENTO);
    this.updateNominal.controls.selConector.setValue(data.CONECTOR_DEPENDENCIA.trim().toUpperCase());
    this.updateNominal.controls.fechaAcuerdo.setValue(new Date(data.FECHA_CREACION_DEPENDENCIA)); 
    this.updateNominal.controls.referencia.setValue(data.REFERENCIA);
    this.updateNominal.controls.selFuncionalidad.setValue(data.FUNCION_UNIDAD);
    this.updateNominal.controls.departamentoDep.setValue(data.NOMBRE_DEPARTAMENTO);
    this.updateNominal.controls.municipioDep.setValue(data.NOMBRE_MUNICIPIO);
    this.updateNominal.controls.selArea.setValue(data.ID_AREA);
   // this.updateNominal.controls.fechaAnulacion.setValue(new Date(data.FECHA_ANULACION));

   this.archivoPrevio = data.ACUERDO_DIGITAL.length > 0;

    var nameFile = this.nombreArchivo(data.ACUERDO_DIGITAL);
    this.archivo(nameFile,this.idDependencia);

    this.updateNominal.controls.inicioVigencia.setValue(data.FECHA_ENTRA_VIGENCIA.length > 0 ? new Date(data.FECHA_ENTRA_VIGENCIA) : "");    
    this.updateNominal.controls.fechaPublicacion.setValue(data.FECHA_PUBLICACION.length > 0 ? new Date(data.FECHA_PUBLICACION):"");
    this.updateNominal.controls.inicioVigRef.setValue(data.OBS_FECHA_VIGENCIA);
    }

  nombreArchivo(ruta){
      var dataRuta = ruta.split("/");
      return dataRuta.length > 0 ? dataRuta[dataRuta.length - 1] : null;
  }

  archivo(nombre,id){
    console.log(" ruta nombre " + nombre);

   if(nombre.length > 0){
    this.mantenimientoDependenciaService.viewFileDep(id).subscribe(
      data => {      
        if(data){
          let blob: Blob = new Blob([data.body], { type: 'application/pdf'});        
        var b = new File([blob],nombre, { type: 'application/pdf'});              
        this.files.push(b);    

        }
      });    
    }
      console.log("archivo cargado" + this.files.length);

  }

  actualizarDependencia(){

    let dependencia={
     CODIGO_DEPENDENCIA:this.updateNominal.value.codDependencia,
     CONECTOR:this.updateNominal.value.selConector,
     FECHA_DEL_ACUERDO:this.datePipe.transform(this.updateNominal.value.fechaAcuerdo, 'dd/MM/yyyy'),
     FECHA_ENTRA_VIGENCIA:this.datePipe.transform(this.updateNominal.value.inicioVigencia, 'dd/MM/yyyy'),
     FECHA_PUBLICACION:this.datePipe.transform(this.updateNominal.value.fechaPublicacion, 'dd/MM/yyyy'),
     PROCESO_ESTADO_AREA: this.areaActual,
     OBS_FECHA_VIGENCIA:this.updateNominal.value.inicioVigRef.toUpperCase(),
     REFERENCIA:this.updateNominal.value.referencia.toUpperCase(),
     FUNCION_UNIDAD:this.updateNominal.value.selFuncionalidad,
     TIPO_AREA:this.updateNominal.value.selArea,
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
          
              this.updateNominalDependencia(dependencia);

            }
          }
        );
      });    
    }

  }


  updateNominalDependencia(dependencia){
    console.log("actualizamos la nominal");
    this.mantenimientoDependenciaService.updateDependenciaNominal(dependencia).subscribe(
      data=>{
        console.log(data.result);
        if(data.result=='OK'){
         swal("Dependencia Nominal Actualizada", data.msj, "success")
         this.router.navigate(['/mantenimientos/dependencias']);
        }else{
         swal("Error", data.msj, "error")
       }
      })
  }

  getMunicipio(event: any, valDepto: number) {
    if (event.isUserInput) {

      if(valDepto !== this.idDepto){
      this.updateNominal.controls.selMunicipio.setValue("");
      }
      this.mantenimientoDependenciaService.getListaMunicipio(valDepto).subscribe(
        data => {
          this.municipios = data;
        });
      
    }
  }


  valCodDep(valor : any): boolean{
    
    if(valor !== null && valor !== undefined &&  valor !== "" && this.iniciaValDep){
    this.mantenimientoDependenciaService.validaCodigosCreacion(valor,1).subscribe(
      data => {
        this.validaCodDep = data.id !== 0;       
      });

    }else{
      this.validaCodDep = false;
    }

    return this.validaCodDep;
  }


  valCodPres(valor : any): boolean{
    
    if(valor !== null && valor !== undefined &&  valor !== "" && this.iniciaValPres){
    this.mantenimientoDependenciaService.validaCodigosCreacion(valor,2).subscribe(
      data => {
        this.validaCodPres = data.id !== 0;       
      });
    }else{
      this.validaCodPres = false;
    }

    return this.validaCodPres;
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
    let acuerdo = new Date(this.updateNominal.value.fechaAcuerdo);
    let vigencia = new Date(this.updateNominal.value.inicioVigencia);
    
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
    let acuerdo = new Date(this.updateNominal.value.fechaAcuerdo);
    let publicacion = new Date(this.updateNominal.value.fechaPublicacion);
    
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
  
  verificaValidaciones(){
    if(this.files.length==0 || this.validaCodDep || this.validaCodPres || this.validaFecha){
         return true;
    }

    return false;
  }

  get f() { return this.updateNominal.controls; }

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


  viewPdf(nombre){
    this.mantenimientoDependenciaService.viewFileDep(this.idDependencia).subscribe(
      data => {
      
        let blob: Blob = new Blob([data.body], { type: 'application/pdf' });
        var fileURL = window.URL.createObjectURL(blob);
        
        let pdfWindow = window.open("");
        pdfWindow.document.write("<iframe  width='100%' height='100%' src='" + fileURL+"'></iframe>")
        //pdfWindow.document.write(fileURL);
        pdfWindow.document.title = "Acuerdo " + nombre;
        
      });
  }


  cancelar(){
    this.router.navigate(['/mantenimientos/dependencias']);
  }

}
