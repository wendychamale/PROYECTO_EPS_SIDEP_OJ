import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from '../app.module';
import { ngfModule} from "angular-file";

import { MantenimientosDependenciaRoutingModule } from './mantenimientos-dependencia-routing.module';
import { CreacionComponent } from './creacion/creacion.component';
import { ActualizacionComponent } from './actualizacion/actualizacion.component';
import { RegularizarComponent } from './regularizar/regularizar.component';
import { BajaComponent } from './baja/baja.component';
import { GestionesComponent } from './gestiones/gestiones.component';
import { RechazarComponent } from './gestiones/rechazar/rechazar.component';
import { ConfirmarComponent } from './gestiones/confirmar/confirmar.component';
import { ViewComponent } from './gestiones/view/view.component';
import { DependenciasComponent } from './dependencias/dependencias.component';
import { ViewDependenciaComponent } from './dependencias/view-dependencia/view-dependencia.component';
import { ObservacionesComponent } from './gestiones/observaciones/observaciones.component';
import { ActualizacionNominalComponent } from './actualizacion-nominal/actualizacion-nominal.component';
import { ComplementosComponent } from './complementos/complementos.component';
import { CorreoComponent } from './complementos/correo/correo.component';
import { CodigoDespachoComponent } from './complementos/codigo-despacho/codigo-despacho.component';
import { EliminarComponent } from './gestiones/eliminar/eliminar.component';

@NgModule({
  declarations: [CreacionComponent, ActualizacionComponent, RegularizarComponent, BajaComponent, GestionesComponent, RechazarComponent, ConfirmarComponent, ViewComponent, DependenciasComponent, ViewDependenciaComponent, ObservacionesComponent, ActualizacionNominalComponent, ComplementosComponent, CorreoComponent, CodigoDespachoComponent, EliminarComponent],
  imports: [
    CommonModule,
    MantenimientosDependenciaRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    MaterialModule,
    ngfModule
  ],
  entryComponents:[
    RechazarComponent,
    ConfirmarComponent,
    ViewComponent,
    ViewDependenciaComponent,
    ObservacionesComponent,
    CorreoComponent,
    CodigoDespachoComponent,
    EliminarComponent]
})
export class MantenimientosDependenciaModule { }
