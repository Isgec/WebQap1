Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.QAP
  <DataObject()> _
  Partial Public Class qapApproverAttachments
    Inherits SIS.QAP.qapAttachments
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapApproverAttachmentsGetNewRecord() As SIS.QAP.qapApproverAttachments
      Return New SIS.QAP.qapApproverAttachments()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapApproverAttachmentsSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal RequestNo As Int32) As List(Of SIS.QAP.qapApproverAttachments)
      Dim Results As List(Of SIS.QAP.qapApproverAttachments) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "SerialNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "spqapApproverAttachmentsSelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "spqapApproverAttachmentsSelectListFilteres"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_RequestNo",SqlDbType.Int,10, IIf(RequestNo = Nothing, 0,RequestNo))
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          RecordCount = -1
          Results = New List(Of SIS.QAP.qapApproverAttachments)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.QAP.qapApproverAttachments(Reader))
          End While
          Reader.Close()
          RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function qapApproverAttachmentsSelectCount(ByVal SearchState As Boolean, ByVal SearchText As String, ByVal RequestNo As Int32) As Integer
      Return RecordCount
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapApproverAttachmentsGetByID(ByVal RequestNo As Int32, ByVal SerialNo As Int32) As SIS.QAP.qapApproverAttachments
      Dim Results As SIS.QAP.qapApproverAttachments = Nothing
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
						Results = New SIS.QAP.qapApproverAttachments(Reader)
					End If
					Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapApproverAttachmentsGetByID(ByVal RequestNo As Int32, ByVal SerialNo As Int32, ByVal Filter_RequestNo As Int32) As SIS.QAP.qapApproverAttachments
      Dim Results As SIS.QAP.qapApproverAttachments = SIS.QAP.qapApproverAttachments.qapApproverAttachmentsGetByID(RequestNo, SerialNo)
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function qapApproverAttachmentsInsert(ByVal Record As SIS.QAP.qapApproverAttachments) As SIS.QAP.qapApproverAttachments
      Dim _Rec As SIS.QAP.qapApproverAttachments = SIS.QAP.qapApproverAttachments.qapApproverAttachmentsGetNewRecord()
      With _Rec
        .RequestNo = Record.RequestNo
        .Description = Record.Description
        .FileName = Record.FileName
        .DiskFile = Record.DiskFile
        .StatusID = 3
      End With
      Return SIS.QAP.qapApproverAttachments.InsertData(_Rec)
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function qapApproverAttachmentsUpdate(ByVal Record As SIS.QAP.qapApproverAttachments) As SIS.QAP.qapApproverAttachments
      Dim _Rec As SIS.QAP.qapApproverAttachments = SIS.QAP.qapApproverAttachments.qapApproverAttachmentsGetByID(Record.RequestNo, Record.SerialNo)
      With _Rec
        .Description = Record.Description
        .FileName = Record.FileName
        .DiskFile = Record.DiskFile
        .StatusID = Record.StatusID
      End With
      Return SIS.QAP.qapApproverAttachments.UpdateData(_Rec)
    End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      MyBase.New(Reader)
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace
