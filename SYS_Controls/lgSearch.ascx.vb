
Partial Class lgSearch
	Inherits System.Web.UI.UserControl
	Public Event SearchClicked(ByVal SearchText As String, ByVal SearchState As Boolean)
	Private _EmbededInGrid As String
	Public Property EmbededInGrid() As String
		Get
			Return _EmbededInGrid
		End Get
		Set(ByVal value As String)
			_EmbededInGrid = value
		End Set
	End Property
	Public Property SearchState() As Boolean
		Get
			Return lg_End.Checked
		End Get
		Set(ByVal value As Boolean)
			lg_End.Checked = value
		End Set
	End Property
	Protected Sub lg_End_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lg_End.CheckedChanged
		lg_End.Enabled = False
		lg_End.Checked = False
		DoSearch(lg_Search.Text, True)
	End Sub
	Protected Sub lg_cmdSearch_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles lg_cmdSearch.Click
		If Not lg_Search.Text = String.Empty Then
			lg_End.Enabled = True
			lg_End.Checked = True
			DoSearch(lg_Search.Text, True)
		End If
	End Sub
	Private Sub DoSearch(ByVal SearchText As String, ByVal SearchState As Boolean)
		Dim I As Integer = 0
		Try
			Dim eGrid As GridView = Nothing
			Dim _ctl As WebControl = Me.Parent
			Do While _ctl.ID <> _EmbededInGrid
				_ctl = _ctl.Parent
				I += 1
				If I > 100 Then
					Exit Do
				End If
			Loop
			eGrid = _ctl
			eGrid.PageIndex = 0
			Dim oDS As ObjectDataSource = eGrid.Parent.FindControl(eGrid.DataSourceID)
			oDS.SelectParameters("SearchState").DefaultValue = SearchState
			oDS.SelectParameters("SearchText").DefaultValue = SearchText
		Catch ex As Exception
		End Try
		RaiseEvent SearchClicked(lg_Search.Text, True)
	End Sub
End Class
