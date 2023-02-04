import { Component, OnInit,ChangeDetectionStrategy,ChangeDetectorRef,Input,Output,ViewChild ,Injectable} from '@angular/core';
import {CollectionViewer, SelectionChange, DataSource} from '@angular/cdk/collections';
import {FlatTreeControl} from '@angular/cdk/tree';
import {BehaviorSubject, merge, Observable} from 'rxjs';
import {map} from 'rxjs/operators';
import { OrganigramaServiceService } from '../organigrama-service.service';
import swal,{ SweetAlertOptions } from 'sweetalert2';


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
}
/*Clase para ver hijos del padre seleccionado en el momento*/
export class HijosSeleccionado implements DataSource<NodoDinamico> {
  dataChange = new BehaviorSubject<NodoDinamico[]>([]);

  get data(): NodoDinamico[] {
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
  getLevel = (node: NodoDinamico) => node.level;
  getDesplegable = (node: NodoDinamico) => node.expandable;
  hasChild = (_: number, _nodeData: NodoDinamico) => _nodeData.expandable;

  constructor(private database: CargarNodos,private OrganigramaServiceService: OrganigramaServiceService) {
    this.treeControl = new FlatTreeControl<NodoDinamico>(this.getLevel, this.getDesplegable);
    this.dataSource = new HijosSeleccionado(this.treeControl, database,OrganigramaServiceService);   
  }
  ngOnInit(): void{
    this.getNodoPadre();
  }
  getNodoPadre(): void {
    this.OrganigramaServiceService.getNodosPadre().subscribe(
      data => {
        if(data.length>0 && data.length<=1){ 
        this.padre = data;
        //console.log('consulta padre principal'+this.padre[0].NOMBRE_AREA);
        this.dataSource.data = this.database.InicializarArbol(this.padre[0].NOMBRE_AREA,this.padre[0].CODIGO_AREA);
      }else{
        swal("Organigrama", "No se han encontrado area Hijo", "info")
        console.log("Gestiones sin data"+data.length);
        }
      
      });
  }
}
