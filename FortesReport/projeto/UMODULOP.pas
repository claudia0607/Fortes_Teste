unit UMODULOP;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, SqlExpr, DB, DBClient;

type                                            
  TMODULOP = class(TDataModule)
    cdsPesquisaABA: TClientDataSet;
    SQLPESQUISA: TSQLDataSet;
    DSPPESQUISA: TDataSetProvider;
    cdsPesquisaABAULT: TClientDataSet;
    cdsPesquisaABAABA_ID: TIntegerField;
    cdsPesquisaABAABA_DATA: TSQLTimeStampField;
    cdsPesquisaABAABA_BOMBA: TIntegerField;
    cdsPesquisaABAABA_LITROS: TFloatField;
    cdsPesquisaABAABA_VALOR: TFloatField;
    cdsPesquisaABAABA_IMPOSTO: TFloatField;
    cdsPesquisaABAULTABA_ID: TIntegerField;
    cdsPesquisaABAULTABA_DATA: TSQLTimeStampField;
    cdsPesquisaABAULTABA_BOMBA: TIntegerField;
    cdsPesquisaABAULTABA_LITROS: TFloatField;
    cdsPesquisaABAULTABA_VALOR: TFloatField;
    cdsPesquisaABAULTABA_IMPOSTO: TFloatField;
    cdsPesquisaBom: TClientDataSet;
    cdsPesquisaBomBOM_ID: TIntegerField;
    cdsPesquisaBomBOM_TANQUE: TIntegerField;
    cdsRelatorio: TClientDataSet;
    cdsRelatorioABA_ID: TIntegerField;
    cdsRelatorioABA_DATA: TSQLTimeStampField;
    cdsRelatorioABA_BOMBA: TIntegerField;
    cdsRelatorioABA_LITROS: TFloatField;
    cdsRelatorioABA_VALOR: TFloatField;
    cdsRelatorioABA_IMPOSTO: TFloatField;
    cdsRelatorioTANQUE: TIntegerField;
    cdsPesquisaABAS: TClientDataSet;
    cdsPesquisaABASABA_ID: TIntegerField;
    cdsPesquisaABASABA_DATA: TSQLTimeStampField;
    cdsPesquisaABASABA_BOMBA: TIntegerField;
    cdsPesquisaABASABA_LITROS: TFloatField;
    cdsPesquisaABASABA_VALOR: TFloatField;
    cdsPesquisaABASABA_IMPOSTO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MODULOP: TMODULOP;

implementation

uses UMODULO;

{$R *.dfm}

end.

