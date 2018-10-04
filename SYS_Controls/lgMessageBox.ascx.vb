Partial Class lgMessageBox
	Inherits System.Web.UI.UserControl
	Public Property ServerContainer() As HtmlGenericControl
		Get
			Return serverData
		End Get
		Set(ByVal value As HtmlGenericControl)
			serverData = value
		End Set
	End Property
	Public Sub Show()
		mPopup.Show()
	End Sub
End Class
