import { Component, OnInit,ChangeDetectionStrategy,ChangeDetectorRef,Input,Output,ViewChild ,Injectable} from '@angular/core';
import {CollectionViewer, SelectionChange, DataSource} from '@angular/cdk/collections';
import {FlatTreeControl} from '@angular/cdk/tree';
import {BehaviorSubject, merge, Observable} from 'rxjs';
import {map} from 'rxjs/operators';
import { OrganigramaServiceService } from '../organigrama-service.service';
import swal,{ SweetAlertOptions } from 'sweetalert2';
import {SelectionModel} from '@angular/cdk/collections';
import { AddDependenciaComponent } from '../add-dependencia/add-dependencia.component';
import { MatDialog, MatDialogRef} from '@angular/material/dialog';
/** Nodo que contiene la informacion de cada area del organismoJudicial */
export class NodoDinamico {
  constructor(public item: string,public id:number,public level = 1, public expandable = false,public isLoading = false,
  ) {} 
}

@Injectable({providedIn: 'root'})
export class CargarNodos {
  dataMap = new Map<string, string[]>([]);
  NodoRaiz: string[] = [];

  /** Inicializamos el nodo raiz*/
  InicializarArbol(Padre:string, idPadre:number): NodoDinamico[] {
    this.dataMap = new Map<string, string[]> ([ [Padre,[]], ]);
    this.NodoRaiz=[Padre];
    return this.NodoRaiz.map(name => new NodoDinamico(name,idPadre,0, true));
  }


  getNodosHijos(node: string,hijos:string[]): string[] | undefined {
    console.log('---Consultamos hijos de'+node);
    this.dataMap.set(node,hijos);
    console.log(this.dataMap);
    return this.dataMap.get(node);
  }

  getDesplegable(node: string,hijosc:Array<any>): boolean {
  //  console.log('---Es desplegable'+node+"---");
    const tienehijos=false;
    var codigo=-1;
    for (let hijo of hijosc){
      if(hijo.nombre==node && hijo.hijos>0){
       codigo=hijo.codigo;
       return true;
      }      
    }
    return false;
  }

  getIdNodo(node: string,hijosc:Array<any>): number {
    for (let hijo of hijosc){
      if(hijo.nombre==node){
       return hijo.codigo;
      }      
    }
    return 0;
  }

    /** Add an item to to-do list */
    deleteItem(parent: NodoDinamico, name: string, dataChange: any, NodoDinamico: NodoDinamico[]) : NodoDinamico[] {
      console.log("-----------------");
      console.log(parent);
      console.log("-----------------");
      console.log(this.dataMap);
   //   console.log(this.dataMap.get(parent.item));
    
      // sirve para eliminar el nodo selecccionado
      var i = this.dataMap.get(parent.item).indexOf( name );
       if ( i !== -1 ) {
      this.dataMap.get(parent.item).splice( i, 1 );
      }
     console.log("nombre"+parent.item);
   
     for (let i=0; i < NodoDinamico.length; i++){
      if(NodoDinamico[i].item==name){
        console.log("lo encontro en "+i);
        NodoDinamico.splice(i,1);
      }
      
    }

     console.log(NodoDinamico);

      //console.log(this.dataMap);

      return NodoDinamico;
   }

   AddNewItem(parent: NodoDinamico, name: string, dataChange: any, NodoDinamico: NodoDinamico[],NodoN: NodoDinamico) : boolean {
 //   console.log(this.dataMap.get(parent.item));
    if (this.dataMap.get(parent.item)==undefined){
     const hijos=[name];
     this.dataMap.set(parent.item,hijos);
     console.log(NodoDinamico);
     console.log( this.dataMap.set(parent.item,hijos));
    console.log(NodoDinamico);
     return true;
    }else{
      this.dataMap.get(parent.item).push(name)
    return false;
    }
    console.log(this.dataMap);
   // NodoDinamico.splice(NodoDinamico.length,0,parent);

   // return NodoDinamico;
 }

}


/*Clase para ver hijos del padre seleccionado en el momento*/
export class HijosSeleccionado implements DataSource<NodoDinamico> {
  dataChange = new BehaviorSubject<NodoDinamico[]>([]);

