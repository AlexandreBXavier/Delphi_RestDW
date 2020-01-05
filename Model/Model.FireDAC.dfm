object ModelFireDAC: TModelFireDAC
  OldCreateOrder = False
  Height = 290
  Width = 483
  object FDConnectionLocal: TFDConnection
    FetchOptions.AssignedValues = [evCursorKind]
    FetchOptions.CursorKind = ckDefault
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords]
    TxOptions.AutoStop = False
    TxOptions.DisconnectAction = xdRollback
    ConnectedStoredUsage = []
    LoginPrompt = False
    Transaction = FDTransaction
    Left = 80
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 144
    Top = 16
  end
  object FDTransaction: TFDTransaction
    Options.AutoStop = False
    Options.DisconnectAction = xdRollback
    Connection = FDConnectionLocal
    Left = 112
    Top = 16
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 176
    Top = 16
  end
end
