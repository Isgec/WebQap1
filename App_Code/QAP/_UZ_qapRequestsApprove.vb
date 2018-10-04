Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.QAP
  Partial Public Class qapRequestsApprove
    Public ReadOnly Property ApproveWFVisible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
					mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property ApproveWFEnable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
					mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property RejectWFVisible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
					mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property RejectWFEnable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
					mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
		Public Shared Function ApproveWF(ByVal RequestNo As Int32, ByVal ApproverRemarks As String) As SIS.QAP.qapRequestsApprove
			Dim Results As SIS.QAP.qapRequestsApprove = qapRequestsApproveGetByID(RequestNo)
			With Results
				.StatusID = States.Approved
				.ApproverRemarks = ApproverRemarks
			End With
			Results = SIS.QAP.qapRequestsApprove.qapRequestsApproveUpdate(Results)
			SendEMail(Results, "AA")
			Return Results
		End Function
    Public Shared Function RejectWF(ByVal RequestNo As Int32, ByVal ApproverRemarks As String) As SIS.QAP.qapRequestsApprove
			Dim Results As SIS.QAP.qapRequestsApprove = qapRequestsApproveGetByID(RequestNo)
			With Results
				.StatusID = States.Returned
				.ApproverRemarks = ApproverRemarks
			End With
			Results = SIS.QAP.qapRequestsApprove.qapRequestsApproveUpdate(Results)
			SendEMail(Results, "AR")
      Return Results
    End Function
		Public Shared Function UZ_qapRequestsApproveSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal DocumentTypeID As Int32, ByVal ProjectID As String, ByVal SupplierID As String, ByVal CreatersDivision As String) As List(Of SIS.QAP.qapRequestsApprove)
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
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_DocumentTypeID", SqlDbType.Int, 10, IIf(DocumentTypeID = Nothing, 0, DocumentTypeID))
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_ProjectID", SqlDbType.NVarChar, 6, IIf(ProjectID Is Nothing, String.Empty, ProjectID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_SupplierID", SqlDbType.NVarChar, 9, IIf(SupplierID Is Nothing, String.Empty, SupplierID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_CreatersDivision", SqlDbType.NVarChar, 6, IIf(CreatersDivision Is Nothing, String.Empty, CreatersDivision))
					End If
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NVarChar, 9, HttpContext.Current.Session("LoginID"))
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID", SqlDbType.Int, 10, 4)
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
    Public Shared Function UZ_qapRequestsApproveUpdate(ByVal Record As SIS.QAP.qapRequestsApprove) As SIS.QAP.qapRequestsApprove
      Dim _Result As SIS.QAP.qapRequestsApprove = qapRequestsApproveUpdate(Record)
      Return _Result
    End Function
  End Class
End Namespace
