import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ActualizacionComponent } from './actualizacion/actualizacion.component';
import { BajaComponent } from './baja/baja.component';
import { RegularizarComponent } from './regularizar/regularizar.component';
import { CreacionComponent } from './creacion/creacion.component';
import { GestionesComponent } from './gestiones/gestiones.component';
import { DependenciasComponent } from './dependencias/dependencias.component';
import { ActualizacionNominalComponent } from './actualizacion-nominal/actualizacion-nominal.component';
import { ComplementosComponent } from './complementos/complementos.component';

const routes: Routes = [
  {
    path: 'gestiones/:id',
    component: GestionesComponent
  },
  {
    path: 'dependencias',
    component: DependenciasComponent
  },
  {
    path: 'complementos',
    component: ComplementosComponent
  },
  {
    path: 'creacion',
    component: CreacionComponent
  },
  {
    path: 'creacion/:id',
    component: CreacionComponent
  },
  {
    path: 'actualizar/:id/:idTipoGestion/:idEstado',
    component: ActualizacionComponent
  },
  {
    path: 'regularizar/:id',
    component: RegularizarComponent
  },
  {
    path: 'bajaDependencia/:id',
    component: BajaComponent
  },
  {
    path: 'actualizarNominal/:id',
    component: ActualizacionNominalComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MantenimientosDependenciaRoutingModule { }
