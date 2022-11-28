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
  selector: 'app-actualizacion',
  templateUrl: './actualizacion.component.html',
  styleUrls: ['./actualizacion.component.scss']
})
export class ActualizacionComponent implements OnInit {

  update: FormGroup;
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
  idGestion;
  idGes;
  idEstado;
  idTipoGestion;
  iniciaValDep = false;
  iniciaValPres = false;
  validaFecha = false;
  divFechas = "class='row row-cols-2'";
  observaciones;
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
  conectorDep;
  selFuncionalidad;
  funcionDep;
  selArea;
  areaDep;
  fechaAcuerdo;
  acuerdoDep;
  inicioVigencia;
  inicioDep;
  selMunicipio;
  municipioDep;
  selDepartamento;
  departamentoDep;
  referencia;
  fechaAnulacion;
  fechaPublicacion;
  publicaDep;
  chkRefVigencia;
  inicioVigRef;
  areaActual;

  //Manejo de controles
  controlsLectura = [];
    //Variables para verificar que usuario esta logueado
    viewSecrePresi=false;
    viewSecretaria=false;
    viewPresidencia=false;
    viewNominas = false;
    viewUcpas = false;
    viewCidej=false;
    viewCit=false;
    viewAdmin= false;

  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public authService: AuthService,
    public HttpClient: HttpClient,private fb: FormBuilder,  private _location: Location, private datePipe : DatePipe,
    private router: Router,private route:ActivatedRoute
  ) { 
    this.session=this.authService.getsession().SESSION;
  }

  ngOnInit() {

    this.idGes = this.route.snapshot.paramMap.get('id');
    this.idTipoGestion = this.route.snapshot.paramMap.get('idTipoGestion');
    this.idEstado = this.route.snapshot.paramMap.get('idEstado');
    this.valProfile();
    //Datos obligatorios segun el rol
    
    if(this.viewSecrePresi){
   
      this.update = this.fb.group({
        floatLabel: this.floatLabelControl,
        codDependencia: [''],      
        codPresupuestario: [''],      
        nombreDep: ['', Validators.required],      
        cortoDep: [''],      
        gafeteDep: [''],      
        documentoDep: ['', Validators.required],      
        selConector: [''],      
        conectorDep: [''],      
        selFuncionalidad: [''],      
        funcionDep: [''],      
        selArea: [''],      
        areaDep: [''],      
        fechaAcuerdo: ['', Validators.required],      
        acuerdoDep: ['', Validators.required],      
        selDepartamento: [''],      
        departamentoDep: [''],      
        selMunicipio: [''],      
        municipioDep: [''],      
        referencia: [''],      
        fechaAnulacion: [''],      
        inicioVigencia: [''],      
        inicioDep: [''],      
        fechaPublicacion: [''],      
        publicaDep: [''],      
        inicioVigRef: [''],
        chkRefVigencia:['']      
      }); 
     } else if(this.viewUcpas){
      console.log("creation de ucpas");
      
    this.update = this.fb.group({
      floatLabel: this.floatLabelControl,
      codDependencia: ['', Validators.required],      
      codPresupuestario: ['', Validators.required],      
      nombreDep: [''],      
      cortoDep: ['', Validators.required],      
      gafeteDep: ['', Validators.required],      
      documentoDep: [''],      
      selConector: ['', Validators.required],      
      conectorDep: ['', Validators.required],      
      selFuncionalidad: ['', Validators.required],      
      funcionDep: ['', Validators.required],      
      selArea: ['', Validators.required],      
      areaDep: ['', Validators.required],      
      fechaAcuerdo: [''],      
      acuerdoDep: [''],      
      selDepartamento: ['', Validators.required],      
      departamentoDep: ['', Validators.required],      
      selMunicipio: ['', Validators.required],      
      municipioDep: ['', Validators.required],      
      referencia: ['', Validators.required],      
      fechaAnulacion: ['', Validators.required],      
      inicioVigencia: [''],      
      inicioDep: [''],      
      fechaPublicacion: [''],      
      publicaDep: [''],      
      inicioVigRef: [''],
      chkRefVigencia:['']      
    });

     }else {
      this.update = this.fb.group({
        floatLabel: this.floatLabelControl,
        codDependencia: ['', Validators.required],      
        codPresupuestario: ['', Validators.required],      
        nombreDep: ['', Validators.required],      
        cortoDep: ['', Validators.required],      
        gafeteDep: ['', Validators.required],      
        documentoDep: ['', Validators.required],      
        selConector: ['', Validators.required],      
        conectorDep: ['', Validators.required],      
        selFuncionalidad: ['', Validators.required],      
        funcionDep: ['', Validators.required],      
        selArea: ['', Validators.required],      
        areaDep: ['', Validators.required],      
        fechaAcuerdo: ['', Validators.required],      
        acuerdoDep: ['', Validators.required],      
        selDepartamento: ['', Validators.required],      
        departamentoDep: ['', Validators.required],      
        selMunicipio: ['', Validators.required],      
        municipioDep: ['', Validators.required],      
        referencia: ['', Validators.required],      
        fechaAnulacion: ['', Validators.required],      
        inicioVigencia: [''],      
        inicioDep: [''],      
        fechaPublicacion: [''],      
        publicaDep: [''],      
        inicioVigRef: [''],
        chkRefVigencia:['']      
      });
     }



    this.update.get('codDependencia').valueChanges.subscribe((v)=> {if(v.length > 3){this.iniciaValDep = true }else{this.iniciaValDep = false}} );
    this.update.get('codPresupuestario').valueChanges.subscribe((v)=> {if(v.length > 3){this.iniciaValPres = true }else{this.iniciaValPres = false}});
    
    this.loadDependencia();
    this.asignarControles();

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
    this.viewSecretaria=true;
    this.viewPresidencia=false;
    this.viewUcpas = false;
    this.viewNominas = false;
    this.viewCidej=false;
    this.viewCit=false;
    this.viewAdmin =false;

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
  viewAnulacion(){
    return this.idTipoGestion == 4;
  }

  asignarControles(){

    if(this.idTipoGestion == 1){
      this.controlsLectura.push('codDependencia');
      this.controlsLectura.push('codPresupuestario');
      this.controlsLectura.push('selArea');
      this.controlsLectura.push('selFuncionalidad');
      this.controlsLectura.push('selConector');
      this.controlsLectura.push('selDepartamento');
      this.controlsLectura.push('selMunicipio');
      this.controlsLectura.push('inicioVigencia');
      this.controlsLectura.push('fechaAcuerdo');
      this.controlsLectura.push('fechaPublicacion');
      this.update.controls.inicioVigencia.setValidators(Validators.required);
    }else if(this.idTipoGestion == 2){
      this.controlsLectura.push('codDependencia');
      this.controlsLectura.push('codPresupuestario');
      this.controlsLectura.push('nombreDep');
      this.controlsLectura.push('cortoDep');
      this.controlsLectura.push('gafeteDep');
      this.controlsLectura.push('documentoDep');
      this.controlsLectura.push('selArea');
      this.controlsLectura.push('selFuncionalidad');
      this.controlsLectura.push('selConector');
      this.controlsLectura.push('departamentoDep');
      this.controlsLectura.push('municipioDep');
      this.controlsLectura.push('inicioVigencia');
      this.controlsLectura.push('fechaAcuerdo');
      this.controlsLectura.push('fechaPublicacion');
      this.update.controls.inicioVigencia.setValidators(Validators.required);
    }else if(this.idTipoGestion == 3){
      this.controlsLectura.push('codDependencia');
      this.controlsLectura.push('codPresupuestario');
      this.controlsLectura.push('selArea');
      this.controlsLectura.push('selFuncionalidad');
      this.controlsLectura.push('selConector');
      this.controlsLectura.push('departamentoDep');
      this.controlsLectura.push('municipioDep');
      this.controlsLectura.push('inicioVigencia');
      this.controlsLectura.push('fechaAcuerdo');
      this.controlsLectura.push('fechaPublicacion');
      this.update.controls.inicioVigencia.setValidators(Validators.required);
    }else if(this.idTipoGestion == 4){
      this.controlsLectura.push('nombreDep');
      this.controlsLectura.push('cortoDep');
      this.controlsLectura.push('gafeteDep');
      this.controlsLectura.push('documentoDep');
      this.controlsLectura.push('areaDep');
      this.controlsLectura.push('funcionDep');
      this.controlsLectura.push('conectorDep');
      this.controlsLectura.push('inicioDep');
      this.controlsLectura.push('publicaDep');
      this.controlsLectura.push('codDependencia');
      this.controlsLectura.push('codPresupuestario');
      this.controlsLectura.push('departamentoDep');
      this.controlsLectura.push('municipioDep');
      this.controlsLectura.push('acuerdoDep');
      this.update.controls.fechaAnulacion.setValidators(Validators.required);
      }


  }

  loadDependencia(){
      this.mantenimientoDependenciaService.getGestDependencia(this.idGes).subscribe(
        data => {
          this.asignarData(data[0]);
        });
  }

  asignarData(data){

    this.update.controls.codDependencia.setValue(data.CODIGO_DEPENDENCIA );
    this.update.controls.codPresupuestario.setValue(data.CODIGO_PRESUPUESTARIO);
    this.update.controls.nombreDep.setValue(data.NOMBRE_DEPENDENCIA); 
    this.update.controls.gafeteDep.setValue(data.NOMBRE_GAFETE);
    this.update.controls.cortoDep.setValue(data.NOMBRE_ABREVIADO);
    this.update.controls.documentoDep.setValue(data.NOMBRE_DOCUMENTO);
    this.update.controls.selConector.setValue(data.CONECTOR.trim().toUpperCase());
    this.update.controls.conectorDep.setValue(data.CONECTOR.trim().toUpperCase());
    this.update.controls.fechaAcuerdo.setValue(data.FECHA_DEL_ACUERDO.length > 0 ? new Date(data.FECHA_DEL_ACUERDO) : ""); 
    this.update.controls.acuerdoDep.setValue(data.FECHA_DEL_ACUERDO.length > 0 ? this.datePipe.transform(data.FECHA_DEL_ACUERDO, 'dd/MM/yyyy') : ""); 
    this.update.controls.referencia.setValue(data.REFERENCIA);
    this.update.controls.selFuncionalidad.setValue(data.FUNCION_UNIDAD);
    this.update.controls.funcionDep.setValue(data.FUNCION_UNIDAD == 'N' ? 'JORNADA' : 'TURNO');
    this.update.controls.departamentoDep.setValue(data.NOMBRE_DEPARTAMENTO);
    this.update.controls.selDepartamento.setValue(data.DEPARTAMENTO);
    this.idDepto = data.DEPARTAMENTO;
    this.update.controls.municipioDep.setValue(data.NOMBRE_MUNICIPIO);
    this.update.controls.selMunicipio.setValue(data.MUNICIPIO);
    this.update.controls.selArea.setValue(data.TIPO_AREA);
    this.update.controls.areaDep.setValue(data.NOMBRE_AREA);
    this.idGestion = data.ID_GESTION_DEPENDENCIA;
    this.update.controls.fechaAnulacion.setValue(new Date(data.FECHA_ANULACION));
    this.observaciones = data.OBSERVACIONES;

    //this.files[0].name = this.nombreArchivo(data.ACUERDO_DIGITAL); 
    var nameFile = this.nombreArchivo(data.ACUERDO_DIGITAL);
    this.archivo(nameFile,this.idGestion);

    this.update.controls.inicioVigencia.setValue(data.FECHA_ENTRA_VIGENCIA.length > 0 ? new Date(data.FECHA_ENTRA_VIGENCIA) : "");    
    this.update.controls.inicioDep.setValue(data.FECHA_ENTRA_VIGENCIA.length > 0 ? this.datePipe.transform(data.FECHA_ENTRA_VIGENCIA, 'dd/MM/yyyy') : "");    
    this.update.controls.fechaPublicacion.setValue(data.FECHA_PUBLICACION.length > 0 ? new Date(data.FECHA_PUBLICACION) : ""); 
    this.update.controls.publicaDep.setValue(data.FECHA_PUBLICACION.length > 0 ? this.datePipe.transform(data.FECHA_PUBLICACION, 'dd/MM/yyyy') : ""); 
    this.update.controls.inicioVigRef.setValue(data.OBS_FECHA_VIGENCIA);

    this.checked = data.FECHA_ENTRA_VIGENCIA.length == 0;
    console.log('----------'+this.update.controls.codDependencia.value);
    
  }

  nombreArchivo(ruta){
      var dataRuta = ruta.split("/");
      
      return dataRuta.length > 0 ? dataRuta[dataRuta.length - 1] : null;
  }

  archivo(nombre,id){

    let savedFile :Filex; 
   

    this.mantenimientoDependenciaService.viewFile(id).subscribe(
      data => {      
        let blob: Blob = new Blob([data.body], { type: 'application/pdf'});
        
        var b = new File([blob],nombre, { type: 'application/pdf'});
        
        this.files.push(b);
    
      });    

  }


  actualizarDependencia(){

    let dependencia={
    
     ID_GESTION_DEPENDENCIA: this.idGestion,
     CODIGO_DEPENDENCIA:this.update.value.codDependencia,
     CODIGO_PRESUPUESTARIO:this.update.value.codPresupuestario,
     NOMBRE_DEPENDENCIA:this.update.value.nombreDep.toUpperCase(),
     FECHA_ANULACION: this.update.value.fechaAnulacion != "" && this.viewAnulacion() ? this.datePipe.transform(this.update.value.fechaAnulacion, 'dd/MM/yyyy'):"",
     REFERENCIA:this.update.value.referencia.toUpperCase(),
     ID_USUARIO_REGISTRO:this.session.ID_USUARIO,
     IP:"",
     ARCHIVO:"",
     NOMBRE_ARCHIVO:"",     
     NOMBRE_GAFETE:this.update.value.gafeteDep.toUpperCase(),
     NOMBRE_ABREVIADO:this.update.value.cortoDep.toUpperCase(),
     NOMBRE_DOCUMENTO:this.update.value.documentoDep.toUpperCase(),
     CONECTOR:this.update.value.selConector,
     FECHA_DEL_ACUERDO:this.datePipe.transform(this.update.value.fechaAcuerdo, 'dd/MM/yyyy'),
     FECHA_ENTRA_VIGENCIA:this.datePipe.transform(this.update.value.inicioVigencia, 'dd/MM/yyyy'),
     FECHA_PUBLICACION:this.datePipe.transform(this.update.value.fechaPublicacion, 'dd/MM/yyyy'),
     OBS_FECHA_VIGENCIA:this.update.value.inicioVigRef.toUpperCase(),
     PROCESO_ESTADO_AREA: this.areaActual,
     FUNCION_UNIDAD:this.update.value.selFuncionalidad,
     DEPARTAMENTO:this.update.value.selDepartamento,
     MUNICIPIO:this.update.value.selMunicipio,
     TIPO_AREA:this.update.value.selArea,
     ID_SOLICITUD:""
     }    

    if(this.files.length>0){
      this.files.forEach(element => {   
        this.getBase64(element).then(
          data => {

            if(data){

              dependencia.NOMBRE_ARCHIVO = element.name;
              dependencia.ARCHIVO = data.toString();
              this.actualizar(dependencia);
 
            }
          }
        );
      });    
    }

  }

  actualizar(dependencia){
 
    
    

    if(this.idTipoGestion==1){
      this.updateDependencia(dependencia) 
    }
    else if(this.idTipoGestion==2){
      this.updateActualizaDependencia(dependencia);
   }
   else if(this.idTipoGestion==3){
    this.updateRegulaDependencia(dependencia);
   }
    else if(this.idTipoGestion==4){
      this.updateBajaDependencia(dependencia);
   }

  }

  updateDependencia(dependencia){
    this.mantenimientoDependenciaService.updateDependencia(dependencia).subscribe(
      data=>{
        if(data.result=='OK'){
         swal("Dependencia Actualizada", data.msj, "success")
         this.router.navigate(['/mantenimientos/gestiones/1']);
        }else{
         swal("Error", data.msj, "error")
       }
      })
  }


  updateBajaDependencia(dependencia){
    this.mantenimientoDependenciaService.updateBajaDependencia(dependencia).subscribe(
      data=>{
        if(data.result=='OK'){
         swal("Dependencia Actualizada", data.msj, "success")
         this.router.navigate(['/mantenimientos/gestiones/1']);
        }else{
         swal("Error", data.msj, "error")
       }
      })
  }

  updateActualizaDependencia(dependencia){
    this.mantenimientoDependenciaService.updateActualizaDependencia(dependencia).subscribe(
      data=>{
        if(data.result=='OK'){
         swal("Dependencia Actualizada", data.msj, "success")
         this.router.navigate(['/mantenimientos/gestiones/1']);
        }else{
         swal("Error", data.msj, "error")
       }
      })
  }

  updateRegulaDependencia(dependencia){
    this.mantenimientoDependenciaService.updateRegulaDependencia(dependencia).subscribe(
      data=>{
        if(data.result=='OK'){
         swal("Dependencia Actualizada", data.msj, "success")
         this.router.navigate(['/mantenimientos/gestiones/1']);
        }else{
         swal("Error", data.msj, "error")
       }
      })
  }
  
  getMunicipio(event: any, valDepto: number) {
    if (event.isUserInput) {

      if(valDepto !== this.idDepto){
      this.update.controls.selMunicipio.setValue("");
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

  asignaNombreDoc(valor: any) : void{
    this.update.controls.documentoDep.setValue(valor);
  }  
  
  asignarRequerido(valor:any){
    if(this.checked){
      this.update.controls.inicioVigRef.setValidators(Validators.required);
      this.update.controls.inicioVigencia.setValidators([]);
      this.update.controls.inicioVigencia.updateValueAndValidity();
    }else{
    this.update.controls.inicioVigencia.setValidators(Validators.required);
    this.update.controls.inicioVigRef.setValidators([]);
    this.update.controls.inicioVigRef.updateValueAndValidity();
  }
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
    let acuerdo = new Date(this.update.value.fechaAcuerdo);
    let vigencia = new Date(this.update.value.inicioVigencia);
    
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
    let acuerdo = new Date(this.update.value.fechaAcuerdo);
    let publicacion = new Date(this.update.value.fechaPublicacion);
    
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

  get f() { return this.update.controls; }

  /* upload file*/
  accept = '*'
  files: Filex[] = []
  //files: Blob[] = []
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
    this.mantenimientoDependenciaService.viewFile(this.idGes).subscribe(
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
    this.router.navigate(['/mantenimientos/gestiones/'+this.idEstado]);
  }
  
  loadHabilitados(control){    
     return this.controlsLectura.indexOf(control) != -1;  
  }

}
