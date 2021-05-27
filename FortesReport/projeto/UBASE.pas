unit UBASE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, StdCtrls, Buttons, DB, ExtCtrls, DBCtrls,
  Grids, DBGrids, ComCtrls, DBTables, QRCtrls, QuickRpt;

type
  TFBASE = class(TForm)
    ActionList1: TActionList;
    ACTINC: TAction;
    ACTEXC: TAction;
    ACTALT: TAction;
    ACTOK: TAction;
    ACTCANC: TAction;
    DataSource1: TDataSource;
    PABOT: TPanel;
    PAOK: TPanel;
    PADADOS: TPanel;
    PAPROC: TPanel;
    ACTFECHAR: TAction;
    EDPROC: TEdit;
    PATITULO: TPanel;
    ImageList1: TImageList;
    BOTALT: TBitBtn;
    BOTEXC: TBitBtn;
    BOTFECHAR: TBitBtn;
    BOTOK: TBitBtn;
    BOTCANC: TBitBtn;
    BOTINC: TBitBtn;
    Label36: TLabel;
    PAGE: TPageControl;
    PAGINA1: TTabSheet;
    RGPROC: TRadioGroup;
    ACTPRINT: TAction;
    BOTPRINT: TBitBtn;
    BOTPESQUISAR: TBitBtn;
    ACTPESQUISAR: TAction;
    SpeedButton6: TSpeedButton;
    ImageList2: TImageList;
    ActionList2: TActionList;
    ACTPRIMEIRO: TAction;
    ACTANTERIOR: TAction;
    ACTPROXIMO: TAction;
    ACTULTIMO: TAction;
    BOTPRIMEIRO: TSpeedButton;
    BOTANTERIOR: TSpeedButton;
    BOTPROXIMO: TSpeedButton;
    BOTULTIMO: TSpeedButton;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLEMP: TQRLabel;
    QRLTITULO: TQRLabel;
    QRSysData6: TQRSysData;
    QRSysData5: TQRSysData;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRDBTCOD: TQRDBText;
    ACTATUALIZAR: TAction;
    BOTATUAL: TBitBtn;
    procedure ACTINCExecute(Sender: TObject);
    procedure ACTALTExecute(Sender: TObject);
    procedure ACTEXCExecute(Sender: TObject);
    procedure ACTOKExecute(Sender: TObject);
    procedure ACTCANCExecute(Sender: TObject);
    procedure EDPROCChange(Sender: TObject);
    procedure HABILITA;
    procedure DESABILITA;
    procedure ACTPRINTExecute(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ACTFECHARExecute(Sender: TObject);
    procedure ACTPESQUISARExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ACTPRIMEIROExecute(Sender: TObject);
    procedure ACTANTERIORExecute(Sender: TObject);
    procedure ACTPROXIMOExecute(Sender: TObject);
    procedure ACTULTIMOExecute(Sender: TObject);
    procedure ACTATUALIZARExecute(Sender: TObject);
    procedure ATUALIZAR;
  private
    { Private declarations }
  public
    { Public declarations }

      // PROCEDIMENTO PARA GUARDAR O C�DIGO ATUAL, PARA POSTERIOR LOCALIZA��O
      procedure GUARDA_REGISTRO; virtual;
      // PROCEDIMENTO PARA LOCALIZA��O DO REGISTRO DESEJADO NO RETORNO DO OK
      procedure LOCALIZA_REGISTRO; virtual;
      // PROCEDIMENTO PARA CONSULTA R�PIDA DE REGISTRO POR C�DIGO OU DESCRI��O
      procedure SEARCH; virtual;
      // PROCEDIMENTO PARA FOCAR DETERMINADO CAMPO , QDO NECESS�RIO
      procedure FOCAR; virtual;
      // PROCEDIMENTO PARA EFETUAR ALTERA��ES NO BANCO
      procedure APPLY_UPDATES; virtual;
      // PROCEDIMENTO PARA CANCELAR ATUALIZA��ES PENDENTES
      procedure CANCEL_UPDATES; virtual;
      // PROCEDIMENTO PARA CHAMAR FORMULARIO DE PESQUISA
      procedure PESQUISA; virtual;
      // PROCEDIMENTO PARA CAMINHAR PARA O PRIMEIRO REGISTRO
      procedure PRIMEIRO;virtual;
      // PROCEDIMENTO PARA CAMINHAR PARA O REGISTRO ANTERIOR
      procedure ANTERIOR; virtual;
      // PROCEDIMENTO PARA CAMINHAR PARA O PR�XIMO REGISTRO
      procedure PROXIMO; virtual;
      // PROCEDIMENTO PARA CAMINHAR PARA O �LTIMO REGISTRO
      procedure ULTIMO; virtual;
      // PROCEDIMENTO PARA CAMINHAR PARA O PR�XIMO REGISTRO, DEPOIS DE UMA EXCLUS�O
      procedure PROXIMOREG_APOSEXCLUSAO; virtual;
      // PROCEDIMENTO DE IMPRESSAO DO RELAT�RIO
      procedure IMPRIMIR; virtual;
      // Na EXCLUS�O, FILTRA TABELAS P/ VERIFICAR SE EXISTEM DADOS CADASTRADOS SOBRE O REGISTRO EM QUEST�O


  end;

var
  FBASE: TFBASE;
  X_CHAVEEXC, X_ATIVAPAGINA, X_EDITMODE : STRING;

implementation

uses UMODULO, uLib, UPRINC;

VAR
   X_OPER : STRING;

{$R *.dfm}

//-----------------------------------------------------------------------------
 //PROCEDIMENTO PARA REALIZAR HABILITA��ES GERAIS NA ALTERACAO E INCLUSAO
procedure TFBASE.HABILITA;
begin
 BOTINC.Enabled := false;
 BOTALT.Enabled := false;
 BOTEXC.Enabled := false;

 BOTFECHAR.Enabled := false;
 BOTPRINT.Enabled := false;
 BOTPESQUISAR.Enabled := FALSE;
 BOTPRIMEIRO.Enabled := FALSE;
 BOTANTERIOR.Enabled := FALSE;
 BOTPROXIMO.Enabled := FALSE;
 BOTULTIMO.Enabled := FALSE;
 BOTATUAL.Enabled := false;
 paproc.Enabled := false;

 botok.Enabled := true;
 botcanc.Enabled := true;

 PAGINA1.Enabled := true;

end;

//-----------------------------------------------------------------------------
//PROCEDIMENTO P/REALIZAR DESABILITA��ES GERAIS NA ALTERACAO E INCLUSAO
procedure TFBASE.DESABILITA;
begin


 BOTINC.Enabled := true;
 BOTALT.Enabled := true;
 BOTEXC.Enabled := true;
 BOTFECHAR.Enabled := true;
 BOTPRINT.Enabled := TRUE;
 BOTPESQUISAR.Enabled := TRUE;
 BOTPRIMEIRO.Enabled := TRUE;
 BOTANTERIOR.Enabled := TRUE;
 BOTPROXIMO.Enabled := TRUE;
 BOTULTIMO.Enabled := TRUE;
 BOTATUAL.Enabled := TRUE;
 paproc.Enabled := true;

 botok.Enabled := false;
 botcanc.Enabled := false;

 PAGINA1.Enabled := false;


end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA INCLUSAO DE REGISTRO
procedure TFBASE.ACTINCExecute(Sender: TObject);
begin
 X_OPER := 'I';
 HABILITA;

 Datasource1.DataSet.REFRESH;

 //Inicia a Transa��o
 Modulo.Transac(mtInicia);
 Datasource1.DataSet.Append;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA ALTERACAO DE REGISTRO
procedure TFBASE.ACTALTExecute(Sender: TObject);
begin
 X_OPER := 'A';

 ATUALIZAR;
 IF Datasource1.DataSet.RecordCount > 0 THEN
    BEGIN
      Datasource1.DataSet.REFRESH;
      HABILITA;


      //Inicia a Transa��o
      Modulo.Transac(mtInicia);
      Datasource1.DataSet.Edit;
    END
   ELSE
    BEGIN
       showmessage('O Registro que voc� deseja alterar foi exclu�do por outro usu�rio!');
       ULTIMO;
    END;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA EXCLUSAO DE REGISTRO
procedure TFBASE.ACTEXCExecute(Sender: TObject);
begin

 if MessageDlg('Deseja realmente apagar este registro?',
  mtInformation, [mbYes, mbNo], 0) = mrYes then
   begin

    TRY
      //Inicia a Transa��o
      Modulo.Transac(mtInicia);

      GUARDA_REGISTRO;

      Datasource1.DataSet.delete;
      APPLY_UPDATES;

      Modulo.Transac(mtGrava);
      Datasource1.DataSet.Refresh;

      PROXIMOREG_APOSEXCLUSAO; // PROCURA O PR�XIMO REGISTRO  E ATUALIZA O NUMERO DO ULTIMOREGISTRO
    EXCEPT
      ON EDATABASEERROR DO
         begin
            //Se algo saiu errado, cancela a transa��o
            CANCEL_UPDATES;
            Modulo.Transac(mtCancela);
            MessageDlg('ERRO!', mtError, [mbOK], 0);
            Datasource1.DataSet.CLOSE;
            Datasource1.DataSet.OPEN;
            PROXIMOREG_APOSEXCLUSAO; // PROCURA O PR�XIMO REGISTRO  E ATUALIZA O NUMERO DO ULTIMOREGISTRO
         end;
    end;
    //*************************
 END;

end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CONFIRMAR INCLUSAO OU ALTERACAO
procedure TFBASE.ACTOKExecute(Sender: TObject);
VAR
  V_PASSEI: STRING;
begin
 try
  V_PASSEI := 'N';

  Datasource1.DataSet.Post;
  APPLY_UPDATES;

  DESABILITA;


  V_PASSEI := 'S';

  Modulo.Transac(mtGrava);
  Datasource1.DataSet.Refresh;
  GUARDA_REGISTRO;

  if X_OPER = 'I' THEN
      ULTIMO;

  IF (Botinc.Enabled = true) THEN
     Botinc.setfocus;
 EXCEPT
   ON EDATABASEERROR DO
    BEGIN
     // Se algo saiu errado, cancela a transa��o
     CANCEL_UPDATES;
     Modulo.Transac(mtCancela);
     MessageDlg('ERRO: ' + #13 + '           Suas altera��es foram canceladas!', mtError, [mbOK], 0);
     Datasource1.DataSet.CLOSE;
     Datasource1.DataSet.OPEN;
     LOCALIZA_REGISTRO; // RETORNAR NO REGISTRO ORIGINAL -
    END;
 end;
  if X_OPER = 'I' THEN
      ULTIMO;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CANCELAR INCLUSAO OU ALTERACAO
procedure TFBASE.ACTCANCExecute(Sender: TObject);
begin
  Datasource1.DataSet.cancel;
  CANCEL_UPDATES;
  Modulo.Transac(mtCancela);

  Datasource1.DataSet.Refresh;

  DESABILITA;


  botinc.setfocus;
end;





//-----------------------------------------------------------------------------
// PROCEDIMENTO EXECUTADO AO ABRIR O FORMUL�RIO
procedure TFBASE.FormActivate(Sender: TObject);
begin

      Datasource1.DataSet.active := true;
      Datasource1.DataSet.REFRESH;

      X_ATIVAPAGINA := 'S'; //FLAG P/ ATIVAR A PAGINA1 QDO FOR EXCLUIR
      X_EDITMODE := 'S'; //FLAG P/ COLOCAR EM EDIT MODE QDO EXECUTAR O EXCEPT NO BOTAO DE OK

      ULTIMO;

      EDPROC.TEXT := '';
      EDPROC.setfocus;

end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO EXECUTADO AO FECHAR O FORMUL�RIO
procedure TFBASE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Datasource1.DataSet.State = dsEdit) or (Datasource1.DataSet.State = dsInsert) then
    begin
      Datasource1.DataSet.Cancel;
      CANCEL_UPDATES;
      Modulo.Transac(mtCancela);
    end;

  Datasource1.DataSet.active := false;
  Action:=caFree;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO P/ FECHAR O FORMUL�RIO UTILIZANDO A TECLA [ESC]
procedure TFBASE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
    CLOSE;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO P/ FECHAR O FORMUL�RIO ATRAV�S DO BOT�O FECHAR
procedure TFBASE.ACTFECHARExecute(Sender: TObject);
begin
 CLOSE;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO P/ ATUALIZAR O REGISTRO
procedure TFBASE.ACTATUALIZARExecute(Sender: TObject);
begin
  ATUALIZAR;
end;

procedure TFBASE.ATUALIZAR;
BEGIN
  GUARDA_REGISTRO;
  Datasource1.DataSet.Close;
  Datasource1.DataSet.Open;
  LOCALIZA_REGISTRO; // RETORNAR NO REGISTRO ORIGINAL -
END;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA FAZER CONSULTA R�PIDA (POR C�DIGO OU DESCRI��O)
procedure TFBASE.EDPROCChange(Sender: TObject);
begin
  SEARCH;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CHAMAR FORMULARIO DE PESQUISA
procedure TFBASE.ACTPESQUISARExecute(Sender: TObject);
begin
  PESQUISA;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA IMPRIMIR RELAT�RIO
procedure TFBASE.ACTPRINTExecute(Sender: TObject);
begin
  botprint.Enabled := false;
  IMPRIMIR;
  botprint.Enabled := true;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O PRIMEIRO REGISTRO
procedure TFBASE.ACTPRIMEIROExecute(Sender: TObject);
begin
  PRIMEIRO;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O REGISTRO ANTERIOR
procedure TFBASE.ACTANTERIORExecute(Sender: TObject);
BEGIN
  ANTERIOR;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O PR�XIMO REGISTRO
procedure TFBASE.ACTPROXIMOExecute(Sender: TObject);
BEGIN
  PROXIMO;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA CAMINHAR PARA O �LTIMO REGISTRO
procedure TFBASE.ACTULTIMOExecute(Sender: TObject);
BEGIN
  ULTIMO;
end;


procedure TFBASE.GUARDA_REGISTRO;
begin
//
end;

procedure TFBASE.LOCALIZA_REGISTRO;
begin
//
end;

procedure TFBASE.SEARCH;
begin
//
end;

procedure TFBASE.FOCAR;
begin
//
end;

procedure TFBASE.APPLY_UPDATES;
begin
//
end;

procedure TFBASE.CANCEL_UPDATES;
begin
//
end;



procedure TFBASE.PESQUISA;
begin
//
end;

procedure TFBASE.PRIMEIRO;
begin
 //
end;

procedure TFBASE.ANTERIOR;
begin
 //
end;

procedure TFBASE.PROXIMO;
begin
 //
end;

procedure TFBASE.ULTIMO;
begin
 //
end;

procedure TFBASE.PROXIMOREG_APOSEXCLUSAO;
begin
//
end;

procedure TFBASE.IMPRIMIR;
begin
//
end;





end.
