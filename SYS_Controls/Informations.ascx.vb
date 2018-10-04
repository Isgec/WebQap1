Imports System.Collections.Generic
Partial Class Informations
	Inherits System.Web.UI.UserControl
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If HttpContext.Current.User.Identity.IsAuthenticated Then
			Dim mFile As String = HttpContext.Current.Server.MapPath("~/..") & "UserRights/" & HttpContext.Current.Session("ApplicationID") & "/" & HttpContext.Current.User.Identity.Name & "_Menu.xml"
			If IO.File.Exists(mFile) Then
				XmlDataSource1.DataFile = mFile
			End If
			Try
				Dim oRef As HRMS.HRMSServices = New HRMS.HRMSServices
				Dim oEmp As HRMS.hrmEmployees = oRef.Employee(HttpContext.Current.User.Identity.Name)
				If Not oEmp Is Nothing Then
					Dim oDsg As HRMS.hrmDesignations = oRef.Designation(oEmp.C_DesignationID)
					F_EmployeeName.Text = oEmp.EmployeeName
					F_Department.Text = oEmp.C_DepartmentID
					F_Designation.Text = IIf(oDsg IsNot Nothing, oDsg.Description, "N/A")
				Else
					Try
						Dim ouRef As Tools.ToolsServices = New Tools.ToolsServices
						Dim oUsr As Tools.webUsers = ouRef.webUser(HttpContext.Current.User.Identity.Name)
						Dim oDsg As HRMS.hrmDesignations = oRef.Designation(oUsr.C_DesignationID)
						F_EmployeeName.Text = oUsr.UserFullName
						F_Department.Text = oUsr.C_DepartmentID
						F_Designation.Text = IIf(oDsg IsNot Nothing, oDsg.Description, "N/A")

					Catch ex As Exception

					End Try
				End If

			Catch ex As Exception

			End Try
			Me.Visible = True
			Try
				'check any session variable, whether session is expired or not
				Dim chkSession As String = Session("ApplicationID").ToString
			Catch ex As Exception
				Response.Redirect("~/Expired.aspx")
			End Try
      If Not Page.IsPostBack And Not Page.IsCallback Then
        Try
					'LC_invFinancialYear1.SelectedValue = Session("FinYear").ToString
        Catch ex As Exception
          Response.Redirect("~/Expired.aspx")
        End Try
      End If
    End If
	End Sub
	'Protected Sub LC_invFinancialYear1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles LC_invFinancialYear1.SelectedIndexChanged
	'  Session("FinYear") = Convert.ToInt32(LC_invFinancialYear1.SelectedValue)
	'End Sub
  Protected Sub TreeView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.DataBound
    If HttpContext.Current.User.Identity.IsAuthenticated Then
      Dim oND As TreeNode = New TreeNode
      With oND
        .ImageUrl = "~/App_Themes/Default/Images/signout.ico"
        .Text = "<B>&nbsp;&nbsp;Signout</B>"
        .SelectAction = TreeNodeSelectAction.Select
        .ImageToolTip = "Signout"
        .Value = "SignOut"
        TreeView1.Nodes(0).ChildNodes.Add(oND)
      End With
    End If
  End Sub
	Protected Sub TreeView1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.SelectedNodeChanged
		Dim oTV As TreeView = CType(sender, TreeView)
		If oTV.SelectedValue.ToLower = "signout" Then
			System.Web.Security.FormsAuthentication.SignOut()
			SIS.SYS.Utilities.SessionManager.DestroySessionEnvironement()
			Response.Redirect("~/Default.aspx")
		Else
			SIS.SYS.Utilities.SessionManager.InitNavBar()
		End If
	End Sub
	Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
		Dim mPath As String = Page.ResolveClientUrl("~/App_Themes/Default/Images/menu_0.png")
		Me.lgMenu.Attributes.Add("onmouseout", "this.src='" & mPath & "';")
		Me.lgMenu.Attributes.Add("onmouseover", "this.src='" & mPath.Replace("menu_0.png", "menu_1.png") & "';")
	End Sub
End Class
