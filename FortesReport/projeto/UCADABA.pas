unit UCADABA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBASE, ImgList, DB, ActnList, QRCtrls, QuickRpt, StdCtrls,
  ExtCtrls, ComCtrls, Buttons, Mask, DBCtrls;

type
  TFCADABA = class(TFBASE)
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    DBELITROS: TDBEdit;
    DBEVALOR: TDBEdit;
    Label11: TLabel;
    DBEDATA: TDBEdit;
    Label12: TLabel;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    Label3: TLabel;
    DBEBOMBA: TDBEdit;
    DBTIMPOSTO: TDBText;
    DBTID: TDBText;

    procedure ACTINCExecute(Sender: TObject);
    procedure ACTALTExecute(Sender: TObject);
    procedure ACTEXCExecute(Sender: TObject);
    procedure ACTOKExecute(Sender: TObject);
    procedure DBEBOMBAExit(Sender: TObject);
    procedure DBEVALORExit(Sender: TObject);
    procedure DBEDATAKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

      // PROCEDIMENTO PARA GUARDAR O CÓDIGO ATUAL, PARA POSTERIOR LOCALIZAÇÃO
      procedure GUARDA_REGISTRO; override;
      // PROCEDIMENTO PARA LOCALIZAÇÃO DO REGISTRO DESEJADO NO RETORNO DO OK
      procedure LOCALIZA_REGISTRO; override;
      // PROCEDIMENTO PARA CONSULTA RÁPIDA DE REGISTRO POR ID
      procedure SEARCH; override;
      // PROCEDIMENTO PARA FOCAR DETERMINADO CAMPO , QDO NECESSÁRIO
      procedure FOCAR; override;
      // PROCEDIMENTO PARA EFETUAR ALTERAÇÕES NO BANCO
      procedure APPLY_UPDATES; override;
      // PROCEDIMENTO PARA CANCELAR ATUALIZAÇÕES PENDENTES
      procedure CANCEL_UPDATES; override;
      // PROCEDIMENTO PARA CHAMAR FORMULARIO DE PESQUISA
      procedure PESQUISA; override;
      // PROCEDIMENTO PARA CAMINHAR PARA O PRIMEIRO REGISTRO
      procedure PRIMEIRO;override;
      // PROCEDIMENTO PARA CAMINHAR PARA O REGISTRO ANTERIOR
      procedure ANTERIOR; override;
      // PROCEDIMENTO PARA CAMINHAR PARA O PRÓXIMO REGISTRO
      procedure PROXIMO; override;
      // PROCEDIMENTO PARA CAMINHAR PARA O ÚLTIMO REGISTRO
      procedure ULTIMO; override;
      // PROCEDIMENTO PARA CAMINHAR PARA O PRÓXIMO REGISTRO, DEPOIS DE UMA EXCLUSÃO
      procedure PROXIMOREG_APOSEXCLUSAO; override;
      // PROCEDIMENTO DE IMPRESSAO DO RELATÓRIO
      procedure IMPRIMIR; override;

  end;

var
  FCADABA: TFCADABA;

implementation

uses UMODULO, uLib, UMODULOP, URelatorio, UPESQUISAABA;

VAR
    X_COD : INTEGER;

{$R *.dfm}


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA GUARDAR O CÓDIGO ATUAL, PARA POSTERIOR LOCALIZAÇÃO
procedure TFCADABA.GUARDA_REGISTRO;
begin
  inherited;

  if MODULO.CDSABA.RecordCount > 0 then
     X_COD :=  MODULO.CDSABA.Fields[0].AsInteger
   else
     X_COD := 0;

end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA LOCALIZAÇÃO DO REGISTRO DESEJADO NO RETORNO DO OK
procedure TFCADABA.LOCALIZA_REGISTRO;
begin
  inherited;

  FilterSearch(MODULO.CDSABA, fsFilter, fsINT, inttostr(X_COD));

end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CONSULTA RÁPIDA DE REGISTRO POR CÓDIGO OU DESCRIÇÃO
procedure TFCADABA.SEARCH;
VAR
 V_ID : INTEGER;
begin
  inherited;
   if EDPROC.Text <> '' then
      BEGIN
        IF RGPROC.ItemIndex = 0 THEN // CONSULTA POR ID
           BEGIN
             V_ID := MODULO.cdsABAABA_ID.VALUE;
             FilterSearch(MODULO.CDSABA, fsfilter, fsINT, EDPROC.Text);
             IF MODULO.CDSABA.RECORDCOUNT = 0 THEN
                FilterSearch(MODULO.CDSABA, fsfilter, fsINT, INTTOSTR(V_ID));
           END;
      END;




