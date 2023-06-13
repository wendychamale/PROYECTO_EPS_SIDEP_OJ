import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { JerarquiaComponent } from './jerarquia/jerarquia.component';
import { OrganigramaRoutingModule} from './organigrama-routing.module';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from '../app.module';
import { SelectModule } from 'ng2-select';
import {MatTreeModule } from '@angular/material/tree';
import { AddDependenciaComponent } from './add-dependencia/add-dependencia.component';

@NgModule({
  declarations: [ JerarquiaComponent, AddDependenciaComponent],
  imports: [
    CommonModule,
    OrganigramaRoutingModule,
    FormsModule,
    MaterialModule,
    SelectModule,
    ReactiveFormsModule,
    MatTreeModule
  ],
  entryComponents:[
    AddDependenciaComponent]
})
export class OrganigramaModule { }
