import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { AppModule } from './app.module';
import {enableProdMode} from '@angular/core';
import { environment } from 'environments/environment.prod';


if (environment.production) {
    enableProdMode();
    if(window){
      window.console.log=function(){};
    }
}
enableProdMode();
platformBrowserDynamic().bootstrapModule(AppModule);
