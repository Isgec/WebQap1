Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.QAP
  <DataObject()> _
  Partial Public Class qapRequestsApprove
    Inherits SIS.QAP.qapRequests
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsApproveGetNewRecord() As SIS.QAP.qapRequestsApprove
      Return New SIS.QAP.qapRequestsApprove()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsApproveSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal DocumentTypeID As Int32, ByVal ProjectID As String, ByVal SupplierID As String, ByVal CreatersDivision As String) As List(Of SIS.QAP.qapRequestsApprove)
      Dim Results As List(Of SIS.QAP.qapRequestsApprove) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "spqapRequestsApproveSelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "spqapRequestsApproveSelectListFilteres"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_DocumentTypeID",SqlDbType.Int,10, IIf(DocumentTypeID = Nothing, 0,DocumentTypeID))
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_ProjectID",SqlDbType.NVarChar,6, IIf(ProjectID Is Nothing, String.Empty,ProjectID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_SupplierID", SqlDbType.NVarChar, 9, IIf(SupplierID Is Nothing, String.Empty, SupplierID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_CreatersDivision",SqlDbType.NVarChar,6, IIf(CreatersDivision Is Nothing, String.Empty,CreatersDivision))
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,10, 4)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          RecordCount = -1
          Results = New List(Of SIS.QAP.qapRequestsApprove)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.QAP.qapRequestsApprove(Reader))
          End While
          Reader.Close()
          RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function qapRequestsApproveSelectCount(ByVal SearchState As Boolean, ByVal SearchText As String, ByVal DocumentTypeID As Int32, ByVal ProjectID As String, ByVal SupplierID As String, ByVal CreatersDivision As String) As Integer
      Return RecordCount
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsApproveGetByID(ByVal RequestNo As Int32) As SIS.QAP.qapRequestsApprove
      Dim Results As SIS.QAP.qapRequestsApprove = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RequestNo",SqlDbType.Int,RequestNo.ToString.Length, RequestNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
					If Reader.Read() Then
						Results = New SIS.QAP.qapRequestsApprove(Reader)
					End If
					Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsApproveGetByID(ByVal RequestNo As Int32, ByVal Filter_DocumentTypeID As Int32, ByVal Filter_ProjectID As String, ByVal Filter_SupplierID As String, ByVal Filter_CreatersDivision As String) As SIS.QAP.qapRequestsApprove
      Dim Results As SIS.QAP.qapRequestsApprove = SIS.QAP.qapRequestsApprove.qapRequestsApproveGetByID(RequestNo)
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function qapRequestsApproveUpdate(ByVal Record As SIS.QAP.qapRequestsApprove) As SIS.QAP.qapRequestsApprove
      Dim _Rec As SIS.QAP.qapRequestsApprove = SIS.QAP.qapRequestsApprove.qapRequestsApproveGetByID(Record.RequestNo)
      With _Rec
        .QAPRevisionNo = Record.QAPRevisionNo
        .QAPNo = Record.QAPNo
        .ApproveBy = Global.System.Web.HttpContext.Current.Session("LoginID")
        .ApproveOn = Now
        .ApproverRemarks = Record.ApproverRemarks
        .ApproverDivision = _Rec.FK_QAP_Requests_ApprovedBy.C_DivisionID
        .StatusID = Record.StatusID
      End With
      Return SIS.QAP.qapRequestsApprove.UpdateData(_Rec)
    End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      MyBase.New(Reader)
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace
