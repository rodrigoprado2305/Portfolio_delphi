object FormPedidos: TFormPedidos
  Left = 0
  Top = 0
  Caption = 'FormPedidos'
  ClientHeight = 489
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pcPedidos: TPageControl
    Left = 0
    Top = 25
    Width = 773
    Height = 464
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    object tsPesquisa: TTabSheet
      Caption = 'Search'
      object Splitter: TSplitter
        Left = 0
        Top = 161
        Width = 765
        Height = 5
        Cursor = crVSplit
        Align = alTop
        Color = clMenuHighlight
        ParentColor = False
        ExplicitTop = 155
        ExplicitWidth = 812
      end
      object gbListaPedidos: TGroupBox
        Left = 0
        Top = 0
        Width = 765
        Height = 161
        Align = alTop
        Caption = 'Order'
        TabOrder = 0
        object grdListaPedidos: TDBGrid
          Left = 2
          Top = 17
          Width = 761
          Height = 114
          Align = alClient
          DataSource = dsListaPedidos
          DrawingStyle = gdsClassic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          OnDblClick = grdListaPedidosDblClick
          OnKeyPress = grdListaPedidosKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 't003_pedidoID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't003_data_emissao'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't001_nome'
              Width = 273
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't001_cidade'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't001_uf'
              Width = 23
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't003_vlr_total'
              Width = 94
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 2
          Top = 131
          Width = 761
          Height = 28
          Hint = 'Clique aqui para Minimizar/Maximizar dados de contatos'
          Align = alBottom
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Color = clWhite
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object gbListaItens: TGroupBox
        Left = 0
        Top = 166
        Width = 765
        Height = 240
        Align = alClient
        Caption = 'Itens'
        TabOrder = 1
        object grdListaItens: TDBGrid
          Left = 2
          Top = 17
          Width = 761
          Height = 193
          Align = alClient
          DataSource = dsListaItens
          DrawingStyle = gdsClassic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 't004_pedido_produtoID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't002_descricao'
              Width = 382
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't004_quantidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't004_vlr_unitario'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't004_vlr_total'
              Width = 98
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 2
          Top = 210
          Width = 761
          Height = 28
          Hint = 'Clique aqui para Minimizar/Maximizar dados de contatos'
          Align = alBottom
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Color = clWhite
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlRodapeListaPedidos: TPanel
        Left = 0
        Top = 406
        Width = 765
        Height = 28
        Hint = 'Clique aqui para Minimizar/Maximizar dados de contatos'
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        object btnListaSelecionar: TSpeedButton
          Left = 169
          Top = 0
          Width = 248
          Height = 28
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'select record'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFBBE4C270CF8527B7471EBA401EBA4027B74770CF85BBE4C2FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFA4FB96219C1401FCE4C24DC5827
            DD5C27DD5C24DC581FCE4C19C1404FB962FAFDFAFFFFFFFFFFFFFFFFFFFBFDFB
            21A93A1ED04E21D45420D05304B62A18C4401DCE4A18C84420D15121D4541ED0
            4E21A93AFBFDFBFFFFFFFFFFFF4EB15B1ECE4D22D45615C9481CAC2F9DD2A137
            AF4614C13B1FD24E1ECE4B1ECD4A20D2531ECE4D4EB15BFFFFFFBDDEBE17BA3F
            21D85A13C64612A826F2F4ECFFFFFFEAF2E626AA380DC03920D24F1ECE491DCD
            4D20D75817BA3FBDDEBE6ABC7418D15214CB4E0BA01EF2F4ECFFFBFFFFFAFFFF
            FFFFEAF2E623A8350BC03A1ED3591CCF531ED25818CF516ABC7430A03F2DE172
            1BA82DF2F4ECFFF8FFEAF2E6A9D5A4EEF2EBFFFFFFD0EBD323A8340AC24218D6
            6213CF5430E17330A14130A34365EAA158B25CEAF2E6EAF2E60EB42F00BF303A
            B649F2F4ECFFFFFFEAF2E623A83307C13D24D86973F0B130A14223953778F4BC
            49CD7A74BF7F2DB64C24D3672ED87219CC5A48B558EAF2E6FFFFFFEAF2E626A7
            3125D06077F6BE23953533933D71F2B561E4A84CDB955BE1A561DEA563DDA463
            E2AB4DDA964FB860EEF2E8FFFFFFEAF2E62AB3436DF0B333933D67AB6686E3B5
            62E7A95DE2A460E2A65FE1A65FE1A65EE1A563E5AD4CDA954DB75EEAF0E5FFFF
            FF61BC6580DFAE67AB66B9D4B94EB068A8FCE15FE1A257E09F5BE0A35DE1A45D
            E1A45DE1A461E5AB4EDC9748BA605DC27096EABF4EB068B9D4B9FFFFFF458945
            7BDBA7B0FCE876E5B562E3AA5EE0A65EE1A65EE1A65EE0A566E6B06FE3AFA7F9
            E07ADCA8458945FFFFFFFFFFFFFAFDFA1572156DD6A3B3FDF0A4F5DF8CE9C78C
            E8C48AE7C28DE9C6A5F5DEB3FDF06DD6A3157215FAFDFAFFFFFFFFFFFFFFFFFF
            F9FCF945864538A75E7FE1B8A9FFECB9FFFBB9FFFBA9FFEC7FE1B838A75E4586
            45F9FCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7CEB767A567247D3328
            8738288738247D3367A567B7CEB7FFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnListaSelecionarClick
          ExplicitLeft = 97
        end
        object btnListaPesquisa: TSpeedButton
          Left = 0
          Top = 0
          Width = 169
          Height = 28
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Search'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF314B62
            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
            00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
            B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
            EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
            FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
            B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
            FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
            E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
            A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
            FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
            C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
            FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
            A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnListaPesquisaClick
        end
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Order Entry'
      ImageIndex = 1
      object gbxItens: TGroupBox
        Left = 0
        Top = 96
        Width = 765
        Height = 338
        Align = alClient
        Caption = 'Itens do pedido'
        TabOrder = 1
        object grdItens: TDBGrid
          Left = 2
          Top = 59
          Width = 761
          Height = 249
          Align = alClient
          DataSource = dsItens
          DrawingStyle = gdsClassic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = [fsBold]
          OnKeyPress = grdItensKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 't004_pedido_produtoID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't002_produtoID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't002_descricao'
              Width = 211
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't004_quantidade'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't004_vlr_unitario'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 't004_vlr_total'
              Width = 115
              Visible = True
            end>
        end
        object pnlRodapeItem: TPanel
          Left = 2
          Top = 308
          Width = 761
          Height = 28
          Hint = 'Clique aqui para Minimizar/Maximizar dados de contatos'
          Align = alBottom
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Color = clWhite
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          object btnExcluirItem: TSpeedButton
            Left = 153
            Top = 0
            Width = 104
            Height = 28
            Cursor = crHandPoint
            Align = alLeft
            Caption = 'Delete item'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFF1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D
              25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA5A60E4
              5A60E45A60E45A60E45A60E45A60E45A60E45A60E45A60E45A60E45A60E45A60
              E45A60E45A60E41D25DA1D25DA767BE8767BE8767BE8767BE8767BE8767BE876
              7BE8767BE8767BE8767BE8767BE8767BE8767BE8767BE81D25DA1D25DA979BEE
              979BEE979BEE979BEE979BEE979BEE979BEE979BEE979BEE979BEE979BEE979B
              EE979BEE979BEE1D25DA1D25DAB8BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8
              BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8BAF31D25DA1D25DA1D25DA
              1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25
              DA1D25DA1D25DA1D25DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            OnClick = btnExcluirItemClick
          end
          object btnInserirItem: TSpeedButton
            Left = 0
            Top = 0
            Width = 153
            Height = 28
            Cursor = crHandPoint
            Align = alLeft
            Caption = 'Insert/ Update item'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF9F5A009F5A009F5A009F5A009F5A009F5A00F5EEE2FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F5A00B26203B2
              6203B26203B262039F5A00F4ECDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF9F5A00B96B09BB6B09B96B09B96B099F5A00F4EDE0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F5A00BD7011BE
              6F11BD7011BD70119F5A00F6F0E6FFFFFFFFFFFFFFFFFFFFFFFFF8EDDDF2E0C6
              F3E2C9F2E1C6F7E9D49F5A00C47718C47718C27617C477189F5A00EAD2AFF4E3
              CAF3E2C9F3E2C9F4E5CE9F5A009F5A009F5A009F5A009F5A009F5A00C87E1EC8
              7E1EC87E1EC87E1E9F5A009F5A009F5A009F5A009F5A009F5A009F5A00C98124
              C98124C98124C98124C98124C98124C98124C98023C98124C98124C98124C981
              24C98124C981249F5A009F5A00D48D2CD8902FD1892BD1892BD1892BD0892BCE
              872ACE872ACE882AD1892BD1892BD1892BD48D2CD48D2C9F5A009F5A00DE9B39
              DE9B39D89434D89334D89435D69133D28E31D28E31D48F32D89435D89434D893
              34DC9736DE9B399F5A009F5A00D99739D99739D99739D99739D99739D99739D9
              9739D99739D99739D99739D99739D99739D99739D997399F5A009F5A009F5A00
              9F5A009F5A009F5A009F5A00E2A243E2A243E1A042E2A2439F5A009F5A009F5A
              009F5A009F5A009F5A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F5A00E7A94DE7
              A94DE5A94BE7A94D9F5A00FCF9F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF9F5A00EBB054EDB355EBB054EBB0549F5A00F5EDE2FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F5A00F7C166FA
              C567F7C166F7C1669F5A00F4EBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF9F5A00FFD480FFD480FFD480FFD4809F5A00F3EADCFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F5A009F5A009F
              5A009F5A009F5A009F5A00F8F3EBFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            OnClick = btnInserirItemClick
            ExplicitLeft = -6
          end
          object lblTotalGeral: TLabel
            Left = 669
            Top = 3
            Width = 64
            Height = 13
            Caption = 'Total Geral'
          end
          object btnEditarItem: TSpeedButton
            Left = 257
            Top = 0
            Width = 91
            Height = 28
            Cursor = crHandPoint
            Align = alLeft
            Caption = 'Edit Item'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
              8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
              F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
              83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
              A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
              F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
              83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
              6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
              FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
              79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
              A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
              FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
              69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
              7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
              FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
              5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
              F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
              F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
              FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
              CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
              A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            OnClick = btnEditarItemClick
            ExplicitLeft = 241
          end
          object btnCancelarItem: TSpeedButton
            Left = 348
            Top = 0
            Width = 149
            Height = 28
            Cursor = crHandPoint
            Align = alLeft
            Caption = 'Cancel item'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFF140EAE
              1711B8100BA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF100B
              A11711B8140EAEFFFFFF1F1AB52522E92723F11F1BD1130EA6FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF130EA61F1BD12723F12522E91F1AB53D3AC84648F6
              2425F12A2BF32121D4140FADFFFFFFFFFFFFFFFFFFFFFFFF140FAD2121D42A2B
              F32425F14648F63D3AC8221CB66262E1444BF3262DEF2C33F22326D71812B3FF
              FFFFFFFFFF1812B32326D72C33F2262DEF474DF46262E1221CB6FFFFFF241DBB
              6566E34853F32934EF2F3BF2262BD91A13BA1A13BA262BD92F3BF22834EF4752
              F35F61DF241DBAFFFFFFFFFFFFFFFFFF2621C2656AE54756F32C3DF03041F12B
              36E42B36E43041F12D3DF04A59F35D5FE02119BFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF2721C66267E64356F23044F03448F23448F23044EF4255F26166E5221A
              C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C23CC4551E9354DF136
              4CEF364CEF354DF04251EA2B23CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF1D14CE3240E63C54F23850F0384FF03B54F23445E91D15CEFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F17D4313EE43E58F13953F045
              5EF2455FF23A53F03E57F0303AE31F15D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              2018D93542E7425FF33D59F1556EF3737FF2737EF2566EF33D59F1425EF3313A
              E41F16D9FFFFFFFFFFFFFFFFFF2018DE3744E94663F2405DF15C77F36E76EF30
              28DF2E25DF7078F05D77F4405DF14562F2333DE82117DDFFFFFF221BE23947EC
              4A69F34462F25F7AF3686EF0271FE2FFFFFFFFFFFF2C23E2717AF1607BF44362
              F24A69F33846EB2019E24144EC5372F44464F26481F46E76F2271EE6FFFFFFFF
              FFFFFFFFFFFFFFFF2D25E7747CF26480F44564F25270F33D41EB4441ED7B8FF5
              7A94F6737BF32D24EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24EA737C
              F37A93F67A8FF64441EDFFFFFF4845F05A59F22D24EDFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24ED5959F24844F0FFFFFF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            OnClick = btnCancelarItemClick
            ExplicitLeft = 338
          end
          object edtTotalGeral: TEdit
            Left = 546
            Top = -1
            Width = 117
            Height = 21
            Alignment = taRightJustify
            Color = clSilver
            Enabled = False
            NumbersOnly = True
            TabOrder = 0
          end
        end
        object pnlProduto: TPanel
          Left = 2
          Top = 17
          Width = 761
          Height = 42
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btnPesquisaProduto: TSpeedButton
            Left = 132
            Top = 20
            Width = 21
            Height = 23
            Cursor = crHandPoint
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FF314B62
              AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
              106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
              00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
              B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
              EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
              FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
              B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
              FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
              E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
              A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
              FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
              C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
              FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
              A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPesquisaProdutoClick
          end
          object edtValorTotal: TLabeledEdit
            Left = 546
            Top = 20
            Width = 117
            Height = 23
            Alignment = taRightJustify
            Color = clSilver
            EditLabel.Width = 55
            EditLabel.Height = 15
            EditLabel.Caption = 'Valor Total'
            Enabled = False
            TabOrder = 4
            Text = ''
          end
          object edtValorUnitario: TLabeledEdit
            Left = 452
            Top = 20
            Width = 95
            Height = 23
            Alignment = taRightJustify
            EditLabel.Width = 70
            EditLabel.Height = 15
            EditLabel.Caption = 'Valor unit'#225'rio'
            NumbersOnly = True
            TabOrder = 3
            Text = ''
            OnEnter = edtValorUnitarioEnter
            OnExit = edtValorUnitarioExit
            OnKeyPress = edtValorUnitarioKeyPress
          end
          object edtQuantidade: TLabeledEdit
            Left = 373
            Top = 20
            Width = 80
            Height = 23
            EditLabel.Width = 62
            EditLabel.Height = 15
            EditLabel.Caption = 'Quantidade'
            NumbersOnly = True
            TabOrder = 2
            Text = ''
            OnExit = edtQuantidadeExit
            OnKeyPress = edtQuantidadeKeyPress
          end
          object edtDescricaoProduto: TLabeledEdit
            Left = 161
            Top = 20
            Width = 213
            Height = 23
            Color = clSilver
            EditLabel.Width = 97
            EditLabel.Height = 15
            EditLabel.Caption = 'Descri'#231#227'o Produto'
            Enabled = False
            TabOrder = 1
            Text = ''
          end
          object edtProduto: TLabeledEdit
            Left = 78
            Top = 20
            Width = 48
            Height = 23
            EditLabel.Width = 43
            EditLabel.Height = 15
            EditLabel.Caption = 'Produto'
            TabOrder = 0
            Text = ''
            OnExit = edtProdutoExit
            OnKeyPress = edtProdutoKeyPress
          end
        end
      end
      object gbxPedidos: TGroupBox
        Left = 0
        Top = 0
        Width = 765
        Height = 68
        Align = alTop
        Caption = 'Order header'
        Color = clBtnFace
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
        object btnPesquisaCliente: TSpeedButton
          Left = 70
          Top = 33
          Width = 21
          Height = 23
          Cursor = crHandPoint
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FF314B62
            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
            00FF925D5AB48C80C9A391C28F88FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF3BABFFA1CAE78C7775A38372EBE0B8FEFCCFFEFCCEFCFBCCE3CF
            B1C0998CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBDA4A4CEA58FFF
            EDB2FFFCCAFFFFCFFFFFCFFFFFD5FFFFEAF3EBE5A0746FFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFB67F76F4D9A1F6D095FCF4C2FFFFCFFFFFD8FFFFEEFFFF
            FAFFFFFFD5C2ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0A792FBDC9AEE
            B87FFBF0BDFFFFD0FFFFDCFFFFF7FFFFFAFFFFE6EEEAC2B7847EFF00FFFF00FF
            FF00FFFF00FFFF00FFDCB79AFAD796EAA76CF7DAA3FFFFCEFFFFD4FFFFE1FFFF
            E3FFFFD7F8F6CBB69782FF00FFFF00FFFF00FFFF00FFFF00FFD5AF96FEE2A1EA
            A96AEFBD80FAE9B4FFFFD0FFFFD3FFFFD1FFFFD1F3EEC5B88B80FF00FFFF00FF
            FF00FFFF00FFFF00FFBB8980FCEBB1F8E2B5F0C690F0C286F7DCA5FEF3C1FEF8
            C6FFFFCFDDCEA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3B499FF
            FFFFFFF4E2EFBD80EBAB6FF0C086FBDEA3FCF3B8AC8676FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFC6ADA7F3EBD1FFEEAFFCDE9DFEE2A1F0D4
            A4C29886FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFBB987EC19983D3AD93D1A592FF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnPesquisaClienteClick
        end
        object lblDataEmissao: TLabel
          Left = 314
          Top = 16
          Width = 70
          Height = 15
          Caption = 'Data Emiss'#227'o'
        end
        object edtDescricaoCliente: TLabeledEdit
          Left = 97
          Top = 33
          Width = 209
          Height = 23
          Color = clSilver
          EditLabel.Width = 91
          EditLabel.Height = 15
          EditLabel.Caption = 'Descri'#231#227'o Cliente'
          Enabled = False
          TabOrder = 1
          Text = ''
        end
        object edtDataEmissao: TDateTimePicker
          Left = 314
          Top = 33
          Width = 186
          Height = 23
          Date = 45581.000000000000000000
          Time = 0.517230231482244600
          TabOrder = 2
        end
        object edtCliente: TLabeledEdit
          Left = 16
          Top = 33
          Width = 48
          Height = 23
          EditLabel.Width = 37
          EditLabel.Height = 15
          EditLabel.Caption = 'Cliente'
          TabOrder = 0
          Text = ''
          OnExit = edtClienteExit
          OnKeyPress = edtClienteKeyPress
        end
      end
      object pnlRodapePedidos: TPanel
        Left = 0
        Top = 68
        Width = 765
        Height = 28
        Hint = 'Clique aqui para Minimizar/Maximizar dados de contatos'
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        object btnInserirPedido: TSpeedButton
          Left = 0
          Top = 0
          Width = 107
          Height = 28
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Insert Order'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            9A52009A52009A52009A52009A52009A52009A52009A52009A52009A52009A52
            00A05C02FFFFFFFFFFFFFFFFFFFFFFFFA15C00E2C397EED7B3ECD4AFECD5AFEC
            D5AFECD5AFECD5AFECD5AFEDD7B2E5C99DA86711FFFFFFFFFFFFFFFFFFFFFFFF
            A7650BF1DEBEFFF4E0FDF1DBFDF1DBFDF1DBFDF1DBFDF1DBFDF1DBFFF4DFF4E3
            C5AD701BFFFFFFFFFFFFFFFFFFFFFFFFAC6C13F0DDBFFDF3E0FBF0DBFBF0DBFB
            F0DBFBF0DBFBF0DBFBF0DBFCF2DFF3E2C6B27622FFFFFFFFFFFFFFFFFFFFFFFF
            B1721AF2E1C7FEF6E8FCF3E3FCF3E3FCF3E3FCF3E3FCF3E3FCF3E3FDF5E7F4E6
            CEB77C2AFFFFFFFFFFFFFFFFFFFFFFFFB77922F3E5CFFFFAF0FDF7EBFDF7EBFD
            F7EBFDF7EBFDF7EBFDF7EBFEF9EFF6EAD6BC8331FFFFFFFFFFFFFFFFFFFFFFFF
            BC812AF4E9D7FEFDF8FDFAF3FDFAF3FDFAF3FDFAF3FDFAF3FDFAF3FEFCF7F7EE
            DEC18A39FFFFFFFFFFFFFFFFFFFFFFFFC18832F6EDDFFFFFFFFEFDFBFEFDFBFE
            FDFBFEFDFBFEFDFBFEFDFBFFFFFFF8F1E6C69140FFFFFFFFFFFFFFFFFFFFFFFF
            C78E3AF7F0E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFBF7
            F0CC9849FFFFFFFFFFFFFFFFFFFFFFFFCC9541F8F0E5FFFFFFFFFFFFFFFFFFFF
            FFFEFFFFFFFFFFFFFFFFFFFFFFFFFBF7F0CE9A4AFFFFFFFFFFFFFFFFFFFFFFFF
            D19C49F9F1E5FFFFFFFFFFFFFFFFFFFFFEFEFFFEFEFFFEFEFFFEFEFFFEFEFBF7
            F0D19A44FFFFFFFFFFFFFFFFFFFFFFFFD7A350F9F2E7FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFCE963DD5A558D5A558D19A44E1B876FFFFFFFFFFFFFFFFFFFFFFFF
            DCAA58FBF4E8FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFDFB571FBF6EEFCF7EFEACD
            8EECD19DFFFFFFFFFFFFFFFFFFFFFFFFE1B260FBF6ECFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFE8C280FEFDFBECC977ECD298FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            E5B561FBF6ECFBF6ECFBF6ECFBF6ECFBF6ECFBF6ECE8BC6FEFC372EFD18CFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBBD6AECC072ECBF71ECC071ECC072EC
            C072EDC376F0C577F2CE89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = btnInserirPedidoClick
          ExplicitLeft = -6
          ExplicitTop = 4
        end
        object btnGravarPedido: TSpeedButton
          Left = 311
          Top = 0
          Width = 127
          Height = 28
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Post'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFCF9F3
            C29760A5640F9F5A009F5A009F5A009F5A009F5A009F5A009F5A009F5A009F5A
            009F5A009F5A009F5A00FDFBF8AE72259F5A00DCB474DCB474A35B03A35B03EE
            D19BEBCC94EBCC94EBCC94ECCD97EBCC94C37F0BBC76029F5A00C9A06A9F5A00
            C58005EBCD9AEBCD9AA95E00A95E00FFEDCAFAE7C0FAE7C0FAE7C0FCE9C4FCE9
            C4C48009C480099F5A00AB6B14BD790ACC8910ECD0A1ECD0A1B06200A95E00FD
            F0D7FAEACCFAEACCFAEACCFBECD1FBECD1CC8910C78411A45F009F5A00C78618
            CA8A18F2DEBAF2DEBAC78829C78829FEF6E6FCF2DDFCF2DDFCF2DDFDF3E2FDF3
            E2CA8A18CA8A18A45F009F5A00C98B1EC98B1EFCF2DFFCF2DFFCF2DFFCF2DFFC
            F2DFFCF2DFFCF2DFFCF2DFFCF2DFFCF2DFCD8E20CD8E20AB6500AB6500CD8F25
            C98B1EFFFEF8FFFEF8FFFEF8FFFEF8FFFEF8FFFEF8FFFEF8FFFEF8FFFEF8FFFE
            F8D19429D19429AB6500AB6500D0942DD0942DD0942DD0942DD0942DD0942DD0
            942DD0942DD0942DD0942DD0942DD0942DD0942DD0942DAB6500B36D00D39833
            D39833D39833D39833D39833D39833D39833D39833D39833D39833D39833D398
            33D39833D39833B36D00B36D00DAA039DAA039DAA039DAA039DAA039DAA039DA
            A039DAA039DAA039DAA039DAA039DAA039DAA039DAA039B36D00B36D00D8A13E
            D8A13ED8A13EFAE6C0F9E5BEF9E5BEF9E5BEF9E5BEF9E5BEF9E5BEF9E6C0DDA7
            46DDA746DDA746B36D00BA7300DBA443DBA443F9E6C4F9E8C6F9E7C5F9E7C5F9
            E7C5F9E7C5F9E7C5F9E7C5F9E7C5FBE9CAE0AB4BE0AB4BBA7300BA7300DEA94A
            DEA94AFAEBCEFAEED4FAEDD2FAEDD2FAEDD2FAEDD2FAEDD2FAEDD2FAEDD2FBEE
            D5E3B053E3B053BA7300C07900E3B054E3B054FCF0DBFCF3E1FCF2DFFCF2DFFC
            F2DFFCF2DFFCF2DFFCF2DFFCF2DFFCF3E2E8B85EE8B85EC07900C07900F2CC83
            F2CC83FDF5E7FEF9EEFEF8ECFEF8ECFEF8ECFEF8ECFEF8ECFEF8ECFEF8ECFEF9
            F0EDC782EDC782C07900C07900C07900C07900C07900C07900C07900C07900C0
            7900C07900C07900C07900C07900C07900C07900C07900C07900}
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = btnGravarPedidoClick
          ExplicitLeft = 305
          ExplicitTop = -6
        end
        object btnAlterarPedido: TSpeedButton
          Left = 107
          Top = 0
          Width = 76
          Height = 28
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Edit'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFB78183B78183B78183B78183B78183B78183B78183B7
            8183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFB78183FDEFD9
            F4E1C9E4CFB4D1BCA0CDB798DAC09AE4C599E9C896EDCB96EECC97F3D199B781
            83FF00FFFF00FFFF00FFB48176FEF3E3F8E7D3494645373C3E516061AE9C82BF
            A889D0B48DE4C393EDCB96F3D199B78183FF00FFFF00FFFF00FFB48176FFF7EB
            F9EBDAB0A5981B617D097CA818556F66625BA79479C5AC86DCBD8DEECD95B781
            83FF00FFFF00FFFF00FFBA8E85FFFCF4FAEFE4F2E5D638728629799A8D787F95
            6D6F7959539D8B73BAA380D9BC8CB47F81FF00FFFF00FFFF00FFBA8E85FFFFFD
            FBF4ECFAEFE3A5B3B17C7078E5A6A3C89292A4727276575195856CAF9978A877
            79FF00FFFF00FFFF00FFCB9A82FFFFFFFEF9F5FBF3ECF4EBDF85787CEEB7B5DA
            A6A6C38E8E9E6E6E73564F93836B996E6FFF00FFFF00FFFF00FFCB9A82FFFFFF
            FFFEFDFDF8F4FBF3ECF0E4D9A37978E9B5B5D9A5A5C48F8F9D6D6D7759528F67
            69FF00FFFF00FFFF00FFDCA887FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBE8D9CE9E
            7473E8B5B5D8A4A4C18D8D9D6C6C7D5556FF00FFFF00FFFF00FFDCA887FFFFFF
            FFFFFFFFFFFFFFFEFDFDF9F4FBF3EBE0CFC5A17676ECB9B9D6A2A2C68E8E965F
            5D585C60FF00FFFF00FFE3B18EFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FD
            F6ECDAC5BCAC8080F3BCBBA3878C3392B319ADCC19ADCCFF00FFE3B18EFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9AA7A71B27873469CBA0FCA
            F400A4E6021EAA000099EDBD92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE4D4D2B8857ADCA76A10A5CF04A8E60936C9092CC30318AEEDBD92FCF7F4
            FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEB8857ACF9B86FF00FF077D
            CD4860F1204ADD0416AAEDBD92DCA887DCA887DCA887DCA887DCA887DCA887DC
            A887DCA887B8857AFF00FFFF00FFFF00FF3E4BDB192DC4FF00FF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = btnAlterarPedidoClick
        end
        object btnExcluirPedido: TSpeedButton
          Left = 183
          Top = 0
          Width = 128
          Height = 28
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Delete'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D
            25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA5A60E4
            5A60E45A60E45A60E45A60E45A60E45A60E45A60E45A60E45A60E45A60E45A60
            E45A60E45A60E41D25DA1D25DA767BE8767BE8767BE8767BE8767BE8767BE876
            7BE8767BE8767BE8767BE8767BE8767BE8767BE8767BE81D25DA1D25DA979BEE
            979BEE979BEE979BEE979BEE979BEE979BEE979BEE979BEE979BEE979BEE979B
            EE979BEE979BEE1D25DA1D25DAB8BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8
            BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8BAF3B8BAF31D25DA1D25DA1D25DA
            1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25DA1D25
            DA1D25DA1D25DA1D25DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = btnExcluirPedidoClick
          ExplicitLeft = 201
        end
        object btnCancelarPedido: TSpeedButton
          Left = 438
          Top = 0
          Width = 130
          Height = 28
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Cancel'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFF140EAE
            1711B8100BA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF100B
            A11711B8140EAEFFFFFF1F1AB52522E92723F11F1BD1130EA6FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF130EA61F1BD12723F12522E91F1AB53D3AC84648F6
            2425F12A2BF32121D4140FADFFFFFFFFFFFFFFFFFFFFFFFF140FAD2121D42A2B
            F32425F14648F63D3AC8221CB66262E1444BF3262DEF2C33F22326D71812B3FF
            FFFFFFFFFF1812B32326D72C33F2262DEF474DF46262E1221CB6FFFFFF241DBB
            6566E34853F32934EF2F3BF2262BD91A13BA1A13BA262BD92F3BF22834EF4752
            F35F61DF241DBAFFFFFFFFFFFFFFFFFF2621C2656AE54756F32C3DF03041F12B
            36E42B36E43041F12D3DF04A59F35D5FE02119BFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF2721C66267E64356F23044F03448F23448F23044EF4255F26166E5221A
            C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C23CC4551E9354DF136
            4CEF364CEF354DF04251EA2B23CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF1D14CE3240E63C54F23850F0384FF03B54F23445E91D15CEFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F17D4313EE43E58F13953F045
            5EF2455FF23A53F03E57F0303AE31F15D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            2018D93542E7425FF33D59F1556EF3737FF2737EF2566EF33D59F1425EF3313A
            E41F16D9FFFFFFFFFFFFFFFFFF2018DE3744E94663F2405DF15C77F36E76EF30
            28DF2E25DF7078F05D77F4405DF14562F2333DE82117DDFFFFFF221BE23947EC
            4A69F34462F25F7AF3686EF0271FE2FFFFFFFFFFFF2C23E2717AF1607BF44362
            F24A69F33846EB2019E24144EC5372F44464F26481F46E76F2271EE6FFFFFFFF
            FFFFFFFFFFFFFFFF2D25E7747CF26480F44564F25270F33D41EB4441ED7B8FF5
            7A94F6737BF32D24EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24EA737C
            F37A93F67A8FF64441EDFFFFFF4845F05A59F22D24EDFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF2D24ED5959F24844F0FFFFFF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          OnClick = btnCancelarPedidoClick
          ExplicitLeft = 444
          ExplicitTop = -6
        end
      end
    end
  end
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 25
    Align = alTop
    TabOrder = 1
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 312
      Height = 23
      Align = alLeft
      BevelInner = bvLowered
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'FormPedidos - Order Entry'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = -4
    end
  end
  object memListaPedidos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 592
    Top = 48
    object memListaPedidost003_pedidoID: TIntegerField
      DisplayLabel = 'N'#250'm. Pedido'
      FieldName = 't003_pedidoID'
    end
    object memListaPedidost003_clienteID: TIntegerField
      DisplayLabel = 'N'#250'm. Cliente'
      FieldName = 't003_clienteID'
    end
    object memListaPedidost003_data_emissao: TDateField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 't003_data_emissao'
    end
    object memListaPedidost001_nome: TStringField
      DisplayLabel = 'Nome do Cliente'
      FieldName = 't001_nome'
      Size = 60
    end
    object memListaPedidost001_cidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 't001_cidade'
      Size = 60
    end
    object memListaPedidost001_uf: TStringField
      DisplayLabel = 'UF'
      FieldName = 't001_uf'
      Size = 2
    end
    object memListaPedidost003_vlr_total: TFloatField
      DisplayLabel = 'Total do Pedido'
      FieldName = 't003_vlr_total'
    end
  end
  object dsListaPedidos: TDataSource
    DataSet = memListaPedidos
    OnDataChange = dsListaPedidosDataChange
    Left = 592
    Top = 81
  end
  object memListaItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 712
    Top = 32
    object memListaItenst004_pedido_produtoID: TIntegerField
      DisplayLabel = 'N'#250'm. Item'
      FieldName = 't004_pedido_produtoID'
    end
    object memListaItenst002_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 't002_descricao'
      Size = 60
    end
    object memListaItenst004_quantidade: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 't004_quantidade'
    end
    object memListaItenst004_vlr_unitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 't004_vlr_unitario'
    end
    object memListaItenst004_vlr_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 't004_vlr_total'
    end
  end
  object dsListaItens: TDataSource
    DataSet = memListaItens
    Left = 712
    Top = 81
  end
  object memItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 704
    Top = 304
    object memItenst004_pedido_produtoID: TIntegerField
      DisplayLabel = 'N'#250'm. Item'
      FieldName = 't004_pedido_produtoID'
    end
    object memItenst003_pedidoID: TIntegerField
      DisplayLabel = 'N'#250'm. Pedido'
      FieldName = 't003_pedidoID'
    end
    object memItenst002_produtoID: TIntegerField
      DisplayLabel = 'N'#250'm. Produto'
      FieldName = 't002_produtoID'
    end
    object memItenst002_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 't002_descricao'
      Size = 60
    end
    object memItenst004_quantidade: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 't004_quantidade'
    end
    object memItenst004_vlr_unitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 't004_vlr_unitario'
    end
    object memItenst004_vlr_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 't004_vlr_total'
    end
  end
  object dsItens: TDataSource
    DataSet = memItens
    Left = 704
    Top = 353
  end
end
