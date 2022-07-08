import { Injectable } from "@angular/core"
import { MatPaginatorIntl } from "@angular/material"
@Injectable()
export class MatPaginatorIntlEspaniol extends MatPaginatorIntl {
    itemsPerPageLabel = 'Items por página: ';
    nextPageLabel = 'Página siguiente';
    previousPageLabel = 'Página anterior';

    getRangeLabel = (page: number, pageSize: number, length: number) => {
        return ((page * pageSize) + 1) + ' - ' + ((page * pageSize) + pageSize) + ' de ' + length;
    }
}