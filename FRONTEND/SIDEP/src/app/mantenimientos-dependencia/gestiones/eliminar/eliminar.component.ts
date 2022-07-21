import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-eliminar',
  templateUrl: './eliminar.component.html',
  styleUrls: ['./eliminar.component.scss']
})
export class EliminarComponent {

  eliminar: FormGroup;
  observaciones;

  constructor(private fb: FormBuilder, public dialogRef: MatDialogRef<EliminarComponent>, @Inject(MAT_DIALOG_DATA) public data: any) { 
    data.OBSERVACIONES='';

    this.eliminar = this.fb.group({
      observaciones: ['', Validators.required]});          
  }

  get f() { return this.eliminar.controls; }

  retornar(){
    this.data.OBSERVACIONES = this.eliminar.value.observaciones;
    this.dialogRef.close(this.data);
  }  

  onNoClick(): void {
    this.dialogRef.close();
  } 

}
