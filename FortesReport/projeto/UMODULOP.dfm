object MODULOP: TMODULOP
  OldCreateOrder = False
  Left = 392
  Top = 284
  Height = 383
  Width = 466
  object cdsPesquisaABA: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select * from ABASTECIMENTOS where ABA_ID=:ABA_ID ORDER BY ABA_I' +
      'D'
    Params = <
      item
        DataType = ftInteger
        Name = 'ABA_ID'
        ParamType = ptInput
      end>
    ProviderName = 'DSPPESQUISA'
    Left = 31
    Top = 95
    object cdsPesquisaABAABA_ID: TIntegerField
      FieldName = 'ABA_ID'
      Required = True
    end
    object cdsPesquisaABAABA_DATA: TSQLTimeStampField
      FieldName = 'ABA_DATA'
      Required = True
    end
    object cdsPesquisaABAABA_BOMBA: TIntegerField
      FieldName = 'ABA_BOMBA'
      Required = True
    end
    object cdsPesquisaABAABA_LITROS: TFloatField
      FieldName = 'ABA_LITROS'
      Required = True
    end
    object cdsPesquisaABAABA_VALOR: TFloatField
      FieldName = 'ABA_VALOR'
      Required = True
    end
    object cdsPesquisaABAABA_IMPOSTO: TFloatField
      FieldName = 'ABA_IMPOSTO'
      Required = True
    end
  end
  object SQLPESQUISA: TSQLDataSet
    CommandText = 
      'select * from ABASTECIMENTOS where UPPER(ABA_ID) like :ID ORDER ' +
      'BY ABA_ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = MODULO.SQLCon
    Left = 32
    Top = 16
  end
  object DSPPESQUISA: TDataSetProvider
    DataSet = SQLPESQUISA
    Options = [poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 16
  end
  object cdsPesquisaABAULT: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select * from ABASTECIMENTOS where ABA_ID = (select max(ABA_ID) ' +
      'FROM ABASTECIMENTOS)'
    Params = <>
    ProviderName = 'DSPPESQUISA'
    Left = 136
    Top = 96
    object cdsPesquisaABAULTABA_ID: TIntegerField
      FieldName = 'ABA_ID'
      Required = True
    end
    object cdsPesquisaABAULTABA_DATA: TSQLTimeStampField
      FieldName = 'ABA_DATA'
      Required = True
    end
    object cdsPesquisaABAULTABA_BOMBA: TIntegerField
      FieldName = 'ABA_BOMBA'
      Required = True
    end
    object cdsPesquisaABAULTABA_LITROS: TFloatField
      FieldName = 'ABA_LITROS'
      Required = True
    end
    object cdsPesquisaABAULTABA_VALOR: TFloatField
      FieldName = 'ABA_VALOR'
      Required = True
    end
    object cdsPesquisaABAULTABA_IMPOSTO: TFloatField
      FieldName = 'ABA_IMPOSTO'
      Required = True
    end
  end
  object cdsPesquisaBom: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from BOMBAS where BOM_ID =:BOM_ID'
    Params = <
      item
        DataType = ftInteger
        Name = 'BOM_ID'
        ParamType = ptInput
      end>
    ProviderName = 'DSPPESQUISA'
    Left = 40
    Top = 168
    object cdsPesquisaBomBOM_ID: TIntegerField
      FieldName = 'BOM_ID'
      Required = True
    end
    object cdsPesquisaBomBOM_TANQUE: TIntegerField
      FieldName = 'BOM_TANQUE'
      Required = True
    end
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select A.*, (select BOMBAS.BOM_TANQUE from BOMBAS where BOMBAS.B' +
      'OM_ID = A.ABA_BOMBA) as TANQUE from ABASTECIMENTOS A where A.ABA' +
      '_DATA>=:DATAINI and A.ABA_DATA<=:DATAFIN ORDER BY A.ABA_DATA, A.' +
      'ABA_BOMBA'
    Params = <
      item
        DataType = ftDate
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFIN'
        ParamType = ptInput
      end>
    ProviderName = 'DSPPESQUISA'
    Left = 40
    Top = 224
    object cdsRelatorioABA_ID: TIntegerField
      FieldName = 'ABA_ID'
      Required = True
    end
    object cdsRelatorioABA_DATA: TSQLTimeStampField
      FieldName = 'ABA_DATA'
      Required = True
    end
    object cdsRelatorioABA_BOMBA: TIntegerField
      FieldName = 'ABA_BOMBA'
      Required = True
    end
    object cdsRelatorioABA_LITROS: TFloatField
      FieldName = 'ABA_LITROS'
      Required = True
      DisplayFormat = '###.000'
    end
    object cdsRelatorioABA_VALOR: TFloatField
      Alignment = taLeftJustify
      FieldName = 'ABA_VALOR'
      Required = True
      DisplayFormat = '###,###.00'
    end
    object cdsRelatorioABA_IMPOSTO: TFloatField
      FieldName = 'ABA_IMPOSTO'
      Required = True
      DisplayFormat = '###,###.00'
    end
    object cdsRelatorioTANQUE: TIntegerField
      FieldName = 'TANQUE'
      ReadOnly = True
    end
  end
  object cdsPesquisaABAS: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select * from ABASTECIMENTOS where UPPER(ABA_ID) like :ID ORDER ' +
      'BY ABA_ID'
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'DSPPESQUISA'
    Left = 240
    Top = 104
    object cdsPesquisaABASABA_ID: TIntegerField
      FieldName = 'ABA_ID'
      Required = True
    end
    object cdsPesquisaABASABA_DATA: TSQLTimeStampField
      FieldName = 'ABA_DATA'
      Required = True
    end
    object cdsPesquisaABASABA_BOMBA: TIntegerField
      FieldName = 'ABA_BOMBA'
      Required = True
    end
    object cdsPesquisaABASABA_LITROS: TFloatField
      FieldName = 'ABA_LITROS'
      Required = True
      DisplayFormat = '##0.00'
    end
    object cdsPesquisaABASABA_VALOR: TFloatField
      FieldName = 'ABA_VALOR'
      Required = True
      DisplayFormat = '###,##0.00'
    end
    object cdsPesquisaABASABA_IMPOSTO: TFloatField
      FieldName = 'ABA_IMPOSTO'
      Required = True
      DisplayFormat = '###,##0.00'
    end
  end
end
