object ViewServer: TViewServer
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Server Configuration'
  ClientHeight = 310
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
  object GroupBoxSSL: TGroupBox
    Left = 8
    Top = 158
    Width = 624
    Height = 145
    Caption = ' Config SSL '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object LabelFileCertification: TLabel
      Left = 16
      Top = 80
      Width = 45
      Height = 13
      Caption = 'Cert. File'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelFilePrivateKey: TLabel
      Left = 16
      Top = 18
      Width = 75
      Height = 13
      Caption = 'Private Key File'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelPassPrivateKey: TLabel
      Left = 462
      Top = 19
      Width = 106
      Height = 13
      Caption = 'Private Key Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EditFileCertification: TEdit
      Left = 16
      Top = 100
      Width = 585
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EditFilePrivateKey: TEdit
      Left = 16
      Top = 38
      Width = 440
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EditPassPrivateKey: TMaskEdit
      Left = 462
      Top = 38
      Width = 133
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      Text = ''
    end
  end
  object GroupBoxExtras: TGroupBox
    Left = 328
    Top = 8
    Width = 304
    Height = 144
    Caption = ' Extras '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      304
      144)
    object CheckBoxPooler: TCheckBox
      Left = 16
      Top = 93
      Width = 197
      Height = 17
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Pooler'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object CheckBoxLog: TCheckBox
      Left = 16
      Top = 70
      Width = 200
      Height = 17
      Caption = 'Update Memo LOG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object CheckBoxForceWelcome: TCheckBox
      Left = 16
      Top = 47
      Width = 197
      Height = 17
      Caption = 'Force Welcome Access Events'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object CheckBoxAuthentication: TCheckBox
      Left = 16
      Top = 24
      Width = 197
      Height = 17
      Caption = 'Authentication'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBoxAuthentication: TGroupBox
    Left = 8
    Top = 8
    Width = 305
    Height = 144
    Caption = ' Authentication '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LabelPassword: TLabel
      Left = 136
      Top = 75
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
    object LabelUsername: TLabel
      Left = 16
      Top = 75
      Width = 51
      Height = 13
      Caption = 'Username'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelAccessTag: TLabel
      Left = 136
      Top = 20
      Width = 51
      Height = 13
      Caption = 'Acess TAG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelPort: TLabel
      Left = 16
      Top = 20
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
    object EditPassword: TEdit
      Left = 136
      Top = 96
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      Text = 'testserver'
    end
    object EditUsername: TEdit
      Left = 16
      Top = 96
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'testserver'
    end
    object EditAccessTag: TEdit
      Left = 136
      Top = 41
      Width = 100
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'RestDW'
    end
    object EditPort: TEdit
      Left = 16
      Top = 41
      Width = 99
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '8082'
    end
  end
end
