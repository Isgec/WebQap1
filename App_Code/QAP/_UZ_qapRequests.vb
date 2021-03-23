Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Imports System.Net.Mail
Imports System.Web.Mail
Namespace SIS.QAP
	Partial Public Class qapRequests
		Public ReadOnly Property Display_QAR() As String
			Get
				Return IIf(_ClientApprovalRequired, "YES", "NO")
			End Get
		End Property
		Public Function GetColor() As System.Drawing.Color
			Dim mRet As System.Drawing.Color = Drawing.Color.Blue
			Return mRet
		End Function
		Public Function GetVisible() As Boolean
			Dim mRet As Boolean = True
			Return mRet
		End Function
		Public Function GetEnable() As Boolean
			Dim mRet As Boolean = True
			Return mRet
		End Function
		Public ReadOnly Property InitiateWFVisible() As Boolean
			Get
				Dim mRet As Boolean = False
				Try
					Select Case _StatusID
						Case Is = States.Returned, States.Free
							mRet = True
					End Select
				Catch ex As Exception
				End Try
				Return mRet
			End Get
		End Property
		Public ReadOnly Property InitiateWFEnable() As Boolean
			Get
				Dim mRet As Boolean = True
				Try
					mRet = GetEnable()
				Catch ex As Exception
				End Try
				Return mRet
			End Get
		End Property
		Public Shared Function InitiateWF(ByVal RequestNo As Int32) As SIS.QAP.qapRequests
			Dim Results As SIS.QAP.qapRequests = qapRequestsGetByID(RequestNo)
			With Results
				.StatusID = States.UnderReview
				.ReviewBy = ""
				.ReviewOn = ""
				.ReviewerDivision = ""
				.ReviewerRemarks = ""
				.ApproveBy = ""
				.ApproveOn = ""
				.ApproverDivision = ""
				.ApproverRemarks = ""
				.CreatedOn = Now
				.CreatedBy = HttpContext.Current.Session("LoginID")
				.CreatersDivision = SIS.QCM.qcmUsers.qcmUsersGetByID(.CreatedBy).C_DivisionID
			End With
			Results = SIS.QAP.qapRequests.UpdateData(Results)
			Return Results
		End Function
		Public Shared Function UZ_qapRequestsSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal DocumentTypeID As Int32, ByVal ProjectID As String, ByVal SupplierID As String, ByVal StatusID As Int32) As List(Of SIS.QAP.qapRequests)
			Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
			Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
				Using Cmd As SqlCommand = Con.CreateCommand()
					If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
					Cmd.CommandType = CommandType.StoredProcedure
					If SearchState Then
						Cmd.CommandText = "spqap_LG_RequestsSelectListSearch"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
					Else
						Cmd.CommandText = "spqap_LG_RequestsSelectListFilteres"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_DocumentTypeID", SqlDbType.Int, 10, IIf(DocumentTypeID = Nothing, 0, DocumentTypeID))
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_ProjectID", SqlDbType.NVarChar, 6, IIf(ProjectID Is Nothing, String.Empty, ProjectID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_SupplierID", SqlDbType.NVarChar, 9, IIf(SupplierID Is Nothing, String.Empty, SupplierID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_StatusID", SqlDbType.Int, 10, IIf(StatusID = Nothing, 0, StatusID))
					End If
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NVarChar, 9, HttpContext.Current.Session("LoginID"))
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
					Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
					Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
					_RecordCount = -1
					Results = New List(Of SIS.QAP.qapRequests)()
					Con.Open()
					Dim Reader As SqlDataReader = Cmd.ExecuteReader()
					While (Reader.Read())
						Results.Add(New SIS.QAP.qapRequests(Reader))
					End While
					Reader.Close()
					_RecordCount = Cmd.Parameters("@RecordCount").Value
				End Using
			End Using
			Return Results
		End Function
		Public Shared Function UZ_qapRequestsInsert(ByVal Record As SIS.QAP.qapRequests) As SIS.QAP.qapRequests
			Dim _Result As SIS.QAP.qapRequests = qapRequestsInsert(Record)
			Return _Result
		End Function
		Public Shared Function UZ_qapRequestsUpdate(ByVal Record As SIS.QAP.qapRequests) As SIS.QAP.qapRequests
			Dim _Result As SIS.QAP.qapRequests = qapRequestsUpdate(Record)
			Return _Result
		End Function
		Public Shared Function UZ_qapRequestsDelete(ByVal Record As SIS.QAP.qapRequests) As Integer
			Dim _Result As Integer = qapRequestsDelete(Record)
			Return _Result
		End Function
		Public Shared Function UZ_qapRequestsSelectListAll(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal DocumentTypeID As Int32, ByVal ProjectID As String, ByVal SupplierID As String, ByVal StatusID As Int32) As List(Of SIS.QAP.qapRequests)
			Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
			Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
				Using Cmd As SqlCommand = Con.CreateCommand()
					If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
					Cmd.CommandType = CommandType.StoredProcedure
					If SearchState Then
						Cmd.CommandText = "spqap_LG_RequestsSelectListAllSearch"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
					Else
						Cmd.CommandText = "spqap_LG_RequestsSelectListAllFilteres"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_DocumentTypeID", SqlDbType.Int, 10, IIf(DocumentTypeID = Nothing, 0, DocumentTypeID))
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_ProjectID", SqlDbType.NVarChar, 6, IIf(ProjectID Is Nothing, String.Empty, ProjectID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_SupplierID", SqlDbType.NVarChar, 9, IIf(SupplierID Is Nothing, String.Empty, SupplierID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_StatusID", SqlDbType.Int, 10, IIf(StatusID = Nothing, 0, StatusID))
					End If
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NVarChar, 9, HttpContext.Current.Session("LoginID"))
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
					Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
					Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
					_RecordCount = -1
					Results = New List(Of SIS.QAP.qapRequests)()
					Con.Open()
					Dim Reader As SqlDataReader = Cmd.ExecuteReader()
					While (Reader.Read())
						Results.Add(New SIS.QAP.qapRequests(Reader))
					End While
					Reader.Close()
					_RecordCount = Cmd.Parameters("@RecordCount").Value
				End Using
			End Using
			Return Results
		End Function

		'Public ReadOnly Property FK_QAP_Requests_DP() As List(Of SIS.QAP.qapRequests)
		'	Get
		'		If _FK_QAP_Requests_DP Is Nothing Then
		'			_FK_QAP_Requests_DP = SIS.QAP.qapRequests.qapRequestsGetByID(_DocumentTypeID, _ProjectID)
		'		End If
		'		Return _FK_QAP_Requests_DP
		'	End Get
		'End Property
		'Public ReadOnly Property FK_QAP_Requests_DPS() As List(Of SIS.QAP.qapRequests)
		'	Get
		'		If _FK_QAP_Requests_DPS Is Nothing Then
		'			_FK_QAP_Requests_DPS = SIS.QAP.qapRequests.qapRequestsGetByID(_DocumentTypeID, _ProjectID, _SupplierID)
		'		End If
		'		Return _FK_QAP_Requests_DPS
		'	End Get
		'End Property
		Public Shared Shadows Function SendEMail(ByVal oRE As SIS.QAP.qapRequests, ByVal MailEvent As String) As String
			Dim mRet As String = ""
			Dim maySend As Boolean = False
			Dim aErr As New ArrayList

			Dim oClient As SmtpClient = New SmtpClient()
			Dim oMsg As System.Net.Mail.MailMessage = New System.Net.Mail.MailMessage()
			Dim ad As MailAddress = Nothing
			'To EMail
			If oRE.FK_QAP_Requests_CreatedBy.EMailID <> String.Empty Then
				oMsg.To.Add(New MailAddress(oRE.FK_QAP_Requests_CreatedBy.EMailID, oRE.FK_QAP_Requests_CreatedBy.UserFullName))
			Else
				aErr.Add(oRE.CreatedBy & " " & oRE.FK_QAP_Requests_CreatedBy.UserFullName)
				oMsg.To.Add(New MailAddress("gkumar@isgec.co.in", "Ganesh Kumar"))
			End If
			'From EMail
			If MailEvent = "RR" Then
				If oRE.FK_QAP_Requests_ReviewBy.EMailID <> String.Empty Then
					oMsg.From = (New MailAddress(oRE.FK_QAP_Requests_ReviewBy.EMailID, oRE.FK_QAP_Requests_ReviewBy.UserFullName))
					oMsg.CC.Add(New MailAddress(oRE.FK_QAP_Requests_ReviewBy.EMailID, oRE.FK_QAP_Requests_ReviewBy.UserFullName))
				Else
					aErr.Add(oRE.ReviewBy & " " & oRE.FK_QAP_Requests_ReviewBy.UserFullName)
					oMsg.From = (New MailAddress("gkumar@isgec.co.in", "Ganesh Kumar"))
				End If
			Else
				If oRE.FK_QAP_Requests_ApprovedBy.EMailID <> String.Empty Then
					oMsg.From = New MailAddress(oRE.FK_QAP_Requests_ApprovedBy.EMailID, oRE.FK_QAP_Requests_ApprovedBy.UserFullName)
					oMsg.CC.Add(New MailAddress(oRE.FK_QAP_Requests_ApprovedBy.EMailID, oRE.FK_QAP_Requests_ApprovedBy.UserFullName))
				Else
					aErr.Add(oRE.ApproveBy & " " & oRE.FK_QAP_Requests_ApprovedBy.UserFullName)
					oMsg.From = (New MailAddress("gkumar@isgec.co.in", "Ganesh Kumar"))
				End If
			End If
			oMsg.IsBodyHtml = True
			Select Case MailEvent
				Case "RR"
					oMsg.Subject = "QAP Request Returned by Reviewer: " & oRE.RequestNo
				Case "AR"
					oMsg.Subject = "QAP Request Returned by Approver: " & oRE.RequestNo
				Case "AA"
          oMsg.Subject = "QAP Request Released by Approver: " & oRE.RequestNo
      End Select

			Dim sb As New StringBuilder
			With sb
				.AppendLine("<table style=""width:900px"" border=""1"" cellspacing=""1"" cellpadding=""1"">")
				If MailEvent <> "AA" Then
					.AppendLine("<tr><td colspan=""2"" style=""color:red"" align=""center""><h3><b>QAP Request -Returned</b></h2></td></tr>")
				Else
          .AppendLine("<tr><td colspan=""2"" align=""center""><h3><b>QAP Request</b></h2></td></tr>")
        End If
				'Main Execution
				.AppendLine("<tr><td bgcolor=""lightgray""><b>Request No.</b></td><td>" & oRE.RequestNo & "</td></tr>")
				.AppendLine("<tr><td bgcolor=""lightgray""><b>Document Type</b></td><td>" & oRE.FK_QAP_Requests_DocumentTypeID.DocumentName & "</td></tr>")
				.AppendLine("<tr><td><b>Project</b></td><td>" & oRE.FK_QAP_Requests_ProjectID.Description & " [" & oRE.ProjectID & "]" & "</td></tr>")
				Try
					.AppendLine("<tr><td><b>Supplier</b></td><td>" & oRE.FK_QAP_Requests_SupplierID.Description & " [" & oRE.SupplierID & "]</td></tr>")
				Catch ex As Exception
				End Try
				Try
					.AppendLine("<tr><td><b>QAP No</b></td><td>" & oRE.QAPNo & "</td></tr>")
				Catch ex As Exception
				End Try
				Try
					.AppendLine("<tr><td><b>QAP Revision</b></td><td>" & oRE.QAPRevisionNo & "</td></tr>")
				Catch ex As Exception
				End Try
				Try
					.AppendLine("<tr><td><b>Main Item</b></td><td>" & oRE.MainItem & "</td></tr>")
				Catch ex As Exception
				End Try
				If MailEvent = "RR" Then
					Try
						.AppendLine("<tr><td><b>Return Remark</b></td><td>" & oRE.ReviewerRemarks & "</td></tr>")
					Catch ex As Exception
					End Try
				End If
				If MailEvent = "AR" Then
					Try
						.AppendLine("<tr><td><b>Return Remark</b></td><td>" & oRE.ApproverRemarks & "</td></tr>")
					Catch ex As Exception
					End Try
				End If
				If MailEvent = "AA" Then
					Try
            .AppendLine("<tr><td><b>Approver Remark</b></td><td>" & oRE.ApproverRemarks & "</td></tr>")
            .AppendLine("<tr><td><b>Approver Remark</b></td><td>NOTE: For Document Released Category Refer QAP. </td></tr>")
          Catch ex As Exception
					End Try
				End If
				.AppendLine("</table>")
			End With
			Try
				Dim Header As String = ""
				Header = Header & "<html xmlns=""http://www.w3.org/1999/xhtml"">"
				Header = Header & "<head>"
				Header = Header & "<title></title>"
				Header = Header & "<style>"
				Header = Header & "table{"

				Header = Header & "border: solid 1pt black;"
				Header = Header & "border-collapse:collapse;"
				Header = Header & "font-family: Tahoma;}"

				Header = Header & "td{"
				Header = Header & "border: solid 1pt black;"
				Header = Header & "font-family: Tahoma;"
				Header = Header & "font-size: 12px;"
				Header = Header & "vertical-align:top;}"

				Header = Header & "</style>"
				Header = Header & "</head>"
				Header = Header & "<body>"
				If aErr.Count > 0 Then
					Header = Header & "<table>"
					Header = Header & "<tr><td style=""color: red""><i><b>"
          Header = Header & "NOTE: Alert could not be delivered to following recipient(s), Please update their E-Mail ID in HRMIS."
          Header = Header & "</b></i></td></tr>"
					For Each Err As String In aErr
						Header = Header & "<tr><td color=""red""><i>"
						Header = Header & Err
						Header = Header & "</i></td></tr>"
					Next
					Header = Header & "</table>"
				End If
				Header = Header & sb.ToString
				Header = Header & "</body></html>"


				oMsg.Body = Header
				oClient.Send(oMsg)
			Catch ex As Exception
				mRet = ex.Message
			End Try
			Return mRet
		End Function
		Public Shared Function qapList(ByVal DocumentTypeID As Int32, ByVal ProjectID As String, ByVal SupplierID As String) As List(Of SIS.QAP.qapRequests)
			Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
			Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
				Using Cmd As SqlCommand = Con.CreateCommand()
					Cmd.CommandType = CommandType.StoredProcedure
					Cmd.CommandText = "spqap_LG_qapList"
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_DocumentTypeID", SqlDbType.Int, 10, IIf(DocumentTypeID = Nothing, 0, DocumentTypeID))
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_ProjectID", SqlDbType.NVarChar, 6, IIf(ProjectID Is Nothing, String.Empty, ProjectID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_SupplierID", SqlDbType.NVarChar, 9, IIf(SupplierID Is Nothing, String.Empty, SupplierID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NVarChar, 9, HttpContext.Current.Session("LoginID"))
					Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
					Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
					_RecordCount = -1
					Results = New List(Of SIS.QAP.qapRequests)()
					Con.Open()
					Dim Reader As SqlDataReader = Cmd.ExecuteReader()
					While (Reader.Read())
						Results.Add(New SIS.QAP.qapRequests(Reader))
					End While
					Reader.Close()
					_RecordCount = Cmd.Parameters("@RecordCount").Value
				End Using
			End Using
			Return Results
		End Function

	End Class
End Namespace
