unit UPrinc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, jpeg, ExtCtrls, Menus, ActnList, Buttons, ToolWin,
  ImgList, StdCtrls;

type
  TFPRINC = class(TForm)
    StatusBar1: TStatusBar;
    Timerprinc: TTimer;
    ToolBar1: TToolBar;
    BOTCADABA: TSpeedButton;
    BOTSAIDA: TSpeedButton;
    MainMenu1: TMainMenu;
    Finalizar: TMenuItem;
    FINSAIDA: TMenuItem;
    cA1: TMenuItem;
    Abastecimento1: TMenuItem;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    Relatrio1: TMenuItem;
    Image2: TImage;
    Image1: TImage;
    procedure TimerprincTimer(Sender: TObject);
    procedure Abastecimento1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Relatrio1Click(Sender: TObject);
    procedure FINSAIDAClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPRINC: TFPRINC;

implementation

uses UCADABA,ULib, UModulo, URelatorio;

{$R *.dfm}

procedure TFPRINC.TimerprincTimer(Sender: TObject);
begin
 //Colocando a Hora
 statusbar1.panels.items[1].text := TimeToStr(now);
end;

procedure TFPRINC.Abastecimento1Click(Sender: TObject);
begin
 AbreForm(TFCADABA, FCADABA);
end;

procedure TFPRINC.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  MODULO.CDSABA.CLOSE;
  Action:=caFree;
end;

procedure TFPRINC.Relatrio1Click(Sender: TObject);
begin
   AbreForm(TFRELATORIO, FRELATORIO);
end;

procedure TFPRINC.FINSAIDAClick(Sender: TObject);
begin
  Application.terminate;
end;

procedure TFPRINC.FormActivate(Sender: TObject);
begin
  statusbar1.panels.items[0].text := DateToStr(date);
end;

end.
