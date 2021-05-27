object FRelatorio: TFRelatorio
  Left = 365
  Top = 161
  AutoScroll = False
  Caption = 'Relat'#243'rio'
  ClientHeight = 200
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object RLRAbastecimentos: TRLReport
    Left = 24
    Top = 304
    Width = 794
    Height = 1123
    DataSource = DSRelat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Abastecimentos'
    BeforePrint = RLRAbastecimentosBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 70
        Height = 16
        Align = faLeftTop
        Caption = 'Posto ABC'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 339
        Top = 0
        Width = 40
        Height = 16
        Align = faCenterTop
        Info = itTitle
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 640
        Top = 28
        Width = 78
        Height = 16
        Alignment = taRightJustify
        Text = 'Data: '
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 590
        Top = 0
        Width = 128
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'Pag.:'
      end
      object RLLData: TRLLabel
        Left = 320
        Top = 32
        Width = 74
        Height = 16
        Alignment = taCenter
        Caption = 'RLLDataIni'
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 105
      Width = 718
      Height = 112
      DataFields = 'ABA_DATA'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        BandType = btColumnHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel7: TRLLabel
          Left = 8
          Top = 12
          Width = 33
          Height = 16
          Caption = 'Data'
          Transparent = False
        end
        object RLLabel2: TRLLabel
          Left = 201
          Top = 12
          Width = 56
          Height = 16
          Caption = 'Tanque '
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 329
          Top = 12
          Width = 49
          Height = 16
          Caption = 'Bomba'
          Transparent = False
        end
        object RLLabel4: TRLLabel
          Left = 641
          Top = 12
          Width = 38
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor'
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 48
          Top = 12
          Width = 72
          Height = 16
          DataField = 'ABA_DATA'
          DataSource = DSRelat
          Transparent = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 40
        object RLDBText6: TRLDBText
          Left = 199
          Top = 12
          Width = 57
          Height = 16
          Alignment = taCenter
          DataField = 'TANQUE'
          DataSource = DSRelat
        end
        object RLDBText7: TRLDBText
          Left = 332
          Top = 12
          Width = 53
          Height = 16
          Alignment = taCenter
          DataField = 'ABA_BOMBA'
          DataSource = DSRelat
        end
        object RLDBText8: TRLDBText
          Left = 595
          Top = 16
          Width = 87
          Height = 16
          Alignment = taRightJustify
          DataField = 'ABA_VALOR'
          DataSource = DSRelat
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 73
        Width = 718
        Height = 32
        BandType = btColumnFooter
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLDBResult1: TRLDBResult
          Left = 464
          Top = 8
          Width = 218
          Height = 16
          Alignment = taRightJustify
          DataField = 'ABA_VALOR'
          DataSource = DSRelat
          Info = riSum
          Text = 'Total do Dia: R$ '
          Transparent = False
        end
        object RLDraw1: TRLDraw
          Left = 2
          Top = 24
          Width = 711
          Height = 9
          DrawKind = dkLine
          Transparent = False
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 32
      BandType = btFooter
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLDBResult2: TRLDBResult
        Left = 440
        Top = 10
        Width = 243
        Height = 16
        Alignment = taRightJustify
        DataField = 'ABA_VALOR'
        DataSource = DSRelat
        Info = riSum
        Text = 'Total do Per'#237'odo: R$ '
        Transparent = False
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 449
    Height = 193
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 237
      Top = 64
      Width = 52
      Height = 14
      Caption = 'Data final:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 61
      Top = 64
      Width = 60
      Height = 14
      Caption = 'Data inicial:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DTP_DATINI: TDateTimePicker
      Left = 130
      Top = 61
      Width = 97
      Height = 21
      Date = 0.630602928242297000
      Time = 0.630602928242297000
      TabOrder = 0
    end
    object DTP_DATFIN: TDateTimePicker
      Left = 290
      Top = 61
      Width = 97
      Height = 21
      Date = 41234.630602928240000000
      Time = 41234.630602928240000000
      TabOrder = 1
    end
  end
  object BOTPRINT: TBitBtn
    Left = 98
    Top = 119
    Width = 98
    Height = 30
    Cursor = crHandPoint
    Caption = 'Im&primir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BOTPRINTClick
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CB456734E734E734E734E734E734E1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CB456FF7FFF7FFF7FFF7FFF7F734E1F7C
      1F7C1F7C1F7C1F7C1F7CCE39AD358C31524AFF7FB556B556B556FF7FEF392925
      4A294A291F7C1F7CCE39524A524ACE395246FF7FFF7FFF7FFF7FFF7FEF396B2D
      EF3D8C314A291F7CCE39524AD55A8C316B2DCE39CE39CE39CE39CE396B2DAD35
      0F42CE394A291F7CCE39D55AD55AD55AD55AD55AD55AD55AD55AD55AB4568D3A
      C10EEE3D4A291F7CCE395A6B334AF341F33D1542F541F5411546F441F33DF13D
      4B32EF3D6A2D1F7CCE395A6B7031B235B135B135B035B035B135D135B1359235
      B341524A6B2D1F7CCE395A6B2D29EB202B25AE358E318E318E318E310B21EA1C
      D139524AAD351F7CCE39D55AAF35CE39B456FF7FFF7FFF7FFF7FFF7F734E6D31
      3346D55AAD351F7C1F7CCE3911421142B456FF7FFF7FFF7FFF7FFF7F734ED039
      1142AD351F7C1F7C1F7C1F7C1F7C1F7CB456FF7FFF7FFF7FB456734E734E1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CB456FF7FFF7FFF7FB456FF7F734E1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CB456FF7FFF7FFF7FB456734E1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CB456734E734E734E734E1F7C1F7C1F7C
      1F7C1F7C1F7C}
  end
  object BOTFECHAR: TBitBtn
    Left = 257
    Top = 119
    Width = 98
    Height = 30
    Cursor = crHandPoint
    Caption = '&Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BOTFECHARClick
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C3025690C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C3025302534253525690C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C302530253629382938253625690C3025302530253025
      302530251F7C1F7C1F7C30257A2D5929592959293629690C3F467F4EBF56DE5A
      DE5A30251F7C1F7C1F7C30257A2D7A2D792D592D5729690CC4260227E226E122
      DE5A30251F7C1F7C1F7C30259B317A317A2D7A2D582D690CC526E326E326E222
      DE5A30251F7C1F7C1F7C3025BC359B319B319B31782D690CC426E226E326E222
      DE5A30251F7C1F7C1F7C3025BD359C35FC3D5F6BB939690C744B4A372833052F
      DE5A30251F7C1F7C1F7C3025DE39BD351D425F6BB939690CDF67FF6BFF6BFC63
      DE5A30251F7C1F7C1F7C3025FF3DDE39DD39DE399A31690CBF63FF6BFF6BFF6B
      DE5A30251F7C1F7C1F7C3025FF41FE3DFE3DDE3DBA35690CBF63FF6BFF6BFF6B
      DE5A30251F7C1F7C1F7C30251F42FF41FF3DFF41BB35690CBF63FF6BFF6BFF6B
      DE5A30251F7C1F7C1F7C30253F461F421F421F42DC39690CBF63FF6BFF6BFF6B
      DE5A30251F7C1F7C1F7C30253025DC391F421F42DC39690CBF63FF6BFF67FF6B
      DE5A30251F7C1F7C1F7C1F7C1F7C30255329B935B935690C3025302530253025
      302530251F7C1F7C1F7C1F7C1F7C1F7C1F7C30253025690C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C}
  end
  object DSRelat: TDataSource
    DataSet = MODULOP.cdsRelatorio
    Left = 376
    Top = 24
  end
end
