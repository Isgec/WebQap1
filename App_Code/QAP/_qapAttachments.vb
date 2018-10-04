Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.QAP
  <DataObject()> _
  Partial Public Class qapAttachments
    Private Shared _RecordCount As Integer
    Private _RequestNo As Int32 = 0
    Private _SerialNo As Int32 = 0
    Private _Description As String = ""
    Private _FileName As String = ""
    Private _DiskFile As String = ""
    Private _StatusID As String = ""
    Private _QAP_AttachmentStates1_Description As String = ""
    Private _QAP_Requests1_QAPNo As String = ""
    Private _FK_QAP_Attachments_StatusID As SIS.QAP.qapAttachmentStates = Nothing
    Private _FK_QAP_Attachments_RequestNo As SIS.QAP.qapRequests = Nothing
    Public ReadOnly Property ForeColor() As System.Drawing.Color
      Get
        Dim mRet As System.Drawing.Color = Drawing.Color.Blue
        Try
					mRet = GetColor()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Visible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
					mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Enable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
					mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public Property RequestNo() As Int32
      Get
        Return _RequestNo
      End Get
      Set(ByVal value As Int32)
        _RequestNo = value
      End Set
    End Property
    Public Property SerialNo() As Int32
      Get
        Return _SerialNo
      End Get
      Set(ByVal value As Int32)
        _SerialNo = value
      End Set
    End Property
    Public Property Description() As String
      Get
        Return _Description
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _Description = ""
				 Else
					 _Description = value
			   End If
      End Set
    End Property
    Public Property FileName() As String
      Get
        Return _FileName
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _FileName = ""
				 Else
					 _FileName = value
			   End If
      End Set
    End Property
    Public Property DiskFile() As String
      Get
        Return _DiskFile
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _DiskFile = ""
				 Else
					 _DiskFile = value
			   End If
      End Set
    End Property
    Public Property StatusID() As String
      Get
        Return _StatusID
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _StatusID = ""
				 Else
					 _StatusID = value
			   End If
      End Set
    End Property
    Public Property QAP_AttachmentStates1_Description() As String
      Get
        Return _QAP_AttachmentStates1_Description
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _QAP_AttachmentStates1_Description = ""
				 Else
					 _QAP_AttachmentStates1_Description = value
			   End If
      End Set
    End Property
    Public Property QAP_Requests1_QAPNo() As String
      Get
        Return _QAP_Requests1_QAPNo
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _QAP_Requests1_QAPNo = ""
				 Else
					 _QAP_Requests1_QAPNo = value
			   End If
      End Set
    End Property
    Public Readonly Property DisplayField() As String
      Get
        Return "" & _Description.ToString.PadRight(50, " ")
      End Get
    End Property
    Public Readonly Property PrimaryKey() As String
      Get
        Return _RequestNo & "|" & _SerialNo
      End Get
    End Property
    Public Shared Property RecordCount() As Integer
      Get
        Return _RecordCount
      End Get
      Set(ByVal value As Integer)
        _RecordCount = value
      End Set
    End Property
    Public Class PKqapAttachments
			Private _RequestNo As Int32 = 0
			Private _SerialNo As Int32 = 0
			Public Property RequestNo() As Int32
				Get
					Return _RequestNo
				End Get
				Set(ByVal value As Int32)
					_RequestNo = value
				End Set
			End Property
			Public Property SerialNo() As Int32
				Get
					Return _SerialNo
				End Get
				Set(ByVal value As Int32)
					_SerialNo = value
				End Set
			End Property
    End Class
    Public ReadOnly Property FK_QAP_Attachments_StatusID() As SIS.QAP.qapAttachmentStates
      Get
        If _FK_QAP_Attachments_StatusID Is Nothing Then
          _FK_QAP_Attachments_StatusID = SIS.QAP.qapAttachmentStates.qapAttachmentStatesGetByID(_StatusID)
        End If
        Return _FK_QAP_Attachments_StatusID
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Attachments_RequestNo() As SIS.QAP.qapRequests
      Get
        If _FK_QAP_Attachments_RequestNo Is Nothing Then
          _FK_QAP_Attachments_RequestNo = SIS.QAP.qapRequests.qapRequestsGetByID(_RequestNo)
        End If
        Return _FK_QAP_Attachments_RequestNo
      End Get
    End Property
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapAttachmentsSelectList(ByVal OrderBy As String) As List(Of SIS.QAP.qapAttachments)
      Dim Results As List(Of SIS.QAP.qapAttachments) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "SerialNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapAttachmentsSelectList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.QAP.qapAttachments)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.QAP.qapAttachments(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapAttachmentsGetNewRecord() As SIS.QAP.qapAttachments
      Return New SIS.QAP.qapAttachments()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapAttachmentsGetByID(ByVal RequestNo As Int32, ByVal SerialNo As Int32) As SIS.QAP.qapAttachments
      Dim Results As SIS.QAP.qapAttachments = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapAttachmentsSelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RequestNo",SqlDbType.Int,RequestNo.ToString.Length, RequestNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SerialNo",SqlDbType.Int,SerialNo.ToString.Length, SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
					If Reader.Read() Then
						Results = New SIS.QAP.qapAttachments(Reader)
					End If
					Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapAttachmentsSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal RequestNo As Int32) As List(Of SIS.QAP.qapAttachments)
      Dim Results As List(Of SIS.QAP.qapAttachments) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "SerialNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
					If SearchState Then
						Cmd.CommandText = "spqapAttachmentsSelectListSearch"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
					Else
						Cmd.CommandText = "spqapAttachmentsSelectListFilteres"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_RequestNo",SqlDbType.Int,10, IIf(RequestNo = Nothing, 0,RequestNo))
					End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.QAP.qapAttachments)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.QAP.qapAttachments(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function qapAttachmentsSelectCount(ByVal SearchState As Boolean, ByVal SearchText As String, ByVal RequestNo As Int32) As Integer
      Return _RecordCount
    End Function
      'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapAttachmentsGetByID(ByVal RequestNo As Int32, ByVal SerialNo As Int32, ByVal Filter_RequestNo As Int32) As SIS.QAP.qapAttachments
      Return qapAttachmentsGetByID(RequestNo, SerialNo)
    End Function
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function qapAttachmentsInsert(ByVal Record As SIS.QAP.qapAttachments) As SIS.QAP.qapAttachments
      Dim _Rec As SIS.QAP.qapAttachments = SIS.QAP.qapAttachments.qapAttachmentsGetNewRecord()
      With _Rec
        .RequestNo = Record.RequestNo
        .Description = Record.Description
        .FileName = Record.FileName
        .DiskFile = Record.DiskFile
        .StatusID = 1
      End With
      Return SIS.QAP.qapAttachments.InsertData(_Rec)
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.QAP.qapAttachments) As SIS.QAP.qapAttachments
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapAttachmentsInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RequestNo",SqlDbType.Int,11, Record.RequestNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Description",SqlDbType.NVarChar,51, Iif(Record.Description= "" ,Convert.DBNull, Record.Description))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@FileName",SqlDbType.NVarChar,251, Iif(Record.FileName= "" ,Convert.DBNull, Record.FileName))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@DiskFile",SqlDbType.NVarChar,251, Iif(Record.DiskFile= "" ,Convert.DBNull, Record.DiskFile))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,11, Iif(Record.StatusID= "" ,Convert.DBNull, Record.StatusID))
          Cmd.Parameters.Add("@Return_RequestNo", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_RequestNo").Direction = ParameterDirection.Output
          Cmd.Parameters.Add("@Return_SerialNo", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_SerialNo").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          Record.RequestNo = Cmd.Parameters("@Return_RequestNo").Value
          Record.SerialNo = Cmd.Parameters("@Return_SerialNo").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function qapAttachmentsUpdate(ByVal Record As SIS.QAP.qapAttachments) As SIS.QAP.qapAttachments
      Dim _Rec As SIS.QAP.qapAttachments = SIS.QAP.qapAttachments.qapAttachmentsGetByID(Record.RequestNo, Record.SerialNo)
      With _Rec
        .Description = Record.Description
        .FileName = Record.FileName
        .DiskFile = Record.DiskFile
        .StatusID = Record.StatusID
      End With
      Return SIS.QAP.qapAttachments.UpdateData(_Rec)
    End Function
    Public Shared Function UpdateData(ByVal Record As SIS.QAP.qapAttachments) As SIS.QAP.qapAttachments
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapAttachmentsUpdate"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_RequestNo",SqlDbType.Int,11, Record.RequestNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SerialNo",SqlDbType.Int,11, Record.SerialNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RequestNo",SqlDbType.Int,11, Record.RequestNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Description",SqlDbType.NVarChar,51, Iif(Record.Description= "" ,Convert.DBNull, Record.Description))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@FileName",SqlDbType.NVarChar,251, Iif(Record.FileName= "" ,Convert.DBNull, Record.FileName))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@DiskFile",SqlDbType.NVarChar,251, Iif(Record.DiskFile= "" ,Convert.DBNull, Record.DiskFile))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,11, Iif(Record.StatusID= "" ,Convert.DBNull, Record.StatusID))
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Delete, True)> _
    Public Shared Function qapAttachmentsDelete(ByVal Record As SIS.QAP.qapAttachments) As Int32
      Dim _Result as Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapAttachmentsDelete"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_RequestNo",SqlDbType.Int,Record.RequestNo.ToString.Length, Record.RequestNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_SerialNo",SqlDbType.Int,Record.SerialNo.ToString.Length, Record.SerialNo)
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return _RecordCount
    End Function
