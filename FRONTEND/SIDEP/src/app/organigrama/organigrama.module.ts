import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { JerarquiaComponent } from './jerarquia/jerarquia.component';
import { OrganigramaRoutingModule} from './organigrama-routing.module';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MaterialModule } from '../app.module';
import { SelectModule } from 'ng2-select';
import {MatTreeModule } from '@angular/material/tree';

@NgModule({
  declarations: [ JerarquiaComponent],
  imports: [
    CommonModule,
    OrganigramaRoutingModule,
    FormsModule,
    MaterialModule,
    SelectModule,
    ReactiveFormsModule,
    MatTreeModule
  ],
})
export class OrganigramaModule { }
