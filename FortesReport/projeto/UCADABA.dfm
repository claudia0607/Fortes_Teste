inherited FCADABA: TFCADABA
  Left = 257
  Top = 115
  Caption = 'Cadastro de Abastecimentos'
  ClientHeight = 454
  ClientWidth = 686
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PAOK: TPanel
    Top = 280
  end
  inherited PADADOS: TPanel
    Height = 332
    inherited PAGE: TPageControl
      Left = 7
      Top = 2
      Width = 513
      Height = 323
      inherited PAGINA1: TTabSheet
        object Label1: TLabel
          Left = 72
          Top = 55
          Width = 14
          Height = 13
          Caption = 'ID'
        end
        object Label2: TLabel
          Left = 296
          Top = 119
          Width = 32
          Height = 13
          Caption = 'Litros'
          FocusControl = DBELITROS
        end
        object Label16: TLabel
          Left = 72
          Top = 185
          Width = 30
          Height = 13
          Caption = 'Valor'
          FocusControl = DBEVALOR
        end
        object Label11: TLabel
          Left = 296
          Top = 185
          Width = 45
          Height = 13
          Caption = 'Imposto'
        end
        object Label12: TLabel
          Left = 296
          Top = 55
          Width = 28
          Height = 13
          Caption = 'Data'
          FocusControl = DBEDATA
        end
        object Label3: TLabel
          Left = 72
          Top = 120
          Width = 39
          Height = 13
          Caption = 'Bomba'
          FocusControl = DBEBOMBA
        end
        object DBTIMPOSTO: TDBText
          Left = 296
          Top = 200
          Width = 65
          Height = 17
          Alignment = taRightJustify
          DataField = 'ABA_IMPOSTO'
          DataSource = DataSource1
        end
        object DBTID: TDBText
          Left = 72
          Top = 72
          Width = 65
          Height = 17
          DataField = 'ABA_ID'
          DataSource = DataSource1
        end
        object DBELITROS: TDBEdit
          Left = 296
          Top = 135
          Width = 65
          Height = 21
          DataField = 'ABA_LITROS'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnKeyPress = DBEDATAKeyPress
        end
        object DBEVALOR: TDBEdit
          Left = 72
          Top = 200
          Width = 105
          Height = 21
          DataField = 'ABA_VALOR'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnExit = DBEVALORExit
          OnKeyPress = DBEDATAKeyPress
        end
        object DBEDATA: TDBEdit
          Left = 296
          Top = 70
          Width = 105
          Height = 21
          DataField = 'ABA_DATA'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyPress = DBEDATAKeyPress
        end
        object DBEBOMBA: TDBEdit
          Left = 72
          Top = 135
          Width = 41
          Height = 21
          DataField = 'ABA_BOMBA'
          DataSource = DataSource1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 1
          ParentFont = False
          TabOrder = 1
          OnExit = DBEBOMBAExit
          OnKeyPress = DBEDATAKeyPress
        end
      end
    end
  end
  inherited PAPROC: TPanel
    Top = 381
    inherited RGPROC: TRadioGroup
      Items.Strings = (
        'ID')
    end
  end
  inherited PATITULO: TPanel
    Caption = 'Cadastro de Abastecimentos'
  end
  inherited QuickRep1: TQuickRep
    Top = 528
    Width = 1056
    Height = 816
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Orientation = poLandscape
    Page.Values = (
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    inherited TitleBand1: TQRBand
      Width = 980
      Size.Values = (
        174.625000000000000000
        2592.916666666667000000)
      inherited QRLEMP: TQRLabel
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          1526.645833333333000000)
        FontSize = 9
      end
      inherited QRLTITULO: TQRLabel
        Left = 2
        Width = 975
        Size.Values = (
          52.916666666666670000
          5.291666666666667000
          116.416666666666700000
          2579.687500000000000000)
        Caption = 'RELAT'#211'RIO DE INSTITUI'#199#213'ES / ENTIDADES'
        FontSize = 12
      end
      inherited QRSysData6: TQRSysData
        Left = 881
        Size.Values = (
          44.979166666666670000
          2330.979166666667000000
          7.937500000000000000
          251.354166666666700000)
        FontSize = 9
      end
      inherited QRSysData5: TQRSysData
        Left = 828
        Size.Values = (
          44.979166666666670000
          2190.750000000000000000
          60.854166666666680000
          391.583333333333400000)
        FontSize = 9
      end
    end
    inherited ColumnHeaderBand1: TQRBand
      Width = 980
      Size.Values = (
        87.312500000000000000
        2592.916666666667000000)
      inherited QRShape2: TQRShape
        Width = 976
        Size.Values = (
          21.166666666666670000
          2.645833333333333000
          2.645833333333333000
          2582.333333333333000000)
      end
      inherited QRLabel2: TQRLabel
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          21.166666666666670000
          121.708333333333300000)
        FontSize = 10
      end
      inherited QRShape1: TQRShape
        Width = 976
        Size.Values = (
          18.520833333333330000
          2.645833333333333000
          66.145833333333340000
          2582.333333333333000000)
      end
      object QRLabel1: TQRLabel
        Left = 545
        Top = 8
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1441.979166666667000000
          21.166666666666670000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Endere'#231'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 89
        Top = 8
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          235.479166666666700000
          21.166666666666670000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 878
        Top = 8
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2323.041666666667000000
          21.166666666666670000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telefone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited DetailBand1: TQRBand
      Width = 980
      Size.Values = (
        63.500000000000000000
        2592.916666666667000000)
      inherited QRDBTCOD: TQRDBText
        Width = 72
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          7.937500000000000000
          190.500000000000000000)
        DataField = 'ENTCOD'
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 546
        Top = 3
        Width = 327
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1444.625000000000000000
          7.937500000000000000
          865.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'ENTEND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 90
        Top = 3
        Width = 450
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          238.125000000000000000
          7.937500000000000000
          1190.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'ENTNOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 878
        Top = 3
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2323.041666666667000000
          7.937500000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'ENTTEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
  end
  inherited DataSource1: TDataSource
    DataSet = MODULO.CDSABA
    Top = 4
  end
end
