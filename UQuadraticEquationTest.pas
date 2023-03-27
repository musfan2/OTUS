unit UQuadraticEquationTest;

interface

uses
  DUnitX.TestFramework, System.Generics.Collections, UFunctions;

type

  [TestFixture]
  TMyTestObject = class
  public
    // Тест, который проверяет, что для уравнения x^2+1 = 0 корней нет (возвращается пустой массив)
    [Test]
    [TestCase('TestA', '1,0,1')]
    procedure Test1(const A: Double; const B: Double; const C: Double);
  end;

implementation

procedure TMyTestObject.Test1(const A: Double; const B: Double; const C: Double);
var Res: TList<Double>;
begin
  Res := Solve(A, B, C);
  if Res.Count = 0 then
    Assert.Pass('OK!')
  else
    Assert.Fail('Найдены корни, там где их нет!')
end;



initialization

TDUnitX.RegisterTestFixture(TMyTestObject);

end.
