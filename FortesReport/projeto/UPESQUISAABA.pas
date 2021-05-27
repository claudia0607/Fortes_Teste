unit UPESQUISAABA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBASEPESQUISA, ActnList, ImgList, DB, StdCtrls, Buttons,
  ExtCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  TFPESQUISAABA = class(TFBASEPESQUISA)
    Label2: TLabel;
    DataSource2: TDataSource;
    Label3: TLabel;
    DBTID: TDBText;
    DBTIMPOSTO: TDBText;
    Label4: TLabel;
    DBTVALOR: TDBText;
    DBTBOMBA: TDBText;
    Label5: TLabel;
    DBTDATA: TDBText;
    Label6: TLabel;
    DBTLITROS: TDBText;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    { Public declarations }
    // PROCEDIMENTO PARA REALIZAR A CONSULTA
    procedure Search; override;
    // PROCEDIMENTO PARA AUMENTAR O TAMANHO DO FORMULARIO P/ VISUALIZAR A PARTE DE  DETALHES DO REGISTRO
    procedure AUMENTA_FORM; override;
    // PROCEDIMENTO PARA ORDENAR OS REGISTROS POR CÓDIGO OU POR NOME
    procedure ORDENAR; override;
    // PROCEDIMENTO P/ BUSCAR DETALHES DO REGISTRO, SE A PARTE DE DETALHES ESTIVER À MOSTRA
    procedure VER_REGISTRO; override;
  end;

var
  FPESQUISAABA: TFPESQUISAABA;

implementation

{$R *.dfm}
uses uLib, UMODULOP, UMODULO;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA REALIZAR A CONSULTA (POR DESCRIÇÃO)
procedure TFPESQUISAABA.Search;
begin
  inherited;
  if EDPROC.Text <> '' then
     // BUSCANDO PELAS INICIAIS:
     FilterSearch(MODULOP.cdsPesquisaABAS, fsSearch, fsINI, EDPROC.Text)
    else
     // BUSCAR TODOS OS REGISTROS
     FilterSearch(MODULOP.cdsPesquisaABAS, fsSearch, fsINI, '%');


 // SE A PARTE DE DETALHES ESTIVER À MOSTRA - BUSCAR DETALHES DO REGISTRO
 if (FPESQUISAABA.HEIGHT = 440) AND (MODULOP.cdsPesquisaABA.RecordCount > 0) THEN
     FilterSearch(modulo.CDSABA, fsFilter, fsINT, INTTOSTR(MODULOP.cdsPesquisaABASABA_ID.AsInteger));

end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA AUMENTAR O TAMANHO DO FORMULARIO P/ VISUALIZAR A PARTE DE  DETALHES DO REGISTRO
procedure TFPESQUISAABA.AUMENTA_FORM;
begin
 inherited;
 HEIGHT := 440;
 WIDTH := 560;

end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA ORDENAR OS REGISTROS POR CÓDIGO OU POR NOME
procedure TFPESQUISAABA.ORDENAR;
var
 v_todos :string;
begin
  inherited;

  v_todos := '%';
   IF RGPROC.ItemIndex = 0 THEN
      BEGIN
       MODULOP.cdsPesquisaABAS.Close;
       MODULOP.cdsPesquisaABAS.CommandText := 'select * from ABASTECIMENTOS where UPPER(ABA_ID) like :ID ORDER BY ABA_ID';
       MODULOP.cdsPesquisaABAS.Params[0].AsSTRING := UpperCase('%' + v_todos + '%');
       MODULOP.cdsPesquisaABAS.OPEN;
      END
     ELSE
      IF RGPROC.ItemIndex = 1 THEN
         BEGIN
          MODULOP.cdsPesquisaABAS.Close;
          MODULOP.cdsPesquisaABAS.CommandText := 'select * from ABASTECIMENTOS where UPPER(ABA_ID) like :ID ORDER BY ABA_BOMBA';
          MODULOP.cdsPesquisaABAS.Params[0].AsSTRING := UpperCase('%');
          MODULOP.cdsPesquisaABAS.OPEN;
         END;

end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO P/ BUSCAR DETALHES DO REGISTRO, SE A PARTE DE DETALHES ESTIVER À MOSTRA
procedure TFPESQUISAABA.VER_REGISTRO;
begin
  inherited;
  if (FPESQUISAABA.HEIGHT = 440)  AND (MODULOP.cdsPesquisaABAS.RecordCount > 0) THEN
    FilterSearch(MODULO.CDSABA, fsFilter, fsINT, MODULOP.cdsPesquisaABASABA_ID.AsString);
end;


end.
