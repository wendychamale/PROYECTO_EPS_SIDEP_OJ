import { Component, OnInit ,Inject} from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormGroup, FormBuilder, Validators, FormControl } from '@angular/forms';

@Component({
  selector: 'app-add-dependencia',
  templateUrl: './add-dependencia.component.html',
  styleUrls: ['./add-dependencia.component.scss']
})
export class AddDependenciaComponent  {
  modalAddDependencia: FormGroup;
  floatLabelControl = new FormControl('none');
  dependencia;
 
  constructor(private fb: FormBuilder, public dialogRef: MatDialogRef<AddDependenciaComponent>, @Inject(MAT_DIALOG_DATA) public data: any) { 
    this.modalAddDependencia = this.fb.group({
      floatLabel: this.floatLabelControl,
      dependencia: ['', [Validators.required]]});           
      

      if(data.item == '' || data.item == undefined){
        data.item = null;
      }  
      
      

      
  }
  get f() { return this.modalAddDependencia.controls; }

  retornar(){
    this.dependencia = this.modalAddDependencia.value.dependencia;
    this.dialogRef.close(this.dependencia);
  }  

  onNoClick(): void {
    this.dialogRef.close();
  } 

}
