program coderage;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  System.JSON,
  mongo in 'mongo.pas';

var
  App: THorse;
begin
  App := THorse.Create(9000);

  App.Use(Jhonson);

  App.Post('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(
        DB('users').InsertOne(Req.Body<TJSONObject>));
    end
  );

  App.Get('/users',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send(DB('users').Find);
    end
  );

  App.Start;
end.
