import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDatepickerModule, MatSelect, MatInput, MatButton, MatAutocomplete, MatChipInputEvent, MatAutocompleteSelectedEvent, MatTableDataSource, MatPaginator, MatSort } from '@angular/material';
import { FormGroup, FormBuilder, Validators, ValidationErrors, FormControl, ValidatorFn, AbstractControl } from '@angular/forms';
import { Observable, Subscription, of } from '../../../../node_modules/rxjs';
import { HttpEvent, HttpRequest, HttpClient, HttpResponse } from '../../../../node_modules/@angular/common/http';
import { ngf } from "angular-file"
import { DatePipe, Location } from '@angular/common';
import swal,{ SweetAlertOptions } from 'sweetalert2';
import { MantenimientosDependenciaService } from '../mantenimientos-dependencia.service';
import { AuthService } from '../../recursos/auth.service';
import { startWith, map } from '../../../../node_modules/rxjs/operators';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { MatDialog, MatDialogRef} from '@angular/material/dialog';
import { RechazarComponent } from '../gestiones/rechazar/rechazar.component';
import { ConfirmarComponent } from '../gestiones/confirmar/confirmar.component';
import { ViewComponent } from '../gestiones/view/view.component';
import { ObservacionesComponent } from './observaciones/observaciones.component';
import { EliminarComponent } from './eliminar/eliminar.component';

interface TipoGestion {
  ID_TIPO: string;
  DESCRIPCION: string;
}

