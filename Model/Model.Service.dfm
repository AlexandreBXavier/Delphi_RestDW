object ModelMethod: TModelMethod
  OldCreateOrder = False
  OnCreate = ServerMethodDataModuleCreate
  Encoding = esUtf8
  OnReplyEvent = ServerMethodDataModuleReplyEvent
  Height = 278
  Width = 527
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\DW\CORE\Demos\EMPLOYEE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evCursorKind]
    FetchOptions.CursorKind = ckDefault
    UpdateOptions.AssignedValues = [uvCountUpdatedRecords]
    ConnectedStoredUsage = []
    LoginPrompt = False
    Transaction = FDTransaction
    BeforeConnect = FDConnectionBeforeConnect
    Left = 48
    Top = 16
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 280
    Top = 16
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 248
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 112
    Top = 16
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 312
    Top = 16
  end
  object FDTransaction: TFDTransaction
    Options.AutoStop = False
    Options.DisconnectAction = xdRollback
    Connection = FDConnection
    Left = 80
    Top = 16
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      '')
    Left = 144
    Top = 16
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    Left = 344
    Top = 16
  end
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    Left = 376
    Top = 16
  end
  object FDMoniRemoteClientLink: TFDMoniRemoteClientLink
    Left = 408
    Top = 16
  end
  object FDPhysODBCDriverLink: TFDPhysODBCDriverLink
    Left = 440
    Top = 16
  end
  object DWServerEvents: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovDateTime
            ParamName = 'result'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'servertime'
        OnReplyEvent = DWServerEventsEventsservertimeReplyEvent
      end
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odOUT
            ObjectValue = ovString
            ParamName = 'result'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'test'
        OnReplyEvent = DWServerEventsEventstestReplyEvent
      end>
    Left = 112
    Top = 200
  end
  object RESTDWPoolerDB: TRESTDWPoolerDB
    RESTDriver = RESTDWDriverFD
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    ParamCreate = True
    Left = 344
    Top = 200
  end
  object RESTDWDriverFD: TRESTDWDriverFD
    CommitRecords = 100
    Connection = FDConnection
    Left = 344
    Top = 136
  end
end
