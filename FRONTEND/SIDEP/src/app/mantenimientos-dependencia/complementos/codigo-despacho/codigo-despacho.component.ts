import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormGroup, FormBuilder, Validators, FormControl } from '@angular/forms';
import { MantenimientosDependenciaService } from '../../mantenimientos-dependencia.service';

@Component({
  selector: 'app-codigo-despacho',
  templateUrl: './codigo-despacho.component.html',
  styleUrls: ['./codigo-despacho.component.scss']
})
export class CodigoDespachoComponent{

  modalDespacho: FormGroup;
  floatLabelControl = new FormControl('none');
  codDespacho;
  validaCodigo = false;

  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, private fb: FormBuilder, public dialogRef: MatDialogRef<CodigoDespachoComponent>, @Inject(MAT_DIALOG_DATA) public data: any) { 

    this.modalDespacho = this.fb.group({
      floatLabel: this.floatLabelControl,
      codDespacho: ['', Validators.required]});          

      if(data.ID_DEP_RH_CIDEJ == '' || data.ID_DEP_RH_CIDEJ == undefined){
        data.ID_DEP_RH_CIDEJ = null;
      }  
      
      if(data.ID_DESPACHO != undefined){
      this.modalDespacho.controls.codDespacho.setValue(data.ID_DESPACHO);
      }

    }

  get f() { return this.modalDespacho.controls; }

  retornar(){
    this.data.ID_DESPACHO = this.modalDespacho.value.codDespacho;
    this.dialogRef.close(this.data);
  }  

  onNoClick(): void {
    this.dialogRef.close();
  } 

  //Validar Código de Despacho
  validaDespacho(){
 
    this.mantenimientoDependenciaService.getValidaDespacho(this.modalDespacho.value.codDespacho).subscribe(
      data => {
        if(data.result=='ok'){
          this.validaCodigo = false;
          this.retornar(); 
       }else{
          this.validaCodigo = true;
        } 
      });

  }

  viewValidacion(valor : any): void{
    this.validaCodigo = false;
  } 

}
