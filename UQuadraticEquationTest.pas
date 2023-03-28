unit UQuadraticEquationTest;

interface

uses
  DUnitX.TestFramework, System.Generics.Collections, UFunctions, Math;

type

  [TestFixture]
  TMyTestObject = class
  public
    [Test]
    // Тест, который проверяет, что для уравнения x^2+1 = 0 корней нет (возвращается пустой массив)
    [TestCase('Test1', '1,0,1')]
    procedure Test1(const A: Double; const B: Double; const C: Double);

    [Test]
    // Тест, который проверяет, что для уравнения x^2+2x+1 = 0 есть один корень кратности 2 (x1= x2 = -1)
    [TestCase('Test2', '1,2,1')]
    // С учетом того, что дискриминант тоже нельзя сравнивать С 0 через знак равенства,
    // подобрать такие коэффициенты квадратного уравнения для случая одного корня кратности два,
    // чтобы дискриминант был отличный от нуля, но меньше заданного эпсилон.Эти коэффициенты должны заменить коэффициенты в
    // тесте из п.7.
    [TestCase('Test4', '1,2.000000001,1')]
    procedure Test2(const A: Double; const B: Double; const C: Double);

    [Test]
    // Тест, который проверяет, что коэффициент a не может быть равен 0
    [TestCase('Test3', '0,2,1')]
    // Передаём NaN - должна быть ошибка
    [TestCase('Test5', 'NaN,NaN,NaN')]
    // Передаём строку (как пример не правильного типа) - должна быть ошибка
    [TestCase('Test6', 'sdf,пар,2ап')]
    procedure Test3(const A: Double; const B: Double; const C: Double);
  end;

implementation

procedure TMyTestObject.Test1(const A: Double; const B: Double; const C: Double);
var
  Res: TList<Double>;
begin
  Res := Solve(A, B, C);
  if Res.Count = 0 then
    Assert.Pass('OK!')
  else
    Assert.Fail('Найдены корни, там где их нет!')
end;

procedure TMyTestObject.Test2(const A, B, C: Double);
var
  Res: TList<Double>;
begin
  Res := Solve(A, B, C); // Сравниваем целые числа с точностью до 6 знаков
  if (Res.Count = 1) and (Round(Res[0] * 1000000) = -1000000) then
    Assert.Pass('OK!')
  else
    Assert.Fail('Результат не соотвествует ожидаемому!')
end;

procedure TMyTestObject.Test3(const A, B, C: Double);
var
  Res: TList<Double>;
begin
  try
    Res := Solve(A, B, C);
  except
    Res := nil;
    Assert.Pass('OK!'); // Ошибка тут - это НОРМАЛЬНО, согласно ТЗ
  end;

  if Assigned(Res) then // А вот если выполнился успешно - то это ОШИБКА
    Assert.Fail('Результат не соотвествует ожидаемому!')
end;

initialization

TDUnitX.RegisterTestFixture(TMyTestObject);

end.
