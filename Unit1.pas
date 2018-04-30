unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  TPerson = class
  private
    FName: string;
  public
    constructor Create(Name: String);
    procedure Show; virtual;
  end;

  TFinery = class(TPerson)
  protected
    FComponet: TPerson;
    procedure Decorate(AComp: TPerson);
  public
    constructor Create;
    procedure Show; override;
  end;

  TShirt = class(TFinery)
  public
    procedure Show; override;
  end;

  TTrousers = class(TFinery)
  public
    procedure Show; override;
  end;

  TShoes = class(TFinery)
  public
    procedure Show; override;
  end;

  TSuit = class(TFinery)
  public
    procedure Show; override;
  end;

  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    FPerson: TPerson;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TPerson }

constructor TPerson.Create(Name: String);
begin
  FName := Name;
end;

procedure TPerson.Show;
begin
  OutputDebugString(PChar(Format('%s的装扮是',[FName])));
end;

{ TFinery }

constructor TFinery.Create;
begin

end;

procedure TFinery.Decorate(AComp: TPerson);
begin
  FComponet := AComp;
end;

procedure TFinery.Show;
begin
  inherited;
  if FComponet <> nil then
    FComponet.Show;
end;

{ TShirt }

procedure TShirt.Show;
begin
  OutputDebugString(pchar('TShir is On'));
  inherited;
end;

{ TShoes }

procedure TShoes.Show;
begin
  OutputDebugString(pchar('TShoes is On'));
  inherited;
end;

{ TTrousers }

procedure TTrousers.Show;
begin
  OutputDebugString(PChar('Trousers is on'));
  inherited;
end;

{ TSuit }

procedure TSuit.Show;
begin
  OutputDebugString(PChar('Suit is on'));
  inherited;
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  AShoes: TShoes;
  ASuit: TSuit;
  ATrousers: TTrousers;
  AShirt: TShirt;
begin
  if not Assigned(FPerson) then
    FPerson := TPerson.Create('小菜');
  AShoes := TShoes.Create;
  ASuit := TSuit.Create;
  ATrousers := TTrousers.Create;
  AShirt := TShirt.Create;
  AShirt.Decorate(FPerson);
  ASuit.Decorate(AShirt);
  ATrousers.Decorate(ASuit);
  AShoes.Decorate(ATrousers);
  AShoes.Show;

end;

end.
