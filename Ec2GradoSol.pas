unit Ec2GradoSol;

interface

Type
TEc2GradoSol = class(TObject)
  private
    FValB: real;
    FValC: real;
    FValA: real;
    FSol2: real;
    FSol1: real;
    FIsReal: boolean;
    FIsUndefined: boolean;
    procedure SetSol1(const Value: real);
    procedure SetSol2(const Value: real);
    procedure SetValA(const Value: real);
    procedure SetValB(const Value: real);
    procedure SetValC(const Value: real);
    procedure SetIsReal(const Value: boolean);
    procedure SetIsUndefined(const Value: boolean);
  published
    property ValA: real read FValA write SetValA;
    property ValB: real read FValB write SetValB;
    property ValC: real read FValC write SetValC;
    property Sol1: real read FSol1 write SetSol1;
    property Sol2: real read FSol2 write SetSol2;
    property IsReal: boolean read FIsReal write SetIsReal;
    property IsUndefined: boolean read FIsUndefined write SetIsUndefined;
    Constructor Create; overload;
    procedure solucion;
end;

implementation

{ TEc2GradoSol }

constructor TEc2GradoSol.Create;
begin
  ValA:= 1.0;
  ValB:= 2.0;
  ValC:= 1.0;
end;

procedure TEc2GradoSol.SetIsReal(const Value: boolean);
begin
  FIsReal := Value;
end;

procedure TEc2GradoSol.SetIsUndefined(const Value: boolean);
begin
  FIsUndefined := Value;
end;

procedure TEc2GradoSol.SetSol1(const Value: real);
begin
  FSol1 := Value;
end;

procedure TEc2GradoSol.SetSol2(const Value: real);
begin
  FSol2 := Value;
end;

procedure TEc2GradoSol.SetValA(const Value: real);
begin
  FValA := Value;
end;

procedure TEc2GradoSol.SetValB(const Value: real);
begin
  FValB := Value;
end;

procedure TEc2GradoSol.SetValC(const Value: real);
begin
  FValC := Value;
end;

procedure TEc2GradoSol.solucion;
var
  rDesc: real;
begin
  if ValA <> 0 then
  begin
    IsUndefined:= false;
    rDesc:= Sqr(ValB)-4*ValA*ValC;
    if rDesc < 0 then
    begin
      IsReal:= false;
      Sol1:= -ValB/(2*ValA);
      Sol2:= sqrt(-rDesc)/(2*ValA);
    end
    else
    begin
      IsReal:= true;
      Sol1:= (-ValB+sqrt(rDesc))/(2*ValA);
      Sol2:= (-ValB-sqrt(rDesc))/(2*ValA);
    end;
  end
  else
    IsUndefined:= true;
end;

end.
