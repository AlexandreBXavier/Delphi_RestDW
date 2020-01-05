object ViewDatabase: TViewDatabase
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Database Configuration'
  ClientHeight = 357
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxConnection: TGroupBox
    Left = 8
    Top = 8
    Width = 624
    Height = 131
    Caption = ' Connection '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LabelDriver: TLabel
      Left = 15
      Top = 20
      Width = 30
      Height = 13
      Caption = 'Driver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelServer: TLabel
      Left = 15
      Top = 71
      Width = 31
      Height = 13
      Caption = 'Server'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelPort: TLabel
      Left = 304
      Top = 71
      Width = 21
      Height = 13
      Caption = 'Port'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ComboBoxDriver: TComboBox
      Left = 15
      Top = 38
      Width = 269
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'MSSQL'
      Items.Strings = (
        'MSSQL'
        'FB'
        'MySQL'
        'PostgreSQL'
        'ODBC')
    end
    object CheckBoxUseURL: TCheckBox
      Left = 304
      Top = 15
      Width = 82
      Height = 17
      Caption = 'Use URL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EditURL: TEdit
      Left = 304
      Top = 38
      Width = 305
      Height = 21
      TabOrder = 2
    end
    object EditServer: TEdit
      Left = 15
      Top = 87
      Width = 269
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '127.0.0.1\SQLEXPRESS'
    end
    object EditPort: TEdit
      Left = 304
      Top = 87
      Width = 40
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Text = '1433'
    end
  end
  object GroupBoxAuthentication: TGroupBox
    Left = 8
    Top = 145
    Width = 624
    Height = 72
    Caption = ' Authentication '
    TabOrder = 1
    object LabelUsername: TLabel
      Left = 15
      Top = 15
      Width = 23
      Height = 13
      Caption = 'User'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelPassword: TLabel
      Left = 136
      Top = 15
      Width = 49
      Height = 13
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EditUsername: TEdit
      Left = 15
      Top = 31
      Width = 115
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'sa'
    end
    object EditPassword: TEdit
      Left = 136
      Top = 31
      Width = 148
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      Text = 'masterkey'
    end
    object CheckBoxOsAuthent: TCheckBox
      Left = 298
      Top = 32
      Width = 91
      Height = 17
      Caption = 'OsAuthent'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object ButtonTest: TButton
      Left = 480
      Top = 28
      Width = 75
      Height = 25
      Caption = 'Test'
      TabOrder = 3
      OnClick = ButtonTestClick
    end
  end
  object GroupBoxDatabase: TGroupBox
    Left = 8
    Top = 227
    Width = 624
    Height = 121
    Caption = 'Database'
    TabOrder = 2
    object LabelFolder: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Folder'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelDatabase: TLabel
      Left = 16
      Top = 73
      Width = 46
      Height = 13
      Caption = 'BD Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelDataSource: TLabel
      Left = 304
      Top = 73
      Width = 59
      Height = 13
      Caption = 'DataSource'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelMonitor: TLabel
      Left = 456
      Top = 73
      Width = 53
      Height = 13
      Caption = 'MonitorBy'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EditFolder: TEdit
      Left = 16
      Top = 40
      Width = 594
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EditDatabase: TEdit
      Left = 16
      Top = 89
      Width = 269
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EditDataSource: TEdit
      Left = 304
      Top = 89
      Width = 148
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EditMonitor: TEdit
      Left = 458
      Top = 89
      Width = 148
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
end
