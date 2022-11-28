import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { JerarquiaComponent } from './jerarquia/jerarquia.component';

const routes: Routes = [
  {
    path: 'organigrama',
    component: JerarquiaComponent
  },
  {
    path: '',
    redirectTo: 'organigrama'
  }
];
@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class OrganigramaRoutingModule { }
