program SisTeste;

uses
  Forms,
  UPrinc in 'UPrinc.pas' {FPRINC},
  UModulo in 'UModulo.pas' {MODULO: TDataModule},
  UBASE in 'UBASE.pas' {FBASE},
  uLib in 'uLib.pas',
  UCADABA in 'UCADABA.pas' {FCADABA},
  UMODULOP in 'UMODULOP.pas' {MODULOP: TDataModule},
  URelatorio in 'URelatorio.pas' {FRelatorio},
  UBASEPESQUISA in 'UBASEPESQUISA.pas' {FBASEPESQUISA},
  UPESQUISAABA in 'UPESQUISAABA.pas' {FPESQUISAABA};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPRINC, FPRINC);
  Application.CreateForm(TMODULO, MODULO);
  Application.CreateForm(TFBASE, FBASE);
  Application.CreateForm(TFCADABA, FCADABA);
  Application.CreateForm(TMODULOP, MODULOP);
  Application.CreateForm(TFRelatorio, FRelatorio);
  Application.CreateForm(TFBASEPESQUISA, FBASEPESQUISA);
  Application.CreateForm(TFPESQUISAABA, FPESQUISAABA);
  Application.Run;
end.
