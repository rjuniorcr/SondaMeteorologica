program Projeto4;

uses
  Forms,
  UnPrincipal in 'UnPrincipal.pas' {FmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmPrincipal, FmPrincipal);
  Application.Run;
end.