'		Autocomplete Method
		Public Shared Function SelectqapAttachmentsAutoCompleteList(ByVal Prefix As String, ByVal count As Integer, ByVal contextKey As String) As String()
			Dim Results As List(Of String) = Nothing
      Dim aVal() As String = contextKey.Split("|".ToCharArray)
			Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
				Using Cmd As SqlCommand = Con.CreateCommand()
					Cmd.CommandType = CommandType.StoredProcedure
					Cmd.CommandText = "spqapAttachmentsAutoCompleteList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@prefix", SqlDbType.NVarChar, 50, Prefix)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@records", SqlDbType.Int, -1, count)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@bycode", SqlDbType.Int, 1, IIf(IsNumeric(Prefix), 0, 1))
					Results = New List(Of String)()
					Con.Open()
					Dim Reader As SqlDataReader = Cmd.ExecuteReader()
					If Not Reader.HasRows Then
					  Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem("---Select Value---".PadRight(50, " "),"" & "|" & ""))
					End If
					While (Reader.Read())
            Dim Tmp As SIS.QAP.qapAttachments = New SIS.QAP.qapAttachments(Reader)
					  Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Tmp.DisplayField, Tmp.PrimaryKey))
					End While
					Reader.Close()
				End Using
			End Using
			Return Results.ToArray
		End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      On Error Resume Next
      _RequestNo = Ctype(Reader("RequestNo"),Int32)
      _SerialNo = Ctype(Reader("SerialNo"),Int32)
      If Convert.IsDBNull(Reader("Description")) Then
        _Description = String.Empty
      Else
        _Description = Ctype(Reader("Description"), String)
      End If
      If Convert.IsDBNull(Reader("FileName")) Then
        _FileName = String.Empty
      Else
        _FileName = Ctype(Reader("FileName"), String)
      End If
      If Convert.IsDBNull(Reader("DiskFile")) Then
        _DiskFile = String.Empty
      Else
        _DiskFile = Ctype(Reader("DiskFile"), String)
      End If
      If Convert.IsDBNull(Reader("StatusID")) Then
        _StatusID = String.Empty
      Else
        _StatusID = Ctype(Reader("StatusID"), String)
      End If
      If Convert.IsDBNull(Reader("QAP_AttachmentStates1_Description")) Then
        _QAP_AttachmentStates1_Description = String.Empty
      Else
        _QAP_AttachmentStates1_Description = Ctype(Reader("QAP_AttachmentStates1_Description"), String)
      End If
      If Convert.IsDBNull(Reader("QAP_Requests1_QAPNo")) Then
        _QAP_Requests1_QAPNo = String.Empty
      Else
        _QAP_Requests1_QAPNo = Ctype(Reader("QAP_Requests1_QAPNo"), String)
      End If
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace
