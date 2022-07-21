import { Component, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormControl, FormBuilder, ValidatorFn, AbstractControl } from '@angular/forms';
import { Observable } from 'rxjs/internal/Observable';
import { MantenimientosDependenciaService } from '../mantenimientos-dependencia.service';
import { AuthService } from '../../recursos/auth.service';
import { HttpEvent, HttpRequest, HttpClient, HttpResponse } from '../../../../node_modules/@angular/common/http';
import { ngf } from "angular-file"
import { DatePipe, Location } from '@angular/common';
import swal, { SweetAlertOptions } from 'sweetalert2';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { of } from 'rxjs';
import { startWith, map } from '../../../../node_modules/rxjs/operators';
import { ViewDependenciaComponent } from './view-dependencia/view-dependencia.component';
import { MatTableDataSource, MatSort, MatPaginator, MatDialog } from '@angular/material';

@Component({
  selector: 'app-dependencias',
  templateUrl: './dependencias.component.html',
  styleUrls: ['./dependencias.component.scss']
})
export class DependenciasComponent implements OnInit {

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  dependencia: FormGroup;
  floatLabelControl = new FormControl('never');
  dependencias;
  idEstado = 1;
  session;
  constantes;
  selected;
  filteredOptions: Observable<any[]>;
  filteredOptionsTipo: Observable<any[]>;
  filtered: Observable<any[]>[];
  viewNominas = false;
  viewUcpas = false;
  dataSource = new MatTableDataSource<any>();

  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public authService: AuthService,
    public HttpClient: HttpClient, private fb: FormBuilder, private _location: Location, private datePipe: DatePipe,
    private router: Router, private route: ActivatedRoute, public dialog: MatDialog
  ) {
    this.session = this.authService.getsession().SESSION;
    this.constantes = this.authService.getsession().CONSTANTES;
  }

  ngOnInit() {

    this.dependencia = this.fb.group({
      floatLabel: this.floatLabelControl,
      busqueda: [''],
      selEstados: ['']
    });

    this.route.params.subscribe(
      (params: Params) => {
        // this.idEstado = params.id;
        this.selected = '';
        this.filteredOptions = of([]);
        this.loadDependencias();
      }
    );

    this.valProfile();

  }

  valProfile() {
    for (var i = 0; i < this.session.PERFILES.length; i++) {
      if (this.constantes.SNP == this.session.PERFILES[i].ID_PERFIL) {
        this.viewNominas = true;
      } else if (this.constantes.UCPAS == this.session.PERFILES[i].ID_PERFIL) {
        this.viewUcpas = true;
      }
    }
  }

  loadDependencias() {
    this.mantenimientoDependenciaService.getDependencias().subscribe(
      data => {
        if (data.length > 0) {
          this.dependencias = data;
        } else {
          swal("Dependencias Nominales", "No se han encontrado dependencias", "info")
        }

        this.dataSource = new MatTableDataSource(this.dependencias);
        this.dataSource.paginator = this.paginator;
        this.dataSource.sort = this.sort;
      });
  }

  filterMatTable(filterValue: any) {
    this.dataSource.filter = filterValue;
  }

  deshabilitarOpciones(gestion: any) {

    return gestion.length == 0;
  }

  validaPreviaBaja(idDependencia){
    this.mantenimientoDependenciaService.getValidaPlazasDep(idDependencia).subscribe(
      data=>{
        if(data.result=='ok'){
          this.baja(idDependencia);
        }else{
         swal("Error", data.msj, "error")
       }
      })      
  }


  baja(idDependencia) {
    this.router.navigate(['/mantenimientos/bajaDependencia/' + idDependencia]);
  }

  regularizar(idDependencia) {
    this.router.navigate(['/mantenimientos/regularizar/' + idDependencia]);
  }

  actualizar(idDependencia) {
    this.router.navigate(['/mantenimientos/actualizarNominal/' + idDependencia]);
  }

  viewDependencia(item): void {

    this.mantenimientoDependenciaService.getDataDependencia(item.DEPENDENCIA).subscribe(
      data => {
        console.log("Acuerdo " + data[0].FECHA_DEL_ACUERDO);
        console.log("Inicio " + data[0].FECHA_ENTRA_VIGENCIA);
    
        if (data.length > 0) {
          this.modalDependencia(data[0]);
        } else {
          swal("Información Dependencia", "No es posible ver la información en este momento. Si el problema persiste contacte al administrador", "error")
        }
      });

  }


  modalDependencia(dataDep) {

    const dialogRef = this.dialog.open(ViewDependenciaComponent, {
      width: '800px',
      height: '400',
      data: dataDep
    });

    dialogRef.afterClosed().subscribe(result => {

    });

  }


}

