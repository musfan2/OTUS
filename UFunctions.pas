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

// Решает квадратное уравнение - результат в виде списка корней
function Solve(A, B, C: Double): TList<Double>;
var
  D, X1, X2: Double;
begin
  Result := TList<Double>.Create;

  D := ((B * B) - (4 * A * C));
  if Round(D * 10000000) < 0 then // Сравниваем целые числа
  begin // Дискременант менше 0 - нет корней
    // WriteLn('Действительных корней нет');
  end
  else if ABS(D) < 0.00000001 then // Сравниваем Double с учётом погрешности
  begin // Дискременант равен 0 - 1 корень
    X1 := (-B / (2 * A));
    Result.Add(X1);
    // WriteLn('Один действительный корень Х = ' + FloatToStr(X1));
  end
  else // Дискременант больше 0 - 2 корня
  begin
    X1 := ((-B + sqrt(D)) / (2 * A));
    X2 := ((-B - sqrt(D)) / (2 * A));
    Result.Add(X1);
    Result.Add(X2);
    // WriteLn('Два корня Х1 = ' + FloatToStr(X1) + ', X2 = ' + FloatToStr(X2));
  end;
end;

end.
