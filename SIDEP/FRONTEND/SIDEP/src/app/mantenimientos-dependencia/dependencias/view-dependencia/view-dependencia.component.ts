import { Component, OnInit, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { FormGroup, FormControl, FormBuilder } from '@angular/forms';
import { DatePipe, Location } from '@angular/common';
import { MantenimientosDependenciaService } from '../../mantenimientos-dependencia.service';

interface Filex extends Blob {
  lastModified: number;
  lastModifiedDate: Date;
  name: string;
  webkitRelativePath: string;
  observ: string;
}

interface Funcionalidad {
  value: string;
  viewValue: string;
}

interface Conector {
  value: string;
  viewValue: string;
}

@Component({
  selector: 'app-view-dependencia',
  templateUrl: './view-dependencia.component.html',
  styleUrls: ['./view-dependencia.component.scss']
})
export class ViewDependenciaComponent implements OnInit {

  floatLabelControl = new FormControl('never');
  nomArchivo;
  idDependencia;
  obsVig;
  
  constructor(private mantenimientoDependenciaService: MantenimientosDependenciaService, public dialogRef: MatDialogRef<ViewDependenciaComponent>, @Inject(MAT_DIALOG_DATA) public data: any, private datePipe : DatePipe) { 
    data.FECHA_CREACION_DEPENDENCIA =  this.datePipe.transform(data.FECHA_CREACION_DEPENDENCIA, 'dd/MM/yyyy');
    data.FECHA_ENTRA_VIGENCIA =  this.datePipe.transform(data.FECHA_ENTRA_VIGENCIA, 'dd/MM/yyyy');
    data.FECHA_PUBLICACION =  this.datePipe.transform(data.FECHA_PUBLICACION, 'dd/MM/yyyy');
    data.FUNCION_UNIDAD = data.FUNCION_UNIDAD == 'N' ? 'JORNADA' : 'TURNO';
    this.nomArchivo = this.nombreArchivo(data.ACUERDO_DIGITAL);
    this.idDependencia = data.DEPENDENCIA;
    this.obsVig = data.OBS_FECHA_VIGENCIA.length > 0 && (data.FECHA_ENTRA_VIGENCIA == "" || data.FECHA_ENTRA_VIGENCIA == undefined);
  }

  ngOnInit() {
  }

  /* upload file*/
  accept = '*'
  files: Filex[] = []
  progress: number
  hasBaseDropZoneOver: boolean = false
  //httpEmitter: Subscription
  //httpEvent: HttpEvent<{}>
  lastFileAt: Date

  sendableFormData: FormData//populated via ngfFormData directive 
   
  /*cancel() {
    this.progress = 0
    if (this.httpEmitter) {
      //console.log('cancelled')
      this.httpEmitter.unsubscribe()
    }
  }*/


  /* fin upload file*/

  nombreArchivo(ruta){
    var dataRuta = ruta.split("/");
    
    return dataRuta.length > 0 ? dataRuta[dataRuta.length - 1] : null;
}

viewPdf(nombre){

  this.mantenimientoDependenciaService.viewFileDep(this.idDependencia).subscribe(
    data => {      
      let blob: Blob = new Blob([data.body], { type: 'application/pdf'});      
      var fileURL = window.URL.createObjectURL(blob);        
      let pdfWindow = window.open("");
        pdfWindow.document.write("<iframe  width='100%' height='100%' src='" + fileURL+"'></iframe>")
      //  pdfWindow.document.write(fileURL);
      pdfWindow.document.title = "Acuerdo " + nombre;

    });   
}

  onNoClick(): void {
    this.dialogRef.close();
  } 

}
