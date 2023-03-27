program QuadraticEquation;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, JSON, System.IOUtils, DateUtils, Math,
  System.Generics.Collections, UFunctions;

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
