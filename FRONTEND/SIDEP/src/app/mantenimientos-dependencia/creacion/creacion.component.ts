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
  viewSecretaria=false;
  viewPresidencia=false;
  viewNominas = false;
  viewUcpas = false;
  viewCidej=false;
  viewCit=false;
  viewAdminUcpas = false;
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
    
  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public authService: AuthService,
    public HttpClient: HttpClient,private fb: FormBuilder,  private _location: Location, private datePipe : DatePipe,
    private router: Router,private route:ActivatedRoute
  ) { 
    this.session=this.authService.getsession().SESSION;
    this.constantes = this.authService.getsession().CONSTANTES;
  }

  ngOnInit() {

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
      this.valProfile();
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
    
    this.viewSecretaria=true;
    this.viewPresidencia=false;
    this.viewNominas = false;
    this.viewUcpas = false;
    this.viewCidej=false;
    this.viewCit=false;
    this.viewAdminUcpas =false;
    
    if(this.viewSecretaria || this.viewPresidencia){
      console.log("Presidencia,Secretaria");
      this.creation.controls['nombreDep'].enable();
      this.creation.controls['cortoDep'].enable();
      this.creation.controls['gafeteDep'].enable();
      this.creation.controls['documentoDep'].enable();
      this.creation.controls['fechaAcuerdo'].enable();
      this.creation.controls['inicioVigencia'].enable();
      this.creation.controls['fechaPublicacion'].enable();

      this.creation.controls['codDependencia'].disable();
      this.creation.controls['codPresupuestario'].disable();
      this.creation.controls['selConector'].disable();
      this.creation.controls['selFuncionalidad'].disable();
      this.creation.controls['selArea'].disable();
      this.creation.controls['selDepartamento'].disable();
      this.creation.controls['selMunicipio'].disable();
      this.creation.controls['referencia'].disable();
      this.creation.controls['inicioVigRef'].disable();
      this.creation.controls['chkRefVigencia'].disable();     
    }
    if(this.viewUcpas){
      console.log("UCPAS");
      this.creation.controls['codDependencia'].enable();
      this.creation.controls['codPresupuestario'].enable();
      this.creation.controls['selConector'].enable();
      this.creation.controls['selFuncionalidad'].enable();
      this.creation.controls['selArea'].enable();
      this.creation.controls['selMunicipio'].enable();
      this.creation.controls['referencia'].enable();
      this.creation.controls['selDepartamento'].enable();

      this.creation.controls['nombreDep'].disable();
      this.creation.controls['inicioVigencia'].disable();
      this.creation.controls['cortoDep'].disable();
      this.creation.controls['gafeteDep'].disable();
      this.creation.controls['documentoDep'].disable();
      this.creation.controls['fechaAcuerdo'].disable();
      this.creation.controls['fechaPublicacion'].disable();
      this.creation.controls['inicioVigRef'].disable();
      this.creation.controls['chkRefVigencia'].disable();   
    }

    if(this.viewAdminUcpas){
      console.log("admin UCPAS");
      this.creation.controls['codDependencia'].enable();
      this.creation.controls['codPresupuestario'].enable();
      this.creation.controls['selConector'].enable();
      this.creation.controls['selFuncionalidad'].enable();
      this.creation.controls['selArea'].enable();
      this.creation.controls['selMunicipio'].enable();
      this.creation.controls['referencia'].enable();
      this.creation.controls['selDepartamento'].enable();

      this.creation.controls['nombreDep'].enable();
      this.creation.controls['inicioVigencia'].enable();
      this.creation.controls['cortoDep'].enable();
      this.creation.controls['gafeteDep'].enable();
      this.creation.controls['documentoDep'].enable();
      this.creation.controls['fechaAcuerdo'].enable();
      this.creation.controls['fechaPublicacion'].enable();
      this.creation.controls['inicioVigRef'].enable();
      this.creation.controls['chkRefVigencia'].enable();   
    }
        for(var i=0; i<this.session.PERFILES.length; i++){
           if(this.constantes.SNP == this.session.PERFILES[i].ID_PERFIL){
               this.viewNominas = true;
           }else if(this.constantes.UCPAS == this.session.PERFILES[i].ID_PERFIL){
            this.viewUcpas = true;
          }else if(this.constantes.ADMIN_UCPAS == this.session.PERFILES[i].ID_PERFIL){
            this.viewAdminUcpas = true;
          }
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
   let area=1;

   if (this.viewPresidencia){
    area=2;
   }
    console.log("Entramos a crear dependencia ");
    if (this.viewPresidencia || this.viewSecretaria){
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
        PROCESO_ESTADO_AREA:'UCPAS',
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
   
    if (this.viewUcpas){
      let dependencia={
    

        CODIGO_DEPENDENCIA:this.creation.value.codDependencia,
        CODIGO_PRESUPUESTARIO:this.creation.value.codPresupuestario,
        NOMBRE_DEPENDENCIA:this.creation.value.nombreDep.toUpperCase(),
        NOMBRE_GAFETE:this.creation.value.gafeteDep.toUpperCase(),
        NOMBRE_ABREVIADO:this.creation.value.cortoDep.toUpperCase(),
        NOMBRE_DOCUMENTO:this.creation.value.documentoDep.toUpperCase(),
        CONECTOR:this.creation.value.selConector,
        FECHA_DEL_ACUERDO:this.datePipe.transform(this.creation.value.fechaAcuerdo, 'dd/MM/yyyy'),
        FECHA_ENTRA_VIGENCIA:this.datePipe.transform(this.creation.value.inicioVigencia, 'dd/MM/yyyy'),     
        FECHA_ANULACION:"",
        FECHA_PUBLICACION:this.datePipe.transform(this.creation.value.fechaPublicacion, 'dd/MM/yyyy'),
        OBS_FECHA_VIGENCIA:this.creation.value.inicioVigRef.toUpperCase(),
        REFERENCIA:this.creation.value.referencia.toUpperCase(),
        FUNCION_UNIDAD:this.creation.value.selFuncionalidad,
        DEPARTAMENTO:this.creation.value.selDepartamento,
        MUNICIPIO:this.creation.value.selMunicipio,
        TIPO_AREA:this.creation.value.selArea,
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
    this.router.navigate(['/mantenimientos/gestiones/1']);
  }
  
}