end;



//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA FOCAR DETERMINADO CAMPO , QDO NECESSÁRIO
procedure TFCADABA.FOCAR;
begin
  inherited;
     DBEDATA.SETFOCUS;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA EFETUAR ALTERAÇÕES NO BANCO
procedure TFCADABA.APPLY_UPDATES;
begin
  inherited;
   if MODULO.CDSABA.ChangeCount > 0 then
     begin
       MODULO.CDSABA.ApplyUpdates(0);
     end;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CANCELAR ATUALIZAÇÕES PENDENTES
procedure TFCADABA.CANCEL_UPDATES;
begin
  inherited;
  MODULO.CDSABA.CancelUpdates;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CHAMAR FORMULARIO DE PESQUISA
procedure TFCADABA.PESQUISA;
begin
  inherited;

    try
    GUARDA_REGISTRO;
    Application.CreateForm(TFPesquisaABA, FPesquisaABA);
    FPesquisaABA.ShowModal;
    if FPesquisaABA.ModalResult = mrOk then
      begin
        IF MODULOP.cdsPesquisaABAS.RecordCount > 0 then
          begin
           FilterSearch(MODULO.CDSABA, fsFilter, fsINT, MODULOP.cdsPesquisaABASABA_ID.AsString);
          end;
      end
     ELSE
      begin
        FilterSearch(MODULO.CDSABA, fsFilter, fsINT, INTTOSTR(X_COD));
      end;
    MODULOP.cdsPesquisaABAS.CLOSE;
  finally
    FPesquisaABA.Free;
  end;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O PRIMEIRO REGISTRO
procedure TFCADABA.PRIMEIRO;
VAR
  V_PROCURA  : integer;
  V_ULTIMONUM : integer;
begin
  inherited;

    MODULOP.cdsPesquisaABAULT.Open;
    V_ULTIMONUM := moduloP.cdsPesquisaABAULTABA_ID.AsInteger;
    V_PROCURA := 0;
    Repeat
      V_PROCURA := (V_PROCURA + 1);
      FilterSearch(MODULO.cdsABA, fsFilter, fsINT, inttostr(V_PROCURA));
    Until (MODULO.cdsABA.RecordCount > 0) or (V_PROCURA >= (V_ULTIMONUM));


END;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O REGISTRO ANTERIOR
procedure TFCADABA.ANTERIOR;
VAR
  V_PROCURA, V_ANTES  : integer;
begin
  inherited;

  IF modulo.CDSABA.Fields[0].ASINTEGER > 1 THEN
     BEGIN
       V_ANTES := modulo.CDSABA.Fields[0].ASINTEGER;
       V_PROCURA := modulo.CDSABA.Fields[0].ASINTEGER;
       Repeat
          V_PROCURA := (V_PROCURA - 1);
          FilterSearch(modulo.CDSABA, fsFilter, fsINT, inttostr(V_PROCURA));
       Until (modulo.CDSABA.RecordCount > 0) or (V_PROCURA = 0);
       // se o 1º nao for nº 1, retornar ao primeiro
       if modulo.CDSABA.RecordCount = 0 then
          FilterSearch(modulo.CDSABA, fsFilter, fsINT, inttostr(V_ANTES));
     END;

end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O PRÓXIMO REGISTRO
procedure TFCADABA.PROXIMO;
var
 V_PROCURA  : integer;
begin
  inherited;

  MODULOP.cdsPesquisaABAULT.Open;

  IF modulo.CDSABA.Fields[0].ASINTEGER < moduloP.cdsPesquisaABAULTABA_ID.AsInteger THEN
     BEGIN
       V_PROCURA := modulo.CDSABA.Fields[0].ASINTEGER;
       Repeat
          V_PROCURA := (V_PROCURA + 1);
          FilterSearch(modulo.CDSABA, fsFilter, fsINT, inttostr(V_PROCURA));
       Until (modulo.CDSABA.RecordCount > 0) or (V_PROCURA >= moduloP.cdsPesquisaABAULTABA_ID.AsInteger)
     END;
  MODULOP.cdsPesquisaABAULT.close;

end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O ÚLTIMO REGISTRO
procedure TFCADABA.ULTIMO;
begin
  inherited;

   MODULOP.cdsPesquisaABAULT.Open;
   FilterSearch(MODULO.cdsABA, fsFilter, fsINT, moduloP.cdsPesquisaABAULT.Fields[0].ASSTRING);
   MODULOP.cdsPesquisaABAULT.Close;

