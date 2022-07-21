import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { MantenimientosDependenciaService } from '../../mantenimientos-dependencia.service';

@Component({
  selector: 'app-rechazar',
  templateUrl: './rechazar.component.html',
  styleUrls: ['./rechazar.component.scss']
})
export class RechazarComponent {

  rechazar: FormGroup;
  observaciones;
  codPres;
  dependenciaRef;
  codDepRef;
  valTipo;
  
  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, private fb: FormBuilder, public dialogRef: MatDialogRef<RechazarComponent>, @Inject(MAT_DIALOG_DATA) public data: any) { 
    data.OBSERVACIONES='';

    this.rechazar = this.fb.group({
      observaciones: ['', Validators.required]});          

      this.codPres = data.CODIGO_PRESUPUESTARIO;
      this.valTipo = data.ID_TIPO_GESTION == 3;
      if(this.valTipo){
      this.dependenciaReferencia();
      }

    }

    dependenciaReferencia(){
      this.mantenimientoDependenciaService.getReferenciaDepRegularizar(this.codPres).subscribe(
        data => {      
          this.dependenciaRef = data[0].NOMBRE_DEPENDENCIA;
          this.codDepRef = data[0].DEPENDENCIA;
        });      
     }
      
  get f() { return this.rechazar.controls; }
  
  retornar(){
    this.data.OBSERVACIONES = this.rechazar.value.observaciones;
    this.dialogRef.close(this.data);
  }  

  onNoClick(): void {
    this.dialogRef.close();
  } 

}
