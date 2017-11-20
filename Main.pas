unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniButton, uniBitBtn, uniEdit, uniLabel, uniChart, Ec2GradoSol, uniMultiItem,
  uniListBox, Vcl.Imaging.pngimage, uniImage;

type
  TfrmEc2Grado = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    bProgramacion: TUniBitBtn;
    bSalir: TUniBitBtn;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    eValorA: TUniEdit;
    eValorB: TUniEdit;
    eValorC: TUniEdit;
    bResolver: TUniBitBtn;
    UniChart1: TUniChart;
    UniScatterSeries1: TUniScatterSeries;
    lbSoluciones: TUniListBox;
    UniImage1: TUniImage;
    procedure bSalirClick(Sender: TObject);
    procedure bResolverClick(Sender: TObject);
    procedure bProgramacionClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmEc2Grado: TfrmEc2Grado;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function frmEc2Grado: TfrmEc2Grado;
begin
  Result := TfrmEc2Grado(UniMainModule.GetFormInstance(TfrmEc2Grado));
end;

procedure TfrmEc2Grado.bProgramacionClick(Sender: TObject);
begin
  ShowMessage('Leonardo Cruz - lrcl01@hotmail.com');
end;

procedure TfrmEc2Grado.bResolverClick(Sender: TObject);
var
  e2g: TEc2GradoSol;
  c: integer;
  i: Integer;
  x, y: real;
  delta: real;
begin
  e2g:= TEc2GradoSol.Create;
  e2g.ValA:= StrToFloat(eValorA.Text);
  e2g.ValB:= StrToFloat(eValorB.Text);
  e2g.ValC:= StrToFloat(eValorC.Text);
  e2g.solucion;
  lbSoluciones.Clear;
  if e2g.IsUndefined then
  begin
    lbSoluciones.Items.Add('La solución es indefinida');
    lbSoluciones.Items.Add('A = 0');
  end
  else
  begin
    if e2g.IsReal then
    begin
      lbSoluciones.Items.Add('La solución es real');
      lbSoluciones.Items.Add('x1 = '+FloatToStr(e2g.Sol1));
      lbSoluciones.Items.Add('x2 = '+FloatToStr(e2g.Sol2));
    end
    else
    begin
      lbSoluciones.Items.Add('La solución es imaginaria');
      lbSoluciones.Items.Add('real = '+FloatToStr(e2g.Sol1));
      lbSoluciones.Items.Add('imag = '+FloatToStr(e2g.Sol2));
    end;
    UniScatterSeries1.Clear;
    delta:= 10/11;
    for i:= 0 to 10 do
    begin
      x:= -5+i*delta;
      y:= e2g.ValA*sqr(x)+e2g.ValB*x+e2g.ValC;
      UniScatterSeries1.Add(y, IntTostr(trunc(x)));
    end;
  end;
  FreeAndNil(e2g);
end;

procedure TfrmEc2Grado.bSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEc2Grado.UniFormCreate(Sender: TObject);
begin
  lbSoluciones.Items.Add('Por resolver...')
end;

initialization
  RegisterAppFormClass(TfrmEc2Grado);

end.
