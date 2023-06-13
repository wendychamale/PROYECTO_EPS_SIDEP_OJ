import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddDependenciaComponent } from './add-dependencia.component';

describe('AddDependenciaComponent', () => {
  let component: AddDependenciaComponent;
  let fixture: ComponentFixture<AddDependenciaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddDependenciaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddDependenciaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
