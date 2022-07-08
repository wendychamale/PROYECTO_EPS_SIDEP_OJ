import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormGroup, FormControl, FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-observaciones',
  templateUrl: './observaciones.component.html',
  styleUrls: ['./observaciones.component.scss']
})
export class ObservacionesComponent implements OnInit {

  modalObser: FormGroup;
  observaciones;

  constructor(public dialogRef: MatDialogRef<ObservacionesComponent>, @Inject(MAT_DIALOG_DATA) public data: any) { 
    //this.modalObser.controls.observaciones.setValue(data.OBSERVACIONES);
  }

  ngOnInit() {
  }

  onNoClick(): void {
    this.dialogRef.close();
  } 
  
}