@Component({
  selector: 'app-gestiones',
  templateUrl: './gestiones.component.html',
  styleUrls: ['./gestiones.component.scss']
})
export class GestionesComponent implements OnInit {

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  
  gestion: FormGroup;
  floatLabelControl = new FormControl('never');
  gestiones;
  idEstado;
  session;
  constantes;
  selected;
  filteredOptions: Observable<any[]>;
  filteredOptionsTipo: Observable<any[]>;
  //Variables para verificar que usuario esta logueado
 viewSecrePresi=false;
  viewSecretaria=false;
  viewPresidencia=false;
  viewNominas = false;
  viewUcpas = false;
  viewCidej=false;
  viewCit=false;
  viewAdmin=false;
  dataSource = new MatTableDataSource<any>();
  nombreTitulo;

  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public authService: AuthService,
    public HttpClient: HttpClient,private fb: FormBuilder,  private _location: Location, private datePipe : DatePipe,
    private router: Router,private route:ActivatedRoute,public dialog: MatDialog
  ) { 
    this.session = this.authService.getsession().SESSION;
    this.constantes = this.authService.getsession().CONSTANTES;
      }

  ngOnInit() {

    this.gestion = this.fb.group({
      floatLabel: this.floatLabelControl,
      busqueda: [''],      
      selEstados: ['']      
    });
    
    this.route.params.subscribe(
      (params: Params) => {
        this.idEstado = params.id;
        this.selected = '';
        this.filteredOptions = of([]);        
        this.gestiones = of([]);;
        this.valProfile();
        this.loadGestiones();
        this.seleccionarTitulo();

      }
    );

    

  }

  listTipos : TipoGestion[] = [
    { ID_TIPO: '0', DESCRIPCION: 'TODOS' },
    { ID_TIPO: '1', DESCRIPCION: 'SOLICITUD' },
    { ID_TIPO: '2', DESCRIPCION: 'ACTUALIZACION' },
    { ID_TIPO: '3', DESCRIPCION: 'REGULARIZACION' },
    { ID_TIPO: '4', DESCRIPCION: 'BAJA' }
  ];

  seleccionarTitulo(){
    if(this.idEstado == 1){
      this.nombreTitulo = "Bandeja de Solicitudes";
    }else if(this.idEstado == 2){
      this.nombreTitulo = "Bandeja de Atendidos";
    }else if(this.idEstado == 3){
      this.nombreTitulo = "Bandeja de Rechazos";
    }

  }

  valProfile(){
// esto despues hay que quitarlo 

this.viewSecretaria=false;
this.viewPresidencia=false;
this.viewUcpas = true;
this.viewNominas = false;
this.viewCidej=false;
this.viewCit=false;
this.viewSecrePresi=false;
this.viewAdmin=false;

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
     /*  if(this.constantes.SNP == this.session.PERFILES[i].ID_PERFIL){
           this.viewNominas = true;
       }else if(this.constantes.UCPAS == this.session.PERFILES[i].ID_PERFIL){
        this.viewUcpas = true;
      }else if(this.constantes.ADMIN_UCPAS == this.session.PERFILES[i].ID_PERFIL){
        this.viewAdminUcpas = true;
      }*/
   }
  } 

  loadGestiones(){
    let verarea='todos';
    if(this.viewPresidencia){
    verarea='PRESIDENCIA';
    }else  if(this.viewSecretaria){
      verarea='SECRETARIA';
      console.log('aqui s '+verarea);
    }else  if(this.viewUcpas){
      verarea='UCPAS';
    }else  if(this.viewNominas){
      verarea='NOMINAS';
    }
    
    if (this.viewAdmin){
      verarea='todos';
    } 

  console.log('se buscara datos por '+verarea+"Proceso"+this.idEstado);

    if (verarea !='todos'){ //se busca por area especifica y
      if(this.idEstado==2 && !this.viewNominas){
        this.idEstado=0;
      }
      this.mantenimientoDependenciaService.getGestionesArea(this.idEstado,0,verarea).subscribe(
        data => {
          if(data.length>0){ 
          this.gestiones = data;
          console.log(this.gestiones);
         
          this.dataSource = new MatTableDataSource(this.gestiones);
            
        }else{ 
          this.dataSource = new MatTableDataSource<any>();
          let estado = this.idEstado == 1 ? "En solicitudes" : this.idEstado === 2 ? "Atendidas" : "Rechazadas";
            swal("Gestiones Dependencias", "No se han encontrado gestiones " + estado, "info")
          }
  
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort;
            console.log("Gestiones sin data");
        });
  
    }else{
      this.mantenimientoDependenciaService.getGestiones(this.idEstado,0,).subscribe(
        data => {
          if(data.length>0){ 
          this.gestiones = data;
          console.log(this.gestiones);
         
          this.dataSource = new MatTableDataSource(this.gestiones);
            
        }else{ 
          this.dataSource = new MatTableDataSource<any>();
          let estado = this.idEstado == 1 ? "En solicitudes" : this.idEstado === 2 ? "Atendidas" : "Rechazadas";
            swal("Gestiones Dependencias", "No se han encontrado gestiones " + estado, "info")
          }
  
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort;
            console.log("Gestiones sin data");
        });
  

    }
   

  }

  private _filterGESTION(value: any): any {
    const filterValue = value.toLowerCase();
    return this.gestiones.filter(option => option.NOMBRE_DEPENDENCIA.toLowerCase().includes(filterValue) || option.CODIGO_DEPENDENCIA.toLowerCase().includes(filterValue));
  }
  
  filterMatTable(filterValue: any){
    this.dataSource.filter = filterValue;
   }  

  selFiltroTipo(event: any, tipo) {
    let verarea='todos';
    if(this.viewPresidencia){
    verarea='PRESIDENCIA';
    }else  if(this.viewSecretaria){
      verarea='SECRETARIA';
      console.log('aqui s '+verarea);
    }else  if(this.viewUcpas){
      verarea='UCPAS';
    }else  if(this.viewNominas){
      verarea='NOMINAS';
    }   
    if (this.viewAdmin){
      verarea='todos';
    } 

    if(event.isUserInput){
      if(event!=undefined){
      if (event.source.selected){

       if(verarea!='todos'){
          if(this.idEstado==2 && !this.viewNominas){
            this.idEstado=0;
          }
          this.mantenimientoDependenciaService.getGestionesArea(this.idEstado,tipo.ID_TIPO,verarea).subscribe(
            data => {
              this.gestiones = data;
              console.log(data);
              if(data.length>0){
              this.gestion.controls.busqueda.setValidators(searchValidator(this.gestiones));              
              this.filteredOptions = this.gestion.controls.busqueda.valueChanges.pipe(
                startWith<string | any>(''),
                map(value => typeof value === 'string' ? value : value.NOMBRE_DEPENDENCIA),
                map(name => name ? this._filterGESTION(name) : this.gestiones.slice())
              );               
            }else{ 
              this.filteredOptions = of([]);        
              swal("Gestiones Dependencias", "No se han encontrado gestiones de " + tipo.DESCRIPCION , "info")
              }
    
              this.dataSource = new MatTableDataSource(this.gestiones);
              this.dataSource.paginator = this.paginator;
              this.dataSource.sort = this.sort;  
            });
        }else{
          console.log('entramos a todos'+ tipo.ID_TIPO)
          this.mantenimientoDependenciaService.getGestiones(0,tipo.ID_TIPO).subscribe(
            data => {
              this.gestiones = data;
              console.log(data);
              if(data.length>0){
              this.gestion.controls.busqueda.setValidators(searchValidator(this.gestiones));              
              this.filteredOptions = this.gestion.controls.busqueda.valueChanges.pipe(
                startWith<string | any>(''),
                map(value => typeof value === 'string' ? value : value.NOMBRE_DEPENDENCIA),
                map(name => name ? this._filterGESTION(name) : this.gestiones.slice())
              );               
            }else{ 
              this.filteredOptions = of([]);        
              swal("Gestiones Dependencias", "No se han encontrado gestiones de " + tipo.DESCRIPCION , "info")
              }
    
              this.dataSource = new MatTableDataSource(this.gestiones);
              this.dataSource.paginator = this.paginator;
              this.dataSource.sort = this.sort;  
            });
       }

      }
    }
    }
  }

  crear(){
    this.router.navigate(['/mantenimientos/creacion/']);
  }

  editar(item){
    this.router.navigate(['/mantenimientos/actualizar/'+item.ID_GESTION_DEPENDENCIA+'/'+item.ID_TIPO_GESTION+'/'+this.idEstado]);
  }
  crear2(item){
    this.router.navigate(['/mantenimientos/creacion/'+item.ID_GESTION_DEPENDENCIA]);
  }

  rechazar(item):void{
    
    console.log(item);
    const dialogRef = this.dialog.open(RechazarComponent, {
      width: '650px',
      height: '100',
      data: {CODIGO_DEPENDENCIA: item.CODIGO_DEPENDENCIA, NOMBRE_DEPENDENCIA: item.NOMBRE_DEPENDENCIA, NOMBRE:item.NOMBRE, CODIGO_PRESUPUESTARIO:item.CODIGO_PRESUPUESTARIO, ID_TIPO_GESTION:item.ID_TIPO_GESTION, OBSERVACIONES:''}});

      dialogRef.afterClosed().subscribe(result => {

        if(result != undefined){
       this.confirmarRechazo((confirm) => {
         if(confirm){
            this.rechazoGestion(item.ID_GESTION_DEPENDENCIA,result.OBSERVACIONES,item.TIPO_AREA,item.PROCESO_ESTADO_AREA,0) ;
         }
       });
      }
      });
  }
  rechazar1(item):void{
    
    console.log(item);
    const dialogRef = this.dialog.open(RechazarComponent, {
      width: '650px',
      height: '100',
      data: {CODIGO_DEPENDENCIA: item.CODIGO_DEPENDENCIA, NOMBRE_DEPENDENCIA: item.NOMBRE_DEPENDENCIA, NOMBRE:item.NOMBRE, CODIGO_PRESUPUESTARIO:item.CODIGO_PRESUPUESTARIO, ID_TIPO_GESTION:item.ID_TIPO_GESTION, OBSERVACIONES:''}});

      dialogRef.afterClosed().subscribe(result => {

        if(result != undefined){
       this.confirmarRechazo((confirm) => {
         if(confirm){
            this.rechazoGestion(item.ID_GESTION_DEPENDENCIA,result.OBSERVACIONES,item.TIPO_AREA,item.PROCESO_ESTADO_AREA,1) ;
         }
       });
      }
      });
  }

  confirmarRechazo(callback: Function):any{
    swal({
      text: "Esta seguro de rechazar esta gestión?",
      type: "question",
      confirmButtonColor: 'primary',
      confirmButtonText: 'Aceptar',
      showCancelButton: true,
      cancelButtonText: "Cancelar",
      cancelButtonColor:"red",     
          })
    .then(function(isConfirm) {
      if (isConfirm.value) {
        return callback(true);
      }
      
      return callback(null);
    });

  }

  rechazoGestion(idGestion, observaciones,tipo_area,area,tipo){
   if( area=='UCPAS' && tipo_area==1){
    area='SECRETARIA';
   } else if ( area=='UCPAS'&& tipo_area==2){
    area='PRESIDENCIA';
   }else if( area=='SECRETARIA' || area=='PRESIDENCIA' ){
    area='UCPAS';
   }else if ( area=='NOMINAS'){
    area='UCPAS';
   }else{
    area='NOMINAS';
   }
   console.log(area+":"+tipo_area);
   let gestion = {  
        ID_GESTION_DEPENDENCIA : idGestion,
        OBSERVACIONES : observaciones,
        IP : "",
        ID_USUARIO_REGISTRO : this.session.ID_USUARIO,
        PROCESO_ESTADO_AREA:area

   };
  if (tipo==0){
    this.mantenimientoDependenciaService.rechazoGestion(gestion).subscribe(
      data => {
        if(data.result=='ok'){
          swal("Gestión Rechazada Exitosamente", "", "success")
          this.loadGestiones();
         }else{
          swal("Error", data.msj, "error")
        } 
      });
  }else{
    this.mantenimientoDependenciaService.rechazoGestion1(gestion).subscribe(
      data => {
        if(data.result=='ok'){
          swal("Gestión Rechazada Exitosamente", "", "success")
          this.loadGestiones();
         }else{
          swal("Error", data.msj, "error")
        } 
      });
  }
    

  }

  confirmarGestion(item):void{
    console.log('confirmamos solicitud');
    const dialogRef = this.dialog.open(ConfirmarComponent, {
      width: '650px',
      height: '100',
      data: {CODIGO_DEPENDENCIA: item.CODIGO_DEPENDENCIA, NOMBRE_DEPENDENCIA: item.NOMBRE_DEPENDENCIA, NOMBRE:item.NOMBRE, CODIGO_PRESUPUESTARIO:item.CODIGO_PRESUPUESTARIO, ID_TIPO_GESTION:item.ID_TIPO_GESTION, OBSERVACIONES:''}});

      dialogRef.afterClosed().subscribe(result => {

        if(result != undefined){
        this.confirmarAceptacion((confirm) => {
         if(confirm){
          this.confirmacionGestion(item,result.OBSERVACIONES);
         }
       });
      }
      });
  }


    confirmarAceptacion(callback: Function):any{
      swal({
        text: "Esta seguro de Confirmar esta gestión?",
        type: "question",
        confirmButtonColor: 'primary',
        confirmButtonText: 'Aceptar',
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonColor:"red",     
            })
            .then(function(isConfirm) {
              if (isConfirm.value) {
                return callback(true);
              }
              
              return callback(null);
            });
    }

    confirmacionGestion(item, observaciones){

        let gestion = {  
             ID_GESTION_DEPENDENCIA : item.ID_GESTION_DEPENDENCIA,
             OBSERVACIONES : observaciones,
             IP : "",
             ID_USUARIO_REGISTRO : this.session.ID_USUARIO,
             USUARIO : this.session.USUARIO
        };
     
          //Agregar validaciones para confirmaciones

          if(item.ID_TIPO_GESTION==1){
              this.confirmarCreacion(gestion) 
          }
          else if(item.ID_TIPO_GESTION==2){
            this.confirmarActualizacion(gestion);
         }
          else if(item.ID_TIPO_GESTION==4){
            this.confirmarBaja(gestion);
         }
          else if(item.ID_TIPO_GESTION==3){
          this.confirmarRegularizacion(gestion);
         }

    }

    confirmarCreacion(gestion){
      this.mantenimientoDependenciaService.confirmarGestion(gestion).subscribe(
        data => {
          if(data.result=='OK'){
            swal("Gestión Confirmada Exitosamente", "", "success")
            this.loadGestiones();
           }else{
            swal("Error", data.msj, "error")
          } 
        });      
    }

    confirmarBaja(gestion){
      this.mantenimientoDependenciaService.confirmarBaja(gestion).subscribe(
        data => {
          if(data.result=='OK'){
            swal("Gestión Confirmada Exitosamente", "", "success")
            this.loadGestiones();
           }else{
            swal("Error", data.msj, "error")
          } 
        });      

    }
 
    confirmarActualizacion(gestion){
      this.mantenimientoDependenciaService.confirmarActualizacion(gestion).subscribe(
        data => {
          if(data.result=='OK'){
            swal("Gestión Confirmada Exitosamente", "", "success")
            this.loadGestiones();
           }else{
            swal("Error", data.msj, "error")
          } 
        });      

    }
    
    confirmarRegularizacion(gestion){
      this.mantenimientoDependenciaService.confirmarRegularizacion(gestion).subscribe(
        data => {
          if(data.result=='OK'){
            swal("Gestión Confirmada Exitosamente", "", "success")
            this.loadGestiones();
           }else{
            swal("Error", data.msj, "error")
          } 
        });      

    }

    viewDependencia(item):void{

      this.mantenimientoDependenciaService.getGestDependencia(item.ID_GESTION_DEPENDENCIA).subscribe(
        data => {
          this.modalDependencia(data[0]);
        });
      
    }

    
    modalDependencia(dataDep){
      console.log(dataDep);

     const dialogRef = this.dialog.open(ViewComponent, {
        width: '800px',
        height: '400',
        data: dataDep});
  
        dialogRef.afterClosed().subscribe(result => {

        });      
    }

    viewObservaciones(item):void{
       
      this.mantenimientoDependenciaService.getGestDependencia(item.ID_GESTION_DEPENDENCIA).subscribe(
        data => {
          this.modalObservaciones(item, data[0]);
        });
      
    }

    modalObservaciones(item, dataDep){

      const dialogRef = this.dialog.open(ObservacionesComponent, {
        width: '800px',
        height: '400',
        data: {CODIGO_DEPENDENCIA: item.CODIGO_DEPENDENCIA, NOMBRE_DEPENDENCIA: item.NOMBRE_DEPENDENCIA, NOMBRE:item.NOMBRE, OBSERVACIONES:dataDep.OBSERVACIONES}});
  
        dialogRef.afterClosed().subscribe(result => {

        });      
    }

    
    //Eliminar Gestión

    eliminar(item):void{
      const dialogRef = this.dialog.open(EliminarComponent, {
        width: '650px',
        height: '100',
        data: {CODIGO_DEPENDENCIA: item.CODIGO_DEPENDENCIA, NOMBRE_DEPENDENCIA: item.NOMBRE_DEPENDENCIA, NOMBRE:item.NOMBRE, OBSERVACIONES:''}});
  
        dialogRef.afterClosed().subscribe(result => {
  
          if(result != undefined){
         this.confirmarEliminacion((confirm) => {
           if(confirm){
              this.eliminarGestion(item.ID_GESTION_DEPENDENCIA,result.OBSERVACIONES);
           }
         });
        }
        });
    }

    
    confirmarEliminacion(callback: Function):any{
      swal({
        text: "Esta seguro de eliminar esta gestión?",
        type: "question",
        confirmButtonColor: 'primary',
        confirmButtonText: 'Aceptar',
        showCancelButton: true,
        cancelButtonText: "Cancelar",
        cancelButtonColor:"red",     
            })
      .then(function(isConfirm) {
        if (isConfirm.value) {
          return callback(true);
        }
        
        return callback(null);
      });
  
    }
  
    eliminarGestion(idGestion, observaciones){
  
     let gestion = {  
          ID_GESTION_DEPENDENCIA : idGestion,
          OBSERVACIONES : observaciones,
          IP : "",
          ID_USUARIO_REGISTRO : this.session.ID_USUARIO
     };
  
      this.mantenimientoDependenciaService.eliminarGestion(gestion).subscribe(
        data => {
          if(data.result=='ok'){
            swal("Gestión Eliminada Exitosamente", "", "success")
            this.loadGestiones();
           }else{
            swal("Error", data.msj, "error")
          } 
        });
  
    }
      
}

export function searchValidator(Services: any[]): ValidatorFn { 
    
  return (control: AbstractControl): { [key: string]: any } | null => {
    const index = Services.findIndex(Service => {
      return Service ==control.value
    });
    
    return index < 0 ? { searchNames: { value: control.value } } : null;
  };


}