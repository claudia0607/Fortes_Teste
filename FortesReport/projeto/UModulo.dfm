object MODULO: TMODULO
  OldCreateOrder = False
  Left = 666
  Top = 197
  Height = 285
  Width = 380
  object SQLCon: TSQLConnection
    ConnectionName = 'CN_FORTES'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=localhost:c:\TesteFortes\dados\BDFORTES.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'fbclient.dll'
    Connected = True
    Left = 16
    Top = 24
  end
  object TABABA: TSQLDataSet
    CommandText = 'select *'#13#10'from ABASTECIMENTOS'#13#10'where ABA_ID=:ABA_ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ABA_ID'
        ParamType = ptInput
      end>
    SQLConnection = SQLCon
    Left = 88
    Top = 24
    object TABABAABA_ID: TIntegerField
      FieldName = 'ABA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TABABAABA_DATA: TSQLTimeStampField
      FieldName = 'ABA_DATA'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object TABABAABA_BOMBA: TIntegerField
      FieldName = 'ABA_BOMBA'
      Required = True
    end
    object TABABAABA_LITROS: TFloatField
      FieldName = 'ABA_LITROS'
      Required = True
      DisplayFormat = '##0.000'
    end
    object TABABAABA_VALOR: TFloatField
      FieldName = 'ABA_VALOR'
      Required = True
      DisplayFormat = '###,##0.00'
    end
    object TABABAABA_IMPOSTO: TFloatField
      FieldName = 'ABA_IMPOSTO'
      Required = True
      DisplayFormat = '###,##0.00'
    end
  end
  object DSPABA: TDataSetProvider
    DataSet = TABABA
    UpdateMode = upWhereChanged
    Left = 144
    Top = 24
  end
  object CDSABA: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ABA_ID'
        ParamType = ptInput
      end>
    ProviderName = 'DSPABA'
    Left = 200
    Top = 24
    object CDSABAABA_ID: TIntegerField
      FieldName = 'ABA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSABAABA_DATA: TSQLTimeStampField
      FieldName = 'ABA_DATA'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object CDSABAABA_BOMBA: TIntegerField
      FieldName = 'ABA_BOMBA'
      Required = True
    end
    object CDSABAABA_LITROS: TFloatField
      FieldName = 'ABA_LITROS'
      Required = True
      DisplayFormat = '##0.000'
    end
    object CDSABAABA_VALOR: TFloatField
      FieldName = 'ABA_VALOR'
      Required = True
      DisplayFormat = '###,##0.00'
    end
    object CDSABAABA_IMPOSTO: TFloatField
      FieldName = 'ABA_IMPOSTO'
      Required = True
      DisplayFormat = '###,##0.00'
    end
  end
  object TABBOM: TSQLDataSet
    CommandText = 'select * from BOMBAS'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 83
    Top = 88
    object TABBOMBOM_ID: TIntegerField
      FieldName = 'BOM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TABBOMBOM_TANQUE: TIntegerField
      FieldName = 'BOM_TANQUE'
      Required = True
    end
  end
  object DSPBOM: TDataSetProvider
    DataSet = TABBOM
    UpdateMode = upWhereChanged
    Left = 145
    Top = 86
  end
  object CDSBOM: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCONF'
    Left = 201
    Top = 86
    object CDSBOMBOM_ID: TIntegerField
      FieldName = 'BOM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSBOMBOM_TANQUE: TIntegerField
      FieldName = 'BOM_TANQUE'
      Required = True
    end
  end
  object TABTAN: TSQLDataSet
    CommandText = 'select * from TANQUES'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLCon
    Left = 83
    Top = 160
    object TABTANTAN_ID: TIntegerField
      FieldName = 'TAN_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TABTANTAN_COMBUSTIVEL: TStringField
      FieldName = 'TAN_COMBUSTIVEL'
      Required = True
      Size = 8
    end
  end
  object DSPTAN: TDataSetProvider
    DataSet = TABTAN
    UpdateMode = upWhereChanged
    Left = 145
    Top = 158
  end
  object CDSTAN: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPTAN'
    Left = 201
    Top = 158
    object CDSTANTAN_ID: TIntegerField
      FieldName = 'TAN_ID'
      Required = True
    end
    object CDSTANTAN_COMBUSTIVEL: TStringField
      FieldName = 'TAN_COMBUSTIVEL'
      Required = True
      Size = 8
    end
  end
end
