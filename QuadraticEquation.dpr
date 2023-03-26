program QuadraticEquation;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, JSON, System.IOUtils, DateUtils, Math,
  System.Generics.Collections;

function Solve(A, B, C: Double): TList<Double>;
var
  D, X1, X2: Double;
begin
  Result := TList<Double>.Create;

  D := ((B * B) - (4 * A * C));
  if D < 0 then
    WriteLn('Действительных корней нет')
  else if D = 0 then
  begin
    X1 := (-B / (2 * A));
    Result.Add(X1);
    WriteLn('Один действительный корень Х = ' + FloatToStr(X1));
  end
  else
  begin
    X1 := ((-B + sqrt(D)) / (2 * A));
    X2 := ((-B - sqrt(D)) / (2 * A));
    Result.Add(X1);
    Result.Add(X2);
    WriteLn('Два корня Х1 = ' + FloatToStr(X1) + ', X2 = ' + FloatToStr(X2));
  end;
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }

    Solve(32, 2, 2);
    ReadLn;

  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;

end.
