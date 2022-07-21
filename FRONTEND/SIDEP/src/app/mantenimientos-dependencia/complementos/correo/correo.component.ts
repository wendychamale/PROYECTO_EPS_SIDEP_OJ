import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormGroup, FormBuilder, Validators, FormControl } from '@angular/forms';

@Component({
  selector: 'app-correo',
  templateUrl: './correo.component.html',
  styleUrls: ['./correo.component.scss']
})
export class CorreoComponent {

  modalCorreo: FormGroup;
  floatLabelControl = new FormControl('none');
  correo;

  constructor(private fb: FormBuilder, public dialogRef: MatDialogRef<CorreoComponent>, @Inject(MAT_DIALOG_DATA) public data: any) { 
 
    this.modalCorreo = this.fb.group({
      floatLabel: this.floatLabelControl,
      correo: ['', [Validators.required,Validators.email]]});           
      

      if(data.ID_DEPENDENCIA_CORREO == '' || data.ID_DEPENDENCIA_CORREO == undefined){
        data.ID_DEPENDENCIA_CORREO = null;
      }  
      
      if(data.CORREO_ELECTRONICO != undefined){
      this.modalCorreo.controls.correo.setValue(data.CORREO_ELECTRONICO);
      }
  }

  get f() { return this.modalCorreo.controls; }

  retornar(){
    this.data.CORREO_ELECTRONICO = this.modalCorreo.value.correo;
    this.dialogRef.close(this.data);
  }  

  onNoClick(): void {
    this.dialogRef.close();
  } 

}
