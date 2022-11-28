import { NgModule } from '@angular/core';
import { Routes,RouterModule } from '@angular/router';

import { AdminLayoutComponent } from './layouts/admin/admin-layout.component';
import { AuthGuardService, validarPermisos } from './guardAccesos/auth-guard.service';
import { LoginComponent } from './pages/login/login.component';

export const AppRoutes: Routes = [
    {
      path: '',
      component: AdminLayoutComponent,
      //data: {paginas: [33]},
      //canActivate: [AuthGuardService],
      children: [
        {
            path: '',
            loadChildren: './home/home.module#HomeModule',
            canActivate: [AuthGuardService],
            //component:HomeComponent
        },
        {
            path: 'reportes',
            loadChildren: './reportes/reportes.module#ReportesModule',
        },
        {
            path: 'padre',
            loadChildren: './genericopadre/genericopadre.module#Genericopadre',
            //data: {paginas: [33]},
            //canActivate:[validarPermisos]
        },
        {
            path: 'mantenimientos',
            loadChildren: './mantenimientos-dependencia/mantenimientos-dependencia.module#MantenimientosDependenciaModule',
            //data: {paginas: [33]},
            //canActivate:[validarPermisos]
        },
        {
            path: 'organigrama',
            loadChildren: './organigrama/organigrama.module#OrganigramaModule',
        }
    ]
    }, 
    {
      path: 'login',
      component: LoginComponent
    },    
    {
        path: '**',
        redirectTo: ''
    }
];

@NgModule({
    imports: [RouterModule.forRoot(AppRoutes)],
    exports: [RouterModule]
  })
  export class AppRoutingModule { }
