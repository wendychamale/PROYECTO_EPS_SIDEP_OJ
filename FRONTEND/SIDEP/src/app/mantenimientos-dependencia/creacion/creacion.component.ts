import { Component, OnInit, Injector } from '@angular/core';
import { MatDatepickerModule, MatSelect, MatInput, MatButton, MatAutocomplete, MatChipInputEvent, MatAutocompleteSelectedEvent, MatTableDataSource, MatPaginator } from '@angular/material';
import { FormGroup, FormBuilder, Validators, ValidationErrors, FormControl, ValidatorFn, AbstractControl } from '@angular/forms';
import { Observable, Subscription, BehaviorSubject } from '../../../../node_modules/rxjs';
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
  lastModifiedDate: Date;
  name: string;
  webkitRelativePath: string;
  observ: string;
}
interface Filex1 extends Blob {
  lastModified: number;
  //lastModifiedDate: Date;
  name: string;
 // webkitRelativePath: string;
 // observ:string;
  
}

@Component({
  selector: 'app-creacion',
  templateUrl: './creacion.component.html',
  styleUrls: ['./creacion.component.scss']
})
export class CreacionComponent implements OnInit {

  creation: FormGroup;
  constantes;
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
  iniciaValDep = false;
  iniciaValPres = false;
  validaFecha = false;
  validaFechaPublica = false;
  checked = false;
  