  get data(): NodoDinamico[] {
    console.log("datachange");
    console.log(this.dataChange.value);
    return this.dataChange.value;
  }
  set data(value: NodoDinamico[]) {
    this._treeControl.dataNodes = value;
    this.dataChange.next(value);
  }

  constructor(
    private _treeControl: FlatTreeControl<NodoDinamico>,
    private _database: CargarNodos,
    private OrganigramaServiceService: OrganigramaServiceService
  ) {}

  connect(collectionViewer: CollectionViewer): Observable<NodoDinamico[]> {
    this._treeControl.expansionModel.changed.subscribe(change => {
      if (
        (change as SelectionChange<NodoDinamico>).added ||
        (change as SelectionChange<NodoDinamico>).removed
      ) {
        this.handleTreeControl(change as SelectionChange<NodoDinamico>);
      }
    });

    return merge(collectionViewer.viewChange, this.dataChange).pipe(map(() => this.data));
  }

  disconnect(collectionViewer: CollectionViewer): void {}

  /** verifica si se selecciono o comprimio un padre con hijos*/
  handleTreeControl(change: SelectionChange<NodoDinamico>) {
    console.log("seleciono un padre");
    console.log(change);
    if (change.added) {
      change.added.forEach(node => this.toggleNode(node, true));
    }
    if (change.removed) {
      change.removed
        .slice()
        .reverse()
        .forEach(node => this.toggleNode(node, false));
    }
  }

  /**
   * Consultamos hijos del padre seleccionado
   */
  toggleNode(node: NodoDinamico, expand: boolean) {
 //   console.log('***Consultamos hijos de'+node.item+ "id"+node.id);
 
    this.OrganigramaServiceService.getNodosHijos(node.id).subscribe(
      data => {
        if(data.length>0){ 
          var hijos:Array<any>=[];
          var hijosc:Array<any>=[];
        for (let hijo of data){
            hijos.push(hijo.NOMBRE_AREA);
            hijosc.push({codigo:hijo.CODIGO_AREA, nombre:hijo.NOMBRE_AREA,hijos:hijo.HIJOS});
          }
    const children = this._database.getNodosHijos(node.item,hijos);
    const index = this.data.indexOf(node);
    if (!children || index < 0) {
      return;
    }

    node.isLoading = true;

    setTimeout(() => {
      if (expand) {       
        const nodes = children.map(
          name => new NodoDinamico(name, this._database.getIdNodo(name,hijosc),node.level + 1, this._database.getDesplegable(name,hijosc)),
        );
        this.data.splice(index + 1, 0, ...nodes);
      } else {
        let count = 0;
        for (
          let i = index + 1;
          i < this.data.length && this.data[i].level > node.level;
          i++, count++
        ) {}
        this.data.splice(index + 1, count);
      }
      this.dataChange.next(this.data);
      node.isLoading = false;
    }, 1000);
      }
      });

    }
    
}

/* CLASE PRINCIPAL PARA REALIZAR EL ORGANIGRAMA*/

@Component({
  selector: 'app-jerarquia',
  templateUrl: './jerarquia.component.html',
  styleUrls: ['./jerarquia.component.scss']
})
export class JerarquiaComponent implements OnInit {
  padre:any;
  treeControl: FlatTreeControl<NodoDinamico>;
  dataSource: HijosSeleccionado;
  checklistSelection = new SelectionModel<NodoDinamico>(true /* multiple */);

  getLevel = (node: NodoDinamico) => node.level;
  getDesplegable = (node: NodoDinamico) => node.expandable;
  hasChild = (_: number, _nodeData: NodoDinamico) => _nodeData.expandable;
  hasNoContent = (_nodeData: NodoDinamico) => _nodeData.item === '';
  dataChange = new BehaviorSubject<NodoDinamico[]>([]);
  nodon : any;

  get data(): NodoDinamico[] {
    return this.dataChange.value;
  }
  set data(value: NodoDinamico[]) {
    this.treeControl.dataNodes = value;
    this.dataChange.next(value);
  }




  constructor(private database: CargarNodos,private OrganigramaServiceService: OrganigramaServiceService,public dialog: MatDialog) {
    this.treeControl = new FlatTreeControl<NodoDinamico>(this.getLevel, this.getDesplegable);
    this.dataSource = new HijosSeleccionado(this.treeControl, database,OrganigramaServiceService);   
  }
  ngOnInit(): void{
    this.getNodoPadre();
  }


