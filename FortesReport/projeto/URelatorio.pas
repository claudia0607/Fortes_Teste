unit URelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, ComCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TFRelatorio = class(TForm)
    RLRAbastecimentos: TRLReport;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    DTP_DATINI: TDateTimePicker;
    DTP_DATFIN: TDateTimePicker;
    DSRelat: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLGroup1: TRLGroup;
    BOTPRINT: TBitBtn;
    BOTFECHAR: TBitBtn;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel7: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand2: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBText5: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLData: TRLLabel;
    RLDraw1: TRLDraw;
    procedure BOTPRINTClick(Sender: TObject);
    procedure BOTFECHARClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RLRAbastecimentosBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorio: TFRelatorio;

implementation

uses
 UMODULOP, ULib;

{$R *.dfm}

procedure TFRelatorio.BOTPRINTClick(Sender: TObject);
begin

  IF DTP_DATINI.Date <= DTP_DATFIN.Date THEN
     BEGIN
       FilterSearch2(MODULOP.CDSRELATORIO, fsfilter, fsDAT, fsDAT, DATETOSTR(DTP_DATINI.Date), DATETOSTR(DTP_DATFIN.Date) );
       RLRAbastecimentos.Preview();
     END
    ELSE
     BEGIN
      SHOWMESSAGE('Data Inicial deve ser menor ou igual à data final');
      DTP_DATINI.SETFOCUS;
     END;

end;

procedure TFRelatorio.BOTFECHARClick(Sender: TObject);
begin
  CLOSE;
end;

procedure TFRelatorio.FormActivate(Sender: TObject);
begin
  DTP_DATINI.Date := date;
  DTP_DATFIN.Date := date;
end;

procedure TFRelatorio.RLRAbastecimentosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
   RLLData.Caption := 'Período: '+DateToStr(DTP_DATINI.DATE) + ' até ' +  DateToStr(DTP_DATFIN.DATE);
end;

end.
