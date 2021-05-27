inherited FPESQUISAABA: TFPESQUISAABA
  Width = 581
  Height = 312
  Caption = 'Pesquisa Abastecimentos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 13
    Caption = 'ID:'
  end
  inherited EDPROC: TEdit
    Left = 152
    Width = 385
  end
  inherited DBGrid1: TDBGrid
    Width = 423
    Columns = <
      item
        Expanded = False
        FieldName = 'ABA_ID'
        Title.Caption = 'ID'
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ABA_DATA'
        Title.Caption = 'Data'
        Width = 84
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ABA_BOMBA'
        Title.Caption = 'Bomba'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABA_LITROS'
        Title.Caption = 'Litros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABA_VALOR'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABA_IMPOSTO'
        Title.Caption = 'Imposto'
        Visible = True
      end>
  end
  inherited RGPROC: TRadioGroup
    Width = 102
    ItemIndex = 0
    Items.Strings = (
      'ID'
      'Bomba')
  end
  inherited GBDADOS: TGroupBox
    Left = 8
    Top = 290
    Height = 103
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 18
      Height = 13
      Caption = 'ID:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 190
      Top = 75
      Width = 49
      Height = 13
      Caption = 'Imposto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTID: TDBText
      Left = 61
      Top = 24
      Width = 54
      Height = 13
      DataField = 'ABA_ID'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBTIMPOSTO: TDBText
      Left = 241
      Top = 75
      Width = 75
      Height = 13
      DataField = 'ABA_IMPOSTO'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 75
      Width = 34
      Height = 13
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTVALOR: TDBText
      Left = 61
      Top = 75
      Width = 67
      Height = 13
      DataField = 'ABA_VALOR'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBTBOMBA: TDBText
      Left = 61
      Top = 48
      Width = 61
      Height = 13
      DataField = 'ABA_BOMBA'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 48
      Width = 43
      Height = 13
      Caption = 'Bomba:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTDATA: TDBText
      Left = 241
      Top = 24
      Width = 68
      Height = 13
      DataField = 'ABA_DATA'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 190
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTLITROS: TDBText
      Left = 241
      Top = 48
      Width = 61
      Height = 13
      DataField = 'ABA_LITROS'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 190
      Top = 48
      Width = 36
      Height = 13
      Caption = 'Litors:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited BOTORDENAR: TBitBtn
    Width = 102
  end
  inherited DataSource1: TDataSource
    DataSet = MODULOP.cdsPesquisaABAS
  end
  object DataSource2: TDataSource
    DataSet = MODULO.CDSABA
    Left = 16
    Top = 152
  end
end