      /** Select the category so we can insert the new item. */
  addNewItem(node: NodoDinamico) {
    console.log("agregar nueva dependencia"+ node.item)
    console.log(this.hasNoContent);
    console.log(this.hasChild);
  }

  DeleteItem(node: NodoDinamico) {

    console.log("quitamos la dependencia"+ node.item+node.id)
    this.OrganigramaServiceService.DeleteNodos(node.id).subscribe(
      data => {
        console.log('consulta eliminacion nodo'+data);
        console.log(data);
        console.log(this.database.dataMap);
       const parentNode = this.getParentNode(node);
       console.log(parentNode);

       var expandible=false;
  
       if(data[0].HIJOS>0){
        expandible=true;
       }


       console.log(this.database.dataMap.get(data[0].NOMBRE_AREA));
       console.log("es expandible aun"+expandible);
       parentNode.expandable=expandible;
       

       console.log(this.database.dataMap);

       const nodo= this.database.deleteItem(parentNode, node.item,this.dataChange,this.dataSource.data);
       
     
       if(parentNode.expandable==false){
        console.log("eliminamos en el map");
        this.database.dataMap.delete(parentNode.item);
    
       }

        console.log(this.database.dataMap);
        this.dataSource.data=nodo;
        this.dataChange.next(this.dataSource.data);
        if(parentNode.expandable==false){
          this. ngOnInit();
         }
      });

  }

/* Get the parent node of a node */
getParentNode(node: NodoDinamico): NodoDinamico | null {
  const currentLevel = this.getLevel(node);

  if (currentLevel < 1) {
    return null;
  }

  const startIndex = this.treeControl.dataNodes.indexOf(node) - 1;

  for (let i = startIndex; i >= 0; i--) {
    const currentNode = this.treeControl.dataNodes[i];

    if (this.getLevel(currentNode) < currentLevel) {
      return currentNode;
    }
  }
  return null;
}
    


  getNodoPadre(): void {
    this.OrganigramaServiceService.getNodosPadre().subscribe(
      data => {
        if(data.length>0 && data.length<=1){ 
        this.padre = data;
        this.dataSource.data = this.database.InicializarArbol(this.padre[0].NOMBRE_AREA,this.padre[0].CODIGO_AREA);
      }else{
        swal("Organigrama", "No se han encontrado area Hijo", "info")
        console.log("Gestiones sin data"+data.length);
        }
      
      });
  }

  //Acceder al modal de dependencia
  
  modalAddDependencia(dataDep){
    console.log('aqui---------------------------------------------------')
    console.log(dataDep);
    const dialogRef = this.dialog.open(AddDependenciaComponent, {
      width: '800px',
      height: '400',
      data: dataDep});

      dialogRef.afterClosed().subscribe(result => {
        if(result != undefined){
          console.log(result);

          
           this.saveItem(result,dataDep);
        }else{
          swal("Error", "No se puede agregar una dependencia Vacia", "error")

        }

      });
    
  }

  saveItem(resulta,datasDep){

    let dataDep = {  
         CODIGO_AREA: null,
         NOMBRE_AREA : resulta,
         DESCRIPCION_AREA: '',
         AREA_PADRE : datasDep.id
    };
    console.log(dataDep);
 
    this.OrganigramaServiceService.AddNodos(dataDep).subscribe(
       data => {
        console.log(data);
        console.log(resulta);
         if(data.result=='OK'){
           swal("Dependencia Agregado Exitosamente", "", "success")
           datasDep.expandable=true;
    
           const nodo = this.database.AddNewItem(datasDep, resulta,this.dataChange,this.dataSource.data,this.nodon);
           console.log(nodo);
          
           if(nodo==true){
            this. ngOnInit();

           }
         /*  console.log(this.database.dataMap);
           this.dataSource.data=nodo;
           this.dataChange.next(this.dataSource.data);
           console.log(this.dataSource.data);
           this.dataChange.next(this.dataSource.data);*/
        

          }else{
           swal("Error", data.msj, "error")
         } 
       });
 
   }
}
