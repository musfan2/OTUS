unit UFunctions;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, JSON, System.IOUtils, DateUtils, Math,
  System.Generics.Collections;

// const


// type

function Solve(A, B, C: Double): TList<Double>;

implementation

// uses

function Solve(A, B, C: Double): TList<Double>;
var
  D, X1, X2: Double;
begin
  Result := TList<Double>.Create;

  D := ((B * B) - (4 * A * C));
  if D < 0 then
  begin
    // WriteLn('Действительных корней нет');
  end
  else if D = 0 then
  begin
    X1 := (-B / (2 * A));
    Result.Add(X1);
    // WriteLn('Один действительный корень Х = ' + FloatToStr(X1));
  end
  else
  begin
    X1 := ((-B + sqrt(D)) / (2 * A));
    X2 := ((-B - sqrt(D)) / (2 * A));
    Result.Add(X1);
    Result.Add(X2);
    // WriteLn('Два корня Х1 = ' + FloatToStr(X1) + ', X2 = ' + FloatToStr(X2));
  end;
end;

end.
