import { NgModule, LOCALE_ID, forwardRef } from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RouterModule } from '@angular/router';
import { HttpModule } from '@angular/http';
import { APP_BASE_HREF, DatePipe,registerLocaleData  } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import {
  MatAutocompleteModule,
  MatButtonModule,
  MatButtonToggleModule,
  MatCardModule,
  MatCheckboxModule,
  MatChipsModule,
  MatDialogModule,
  MatExpansionModule,
  MatGridListModule,
  MatIconModule,
  MatInputModule,
  MatListModule,
  MatMenuModule,
  MatNativeDateModule,
  MatPaginatorModule,
  MatProgressBarModule,
  MatProgressSpinnerModule,
  MatRadioModule,
  MatRippleModule,
  MatSelectModule,
  MatSidenavModule,
  MatSliderModule,
  MatSlideToggleModule,
  MatSnackBarModule,
  MatSortModule,
  MatTableModule,
  MatTabsModule,
  MatToolbarModule,
  MatTooltipModule,
  MatStepperModule,
  MatPaginatorIntl,
  MAT_DATE_LOCALE,
  DateAdapter,
  MAT_DATE_FORMATS,
} from '@angular/material';
import { MatDatepickerModule } from '@angular/material/datepicker';

import { AppComponent } from './app.component';


import { FooterModule } from './shared/footer/footer.module';
import { AdminLayoutComponent } from './layouts/admin/admin-layout.component';

import { AppRoutes } from './app.routing';
import { SidebarModule } from './Menu/left/sidebar.module';

import { FixedpluginModule } from './Menu/right/fixedplugin.module';

import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { AuthInterceptor } from './recursos/authInterceptor';
import { LoginComponent } from './pages/login/login.component';
import { FixedpluginComponent } from './Menu/right/fixedplugin.component';
import { NavbarComponent } from './Menu/up/navbar.component';

import { BlockUIModule } from 'ng-block-ui';
import { BlockTemplateComponent } from './block-template.component';
import { BlockUIHttpModule } from 'ng-block-ui/http';
import { MatPaginatorIntlEspaniol } from './pagineo';

import { MAT_MOMENT_DATE_FORMATS, MomentDateAdapter } from '@angular/material-moment-adapter';

import localesGT from '@angular/common/locales/es-GT';

@NgModule({
  exports: [
    MatAutocompleteModule,
    MatButtonModule,
    MatButtonToggleModule,
    MatCardModule,
    MatCheckboxModule,
    MatChipsModule,
    MatStepperModule,
    MatDatepickerModule,
    MatDialogModule,
    MatExpansionModule,
    MatGridListModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatMenuModule,
    MatNativeDateModule,
    MatPaginatorModule,
    MatProgressBarModule,
    MatProgressSpinnerModule,
    MatRadioModule,
    MatRippleModule,
    MatSelectModule,
    MatSidenavModule,
    MatSliderModule,
    MatSlideToggleModule,
    MatSnackBarModule,
    MatSortModule,
    MatTableModule,
    MatTabsModule,
    MatToolbarModule,
    MatTooltipModule
  ]
})
export class MaterialModule {}

registerLocaleData(localesGT, 'es-GT');

@NgModule({
    imports:      [
        CommonModule,
        BrowserAnimationsModule,
        FormsModule,
        RouterModule.forRoot(AppRoutes),
        HttpModule,
        MaterialModule,
        MatNativeDateModule,
        SidebarModule,
        FooterModule,
        HttpClientModule,
        ReactiveFormsModule,
        BlockUIModule.forRoot({
          template: BlockTemplateComponent
        }), // Import BlockUIModule
        BlockUIHttpModule.forRoot(), // Import Block UI Http Module
    ],
    declarations: [
        AppComponent,
        AdminLayoutComponent,
        LoginComponent,
        FixedpluginComponent,
        NavbarComponent,
        BlockTemplateComponent
    ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true
    },
    {
      provide: MatPaginatorIntl,
      useClass: forwardRef(() => MatPaginatorIntlEspaniol)
    },DatePipe,
    DatePipe,
    { provide: LOCALE_ID, useValue: 'es-GT' }, // configuracion español
    {provide: MAT_DATE_LOCALE, useValue: 'es-ES'},
    {provide: DateAdapter, useClass: MomentDateAdapter, deps: [MAT_DATE_LOCALE]},
    {provide: MAT_DATE_FORMATS, useValue: MAT_MOMENT_DATE_FORMATS}  ],
  entryComponents: [
    BlockTemplateComponent // Make sure to add it to the entry components
  ],
    bootstrap:    [ AppComponent ]
})
export class AppModule { }