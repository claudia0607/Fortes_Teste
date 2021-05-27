unit UModulo;

interface

uses
  //SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr;
  SysUtils, Classes, DBXpress, DB, FMTBcd, DBClient, Provider, SqlExpr, RecError,
  Dialogs, Forms;

type
   TMODOTRANS = (mtInicia, mtGrava, mtCancela);
  TTipoPKey = (fsINTEIRO, fsSTRING);
  TMODULO = class(TDataModule)
    SQLCon: TSQLConnection;
    TABABA: TSQLDataSet;
    DSPABA: TDataSetProvider;
    CDSABA: TClientDataSet;
    TABABAABA_ID: TIntegerField;
    TABABAABA_DATA: TSQLTimeStampField;
    TABABAABA_BOMBA: TIntegerField;
    TABABAABA_LITROS: TFloatField;
    TABABAABA_VALOR: TFloatField;
    TABABAABA_IMPOSTO: TFloatField;
    CDSABAABA_ID: TIntegerField;
    CDSABAABA_DATA: TSQLTimeStampField;
    CDSABAABA_BOMBA: TIntegerField;
    CDSABAABA_LITROS: TFloatField;
    CDSABAABA_VALOR: TFloatField;
    CDSABAABA_IMPOSTO: TFloatField;
    TABBOM: TSQLDataSet;
    DSPBOM: TDataSetProvider;
    CDSBOM: TClientDataSet;
    TABBOMBOM_ID: TIntegerField;
    TABBOMBOM_TANQUE: TIntegerField;
    CDSBOMBOM_ID: TIntegerField;
    CDSBOMBOM_TANQUE: TIntegerField;
    TABTAN: TSQLDataSet;
    DSPTAN: TDataSetProvider;
    CDSTAN: TClientDataSet;
    TABTANTAN_ID: TIntegerField;
    TABTANTAN_COMBUSTIVEL: TStringField;
    CDSTANTAN_ID: TIntegerField;
    CDSTANTAN_COMBUSTIVEL: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure Transac(ModoTrans: TModoTrans);
    

  private
    { Private declarations }
     TransDesc: TTransactionDesc;
  public
    { Public declarations }
  end;

var
  MODULO: TMODULO;

implementation

uses uLib;

{$R *.dfm}

procedure TMODULO.DataModuleCreate(Sender: TObject);
var
   Path, Nomearq: string;
begin
  Path := ExtractFilePath(Application.ExeName);
  Nomearq := 'dbxconnections.ini';

   with SQLCon do
     begin
        Close;
        Params.Clear;
        Params.LoadFromFile(Path + Nomearq);
        Open;
     end;

   TransDesc.TransactionID := 1;
   TransDesc.IsolationLevel := xilREADCOMMITTED;
end;


procedure TMODULO.Transac(ModoTrans: TModoTrans);
begin
   CASE ModoTrans of
       mtInicia:
         if not SQLCon.InTransaction then
            SQLCon.StartTransaction(TransDesc);
       mtGrava:
         try
           if SQLCon.InTransaction then
             SQLCon.Commit(TransDesc);
         Except
             SQLCon.Rollback(TransDesc);
         end;
       mtCancela:
         if SQLCon.InTransaction then
            SQLCon.Rollback(TransDesc);
   end;
end;

end.
