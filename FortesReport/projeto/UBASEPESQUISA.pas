unit UBASEPESQUISA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ActnList, ImgList,
  ExtCtrls;

type
  TFBASEPESQUISA = class(TForm)
    EDPROC: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ACTACIMA: TAction;
    RGPROC: TRadioGroup;
    BOTACIMA: TSpeedButton;
    ACTABAIXO: TAction;
    BOTABAIXO: TSpeedButton;
    GBDADOS: TGroupBox;
    BOTORDENAR: TBitBtn;
    ACTORDENAR: TAction;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EDPROCChange(Sender: TObject);
    procedure ACTACIMAExecute(Sender: TObject);
    procedure ACTABAIXOExecute(Sender: TObject);
    procedure EDPROCKeyPress(Sender: TObject; var Key: Char);
    procedure ACTORDENARExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RGPROCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    // PROCEDIMENTO PARA REALIZAR A CONSULTA (POR DESCRIÇÃO)
    procedure Search; virtual;
    // PROCEDIMENTO PARA AUMENTAR O TAMANHO DO FORMULARIO P/ VISUALIZAR A PARTE DE  DETALHES DO REGISTRO
    procedure AUMENTA_FORM; virtual;
    // PROCEDIMENTO PARA ORDENAR OS REGISTROS POR CÓDIGO OU POR NOME
    procedure ORDENAR; virtual;
    // PROCEDIMENTO P/ BUSCAR DETALHES DO REGISTRO, SE A PARTE DE DETALHES ESTIVER À MOSTRA
    procedure VER_REGISTRO; virtual;
  end;

var
  FBASEPESQUISA: TFBASEPESQUISA;

implementation

{$R *.dfm}

{ TfrmSearch }


//-----------------------------------------------------------------------------
// PROCEDIMENTO EXECUTADO AO ABRIR O FORMULÁRIO
procedure TFBASEPESQUISA.FormActivate(Sender: TObject);
begin
   ORDENAR;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO P/ FECHAR O FORMULÁRIO UTILIZANDO A TECLA [ESC]
procedure TFBASEPESQUISA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
    CLOSE;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO EXECUTADO AO ESCOLHER UM REGISTRO, COM DUPLO CLIQUE NA GRID
procedure TFBASEPESQUISA.DBGrid1DblClick(Sender: TObject);
begin
  Close;
  ModalResult := mrOk;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO EXECUTADO AO ESCOLHER UM REGISTRO, TECLANDO [ENTER] NA GRID
procedure TFBASEPESQUISA.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then
    begin
     Close;
     ModalResult := mrOk;
    end;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA TROCAR O CONTROLE DE SAÍDA DOS CAMPOS DE [TAB] PARA [ENTER]
procedure TFBASEPESQUISA.EDPROCKeyPress(Sender: TObject; var Key: Char);
begin
 if key =#13 then
    begin
     selectnext(sender as tWinControl,true,true);
     key:=#0;
    end;
end;


//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA DIMINUIR O TAMANHO DO FORMULARIO, P/ ESCONDER A PARTE DE DETALHES DO REGISTRO
procedure TFBASEPESQUISA.ACTACIMAExecute(Sender: TObject);
begin
 HEIGHT := 310;
 WIDTH := 560;

end;




//-----------------------------------------------------------------------------
// PROCEDIMENTO PARA REALIZAR A CONSULTA (POR DESCRIÇÃO)
procedure TFBASEPESQUISA.EDPROCChange(Sender: TObject);
begin
 Search;
end;

//-----------------------------------------------------------------------------
 // PROCEDIMENTO PARA AUMENTAR O TAMANHO DO FORMULARIO P/ VISUALIZAR A PARTE DE  DETALHES DO REGISTRO
procedure TFBASEPESQUISA.ACTABAIXOExecute(Sender: TObject);
begin
 AUMENTA_FORM;
 VER_REGISTRO;
end;

//-----------------------------------------------------------------------------
 // PROCEDIMENTO PARA ORDENAR OS REGISTROS POR CÓDIGO OU POR NOME
procedure TFBASEPESQUISA.ACTORDENARExecute(Sender: TObject);
begin
   ORDENAR;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO P/ BUSCAR DETALHES DO REGISTRO, AO CAMINHAR SOBRE A GRID P/CIMA
procedure TFBASEPESQUISA.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  VER_REGISTRO;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO P/ BUSCAR DETALHES DO REGISTRO, AO CAMINHAR SOBRE A GRID P/BAIXO
procedure TFBASEPESQUISA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  VER_REGISTRO;
end;

//-----------------------------------------------------------------------------
// PROCEDIMENTO P/ BUSCAR DETALHES DO REGISTRO, AO CLICAR SOBRE A GRID
procedure TFBASEPESQUISA.DBGrid1CellClick(Column: TColumn);
begin
 VER_REGISTRO;
end;



procedure TFBASEPESQUISA.Search;
begin
//
end;

procedure TFBASEPESQUISA.AUMENTA_FORM;
begin
  //
end;

procedure TFBASEPESQUISA.ORDENAR;
begin
//
end;

procedure TFBASEPESQUISA.VER_REGISTRO;
begin
//
end;

procedure TFBASEPESQUISA.RGPROCClick(Sender: TObject);
begin
  BOTORDENAR.OnClick(self);
end;

end.