  //Variables para verificar que usuario esta logueado
  viewSecrePresi=false;
  viewSecretaria=false;
  viewPresidencia=false;
  viewNominas = false;
  viewUcpas = false;
  viewCidej=false;
  viewCit=false;
  viewAdmin= false;
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
  selDepartamento;
  referencia;
  inicioVigRef;
  chkRefVigencia;
  idGestion;
  idGes;
  idEstado;
  idTipoGestion;
  areaSiguiente;
  
  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public authService: AuthService,
    public HttpClient: HttpClient,private fb: FormBuilder,  private _location: Location, private datePipe : DatePipe,
    private router: Router,private route:ActivatedRoute
  ) { 
    this.session=this.authService.getsession().SESSION;
    this.constantes = this.authService.getsession().CONSTANTES;
  }

  ngOnInit() {
    this.idGes = this.route.snapshot.paramMap.get('id');
    console.log("gestion"+this.idGes);
    this.valProfile();
    if(this.idGes!=null){
     console.log("Llamar a gestion continuar creacion");
     this.loadDependencia();
    }
     if(this.viewSecrePresi){
      this.creation = this.fb.group({
        floatLabel: this.floatLabelControl,
        codDependencia: [''],      
        codPresupuestario: [''],      
        nombreDep: ['', Validators.required],      
        cortoDep: ['', Validators.required],      
        gafeteDep: ['', Validators.required],      
        documentoDep: ['', Validators.required],      
        selConector: [''],      
        selFuncionalidad: [''],      
        selArea: [''],      
        fechaAcuerdo: ['', Validators.required],      
        inicioVigencia: [''],      
        selDepartamento: [''],      
        selMunicipio: [''],      
        referencia: [''],
        fechaPublicacion: [''],      
        inicioVigRef: [''],
        chkRefVigencia:['']      
      }); 
     } else if(this.viewUcpas){
      console.log("creation de ucpas");
      this.creation = this.fb.group({
        floatLabel: this.floatLabelControl,
        codDependencia: ['', Validators.required],      
        codPresupuestario: ['', Validators.required],      
        nombreDep: [''],      
        cortoDep: [''],      
        gafeteDep: [''],      
        documentoDep: [''],      
        selConector: ['', Validators.required],      
        selFuncionalidad: ['', Validators.required],      
        selArea: ['', Validators.required],      
        fechaAcuerdo: [''],      
        inicioVigencia: ['', Validators.required],      
        selDepartamento: ['', Validators.required],      
        selMunicipio: ['', Validators.required],      
        referencia: ['', Validators.required],
        fechaPublicacion: [''],      
        inicioVigRef: [''],
        chkRefVigencia:['']      
      }); 
     }else {
      this.creation = this.fb.group({
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
        inicioVigencia: ['', Validators.required],      
        selDepartamento: ['', Validators.required],      
        selMunicipio: ['', Validators.required],      
        referencia: ['', Validators.required],
        fechaPublicacion: [''],      
        inicioVigRef: [''],
        chkRefVigencia:['']      
      }); 
     }
    
    this.creation.get('codDependencia').valueChanges.subscribe((v)=> {if(v.length > 3){this.iniciaValDep = true }else{this.iniciaValDep = false}} );
    this.creation.get('codPresupuestario').valueChanges.subscribe((v)=> {if(v.length > 3){this.iniciaValPres = true }else{this.iniciaValPres = false}});

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
  
  valProfile(){
    // esto despues hay que quitarlo 
    this.viewSecretaria=false;
    this.viewPresidencia=false;
    this.viewUcpas = true;
    this.viewNominas = false;
    this.viewCidej=false;
    this.viewCit=false;
    this.viewAdmin =false;

  if(this.viewSecretaria|| this.viewPresidencia){
    this.viewSecrePresi=true;
  }
  if(this.viewAdmin){
    this.viewSecrePresi=true;
    this.viewUcpas = true;
  }

  if(this.viewCidej || this.viewCit||this.viewNominas){
    this.viewSecrePresi=false;
    this.viewUcpas = false;
  }
        for(var i=0; i<this.session.PERFILES.length; i++){
        /*   if(this.constantes.SNP == this.session.PERFILES[i].ID_PERFIL){
               this.viewNominas = true;
           }else if(this.constantes.UCPAS == this.session.PERFILES[i].ID_PERFIL){
            this.viewUcpas = true;
          }else if(this.constantes.ADMIN_UCPAS == this.session.PERFILES[i].ID_PERFIL){
            this.viewAdminUcpas = true;
          }*/
       }
      } 

  getMunicipio(event: any, valDepto: number) {
    this.creation.controls.selMunicipio.setValue(0);
    if (event.isUserInput) {
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

  asignaNombreDoc(valor: any) : void{
    this.creation.controls.documentoDep.setValue(valor);
  }  

  asignarRequerido(valor:any){
    if(this.checked){
      this.creation.controls.inicioVigRef.setValidators(Validators.required);
      this.creation.controls.inicioVigencia.setValidators([]);
      this.creation.controls.inicioVigencia.updateValueAndValidity();
    }else{
    this.creation.controls.inicioVigencia.setValidators(Validators.required);
    this.creation.controls.inicioVigRef.setValidators([]);
    this.creation.controls.inicioVigRef.updateValueAndValidity();
  }
  }

  get f() { return this.creation.controls; }



  crearDependencia(){
   let area=0;
   let area1="";
   if (this.viewPresidencia){
        //Area 2 representa a que es un area Administrativa
    area=2;
    area1="UCPAS"
   }else if (this.viewSecretaria){
        //Area 1 representa a que es un area Judicial
    area=1;
    area1="UCPAS"
   }else {
    area=this.creation.value.selArea;
    area1="UCPAS"
   }

    console.log("Entramos a crear dependencia "+ area);
      let dependencia={
        CODIGO_DEPENDENCIA:null,
        CODIGO_PRESUPUESTARIO:null,
        NOMBRE_DEPENDENCIA:this.creation.value.nombreDep.toUpperCase(),
        NOMBRE_GAFETE:this.creation.value.gafeteDep.toUpperCase(),
        NOMBRE_ABREVIADO:this.creation.value.cortoDep.toUpperCase(),
        NOMBRE_DOCUMENTO:this.creation.value.documentoDep.toUpperCase(),
        CONECTOR:'',
        FECHA_DEL_ACUERDO:this.datePipe.transform(this.creation.value.fechaAcuerdo, 'dd/MM/yyyy'),
        FECHA_ENTRA_VIGENCIA:this.datePipe.transform(this.creation.value.inicioVigencia, 'dd/MM/yyyy'),     
        FECHA_ANULACION:"",
        FECHA_PUBLICACION:this.datePipe.transform(this.creation.value.fechaPublicacion, 'dd/MM/yyyy'),
        OBS_FECHA_VIGENCIA:'',
        PROCESO_ESTADO_AREA:area1,
        REFERENCIA:'',
        FUNCION_UNIDAD:'',
        DEPARTAMENTO:null,
        MUNICIPIO:null,
        TIPO_AREA:area,
        IP:"",
        ID_USUARIO_REGISTRO:this.session.ID_USUARIO,
        ARCHIVO:"",
        NOMBRE_ARCHIVO:"",
        ID_SOLICITUD:""
       }

       if(this.files.length!=0){
        this.files.forEach(element => {   
          this.getBase64(element).then(
            data => {
  
              if(data){
  
                dependencia.NOMBRE_ARCHIVO = element.name;
                dependencia.ARCHIVO = data.toString();
                console.log("objeto " + dependencia); 
                this.saveDependencia(dependencia);
  
              }
            }
          );
        });    
      }

  }

  
  saveDependencia(dependencia){
    this.mantenimientoDependenciaService.insDependencia(dependencia).subscribe(
      data=>{
        if(data.result=='OK'){
          console.log("rsssssssss"+data.msj);
         swal("Solicitud de Dependencia Creada", data.msj, "success")
         this.router.navigate(['/mantenimientos/gestiones/1']);
        }else{
         swal("Error", data.msj, "error")
       }
      })
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
    let acuerdo = new Date(this.creation.value.fechaAcuerdo);
    let vigencia = new Date(this.creation.value.inicioVigencia);
    
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
    let acuerdo = new Date(this.creation.value.fechaAcuerdo);
    let publicacion = new Date(this.creation.value.fechaPublicacion);
    
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
    if(this.files.length==0 || this.validaCodDep || this.validaCodPres || this.validaFecha || this.validaFechaPublica){
         return true;
    }

    return false;
  }

  /* upload file*/
  accept = '*'
  //files: Filex[] = []
  files: Filex1[] = []
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
    this.router.navigate(['/mantenimientos/gestiones/1']);
  }
  
  loadDependencia(){
    this.mantenimientoDependenciaService.getGestDependencia(this.idGes).subscribe(
      data => {
        this.asignarData(data[0]);
       
      });
}
asignarData(data){

 // this.creation.controls['chkRefVigencia'].disable();     

  this.creation.controls.codDependencia.setValue(data.CODIGO_DEPENDENCIA!=null ? data.CODIGO_DEPENDENCIA:"");
  this.creation.controls.codPresupuestario.setValue(data.CODIGO_PRESUPUESTARIO!=null ? data.CODIGO_PRESUPUESTARIO:"");
  this.creation.controls.nombreDep.setValue(data.NOMBRE_DEPENDENCIA!=null ? data.NOMBRE_DEPENDENCIA:""); 
  this.creation.controls.cortoDep.setValue(data.NOMBRE_ABREVIADO!=null ? data.NOMBRE_ABREVIADO:"" );
  this.creation.controls.gafeteDep.setValue(data.NOMBRE_GAFETE!=null ? data.NOMBRE_GAFETE:"");
  this.creation.controls.documentoDep.setValue(data.NOMBRE_DOCUMENTO !=null ? data.NOMBRE_DOCUMENTO:"");
  this.creation.controls.selConector.setValue(data.CONECTOR!=null ? data.CONECTOR.trim().toUpperCase():"");
  this.creation.controls.fechaAcuerdo.setValue(data.FECHA_DEL_ACUERDO.length > 0 ? new Date(data.FECHA_DEL_ACUERDO) : ""); 
  this.creation.controls.referencia.setValue(data.REFERENCIA!=null ? data.REFERENCIA:"");
  this.creation.controls.selFuncionalidad.setValue(data.FUNCION_UNIDAD!=null ? (data.FUNCION_UNIDAD == 'N' ? 'JORNADA' : 'TURNO'):"");
  this.creation.controls.selDepartamento.setValue(data.DEPARTAMENTO!=null ?data.DEPARTAMENTO:"" );
  //this.idDepto = data.DEPARTAMENTO;
 // this.creation.controls.municipioDep.setValue(data.NOMBRE_MUNICIPIO);
  this.creation.controls.selMunicipio.setValue(data.MUNICIPIO!=null ?data.MUNICIPIO:"");
  this.creation.controls.selArea.setValue(data.TIPO_AREA!=null?data.TIPO_AREA:"");
  //this.creation.controls.areaDep.setValue(data.NOMBRE_AREA);
  this.idGestion = data.ID_GESTION_DEPENDENCIA;
 //this.observaciones = data.OBSERVACIONES;

  var nameFile = this.nombreArchivo(data.ACUERDO_DIGITAL);
  this.archivo(nameFile,this.idGestion);

  this.creation.controls.inicioVigencia.setValue(data.FECHA_ENTRA_VIGENCIA.length > 0 ? new Date(data.FECHA_ENTRA_VIGENCIA) : "");    
 // this.creation.controls.inicioDep.setValue(data.FECHA_ENTRA_VIGENCIA.length > 0 ? this.datePipe.transform(data.FECHA_ENTRA_VIGENCIA, 'dd/MM/yyyy') : "");    
  this.creation.controls.fechaPublicacion.setValue(data.FECHA_PUBLICACION.length > 0 ? new Date(data.FECHA_PUBLICACION) : ""); 
 // this.creation.controls.publicaDep.setValue(data.FECHA_PUBLICACION.length > 0 ? this.datePipe.transform(data.FECHA_PUBLICACION, 'dd/MM/yyyy') : ""); 
  this.creation.controls.chkRefVigencia.setValue(data.OBS_FECHA_VIGENCIA!=null ?data.OBS_FECHA_VIGENCIA:"");

 // this.checked = data.FECHA_ENTRA_VIGENCIA.length == 0;

  console.log('datos'+data);

}

nombreArchivo(ruta){
  var dataRuta = ruta.split("/");
  
  return dataRuta.length > 0 ? dataRuta[dataRuta.length - 1] : null;
}
archivo(nombre,id){

  let savedFile :Filex1; 
 

  this.mantenimientoDependenciaService.viewFile(id).subscribe(
    data => {      
      let blob: Blob = new Blob([data.body], { type: 'application/pdf'});
      
      var b = new File([blob],nombre, { type: 'application/pdf'});
      
      this.files.push(b);
  
    });    

}

//implementamos nuevos metodos para seguir con la creacion de una dependencia
CrearDependencia1(){
console.log("Crear dependencia continuacion.....");
if(this.viewUcpas){
  this.areaSiguiente='NOMINAS';
}

  let dependencia={
  
   ID_GESTION_DEPENDENCIA: this.idGestion,
   CODIGO_DEPENDENCIA:this.creation.value.codDependencia,
   CODIGO_PRESUPUESTARIO:this.creation.value.codPresupuestario,
   NOMBRE_DEPENDENCIA:this.creation.value.nombreDep.toUpperCase(),
   FECHA_ANULACION: null,
   REFERENCIA:this.creation.value.referencia.toUpperCase(),
   ID_USUARIO_REGISTRO:this.session.ID_USUARIO,
   IP:"",
   ARCHIVO:"",
   NOMBRE_ARCHIVO:"",     
   NOMBRE_GAFETE:this.creation.value.gafeteDep.toUpperCase(),
   NOMBRE_ABREVIADO:this.creation.value.cortoDep.toUpperCase(),
   NOMBRE_DOCUMENTO:this.creation.value.documentoDep.toUpperCase(),
   CONECTOR:this.creation.value.selConector,
   FECHA_DEL_ACUERDO:this.datePipe.transform(this.creation.value.fechaAcuerdo, 'dd/MM/yyyy'),
   FECHA_ENTRA_VIGENCIA:this.datePipe.transform(this.creation.value.inicioVigencia, 'dd/MM/yyyy'),
   FECHA_PUBLICACION:this.datePipe.transform(this.creation.value.fechaPublicacion, 'dd/MM/yyyy'),
   OBS_FECHA_VIGENCIA:this.creation.value.inicioVigRef.toUpperCase(),
   PROCESO_ESTADO_AREA: this.areaSiguiente,
   FUNCION_UNIDAD:this.creation.value.selFuncionalidad,
   DEPARTAMENTO:this.creation.value.selDepartamento,
   MUNICIPIO:this.creation.value.selMunicipio,
   TIPO_AREA:this.creation.value.selArea,
   ID_SOLICITUD:""
   }    
  console.log(dependencia);
  if(this.files.length>0){
    this.files.forEach(element => {   
      this.getBase64(element).then(
        data => {

          if(data){

            dependencia.NOMBRE_ARCHIVO = element.name;
            dependencia.ARCHIVO = data.toString();
            this.updateDependencia(dependencia);

          }
        }
      );
    });    
  }

}
updateDependencia(dependencia){
  console.log("entramos a terminar de crear una dependencia")
  this.mantenimientoDependenciaService.updateDependencia(dependencia).subscribe(
    data=>{
      if(data.result=='OK'){
       swal("Dependencia Creada Exitosamente", data.msj, "success")
       this.router.navigate(['/mantenimientos/gestiones/1']);
      }else{
       swal("Error", data.msj, "error")
     }
    })
}
}