end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O PRÓXIMO REGISTRO, DEPOIS DE UMA EXCLUSÃO
procedure TFCADABA.PROXIMOREG_APOSEXCLUSAO;
VAR
  V_PROCURA  : integer;
begin
  inherited;

   MODULOP.cdsPesquisaABAULT.Open;

   IF X_COD < moduloP.cdsPesquisaABAULTABA_ID.AsInteger THEN
     BEGIN
       V_PROCURA := X_COD;
       Repeat
          V_PROCURA := (V_PROCURA + 1);
          FilterSearch(MODULO.cdsABA, fsFilter, fsINT, inttostr(V_PROCURA));
       Until (MODULO.cdsABA.RecordCount > 0) or (V_PROCURA >= moduloP.cdsPesquisaABAULTABA_ID.AsInteger);
     END
    else
     ULTIMO;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO DE IMPRESSAO DO RELATÓRIO
procedure TFCADABA.IMPRIMIR;
var
 v_todos :string;
begin
  inherited;

   AbreForm(TFRELATORIO, FRELATORIO);
end;



//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA INCLUSAO DE REGISTRO
procedure TFCADABA.ACTINCExecute(Sender: TObject);
begin
    try
      inherited;
      MODULO.CDSABAABA_DATA.Asdatetime := Date;
    finally
      DBEDATA.SETFOCUS;
    end;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA ALTERACAO DE REGISTRO
procedure TFCADABA.ACTALTExecute(Sender: TObject);
begin
  IF MODULO.CDSABA.RECORDCOUNT > 0 THEN
    begin
      try
         inherited;
      finally
         DBEDATA.SETFOCUS;
      end;
    end
   else
    showmessage('Não há registro para ser alterado!' + #13 +
                'Realize Consulta para localizar o registro desejado!');
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA EXCLUSAO DE REGISTRO
procedure TFCADABA.ACTEXCExecute(Sender: TObject);
begin
  IF MODULO.CDSABA.RECORDCOUNT > 0 THEN
    begin
      inherited;
    end
   else
    showmessage('Não há registro para ser excluído!' + #13 +
                'Realize Consulta para localizar o registro desejado!');
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CONFIRMAR INCLUSAO OU ALTERACAO
procedure TFCADABA.ACTOKExecute(Sender: TObject);
begin
  if (MODULO.CDSABA.FIELDBYNAME('ABA_DATA').ASSTRING = '') then
    begin
      showmessage('Digite a data do abastecimento!');
      DBEDATA.SETFOCUS;
    end
   else
     if (MODULO.CDSABA.FIELDBYNAME('ABA_BOMBA').ASSTRING = '') then
        begin
          showmessage('Digite o número da bomba!');
          DBEBOMBA.SETFOCUS;
        end
       else
        if (MODULO.CDSABA.FIELDBYNAME('ABA_LITROS').ASSTRING = '') then
            begin
              showmessage('Digite a quantidade de litros de combustível!');
              DBELITROS.SETFOCUS;
            end
           else
             if (MODULO.CDSABA.FIELDBYNAME('ABA_VALOR').ASSTRING = '') then
                begin
                  showmessage('Digite o valor pago pelo cliente!');
                  DBEVALOR.SETFOCUS;
                end
               else
                begin
                  MODULO.CDSABA.FIELDBYNAME('ABA_IMPOSTO').AsFloat :=  MODULO.CDSABA.FIELDBYNAME('ABA_VALOR').AsFloat * 13 / 100;
                 inherited;
                end;
end;



procedure TFCADABA.DBEBOMBAExit(Sender: TObject);
begin
  inherited;

  if DBEBOMBA.Text <> '' then
     begin
      FilterSearch(MODULOP.cdsPesquisaBom, fsFilter, fsINT, DBEBOMBA.Text);
      if modulop.cdsPesquisaBom.RecordCount = 0 then
         begin
          showmessage('Bomba não existe,digite novamente!');
          MODULO.CDSABA.FIELDBYNAME('ABA_BOMBA').ASSTRING := '';
          DBEBOMBA.SetFocus;
         end;
     end;
end;


procedure TFCADABA.DBEVALORExit(Sender: TObject);
begin
  inherited;
  botok.SetFocus;
end;

procedure TFCADABA.DBEDATAKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if key =#13 then
    begin
     selectnext(sender as tWinControl,true,true);
     key:=#0;
    end;
end;

end.
