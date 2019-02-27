unit mongo;

interface

uses
  Ugar;

var
  DB: TUgarDatabase;

implementation

initialization

  DB := TUgar.Init('mongo', 27017, 'coderage');

end.
