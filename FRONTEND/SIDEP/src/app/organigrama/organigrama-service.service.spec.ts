import { TestBed } from '@angular/core/testing';

import { OrganigramaServiceService } from './organigrama-service.service';

describe('OrganigramaServiceService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: OrganigramaServiceService = TestBed.get(OrganigramaServiceService);
    expect(service).toBeTruthy();
  });
});
