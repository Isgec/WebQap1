Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

<ValidationProperty("SelectedValue")> _
Partial Class LC_qapAttachmentStates
  Inherits System.Web.UI.UserControl
  Private _OrderBy As String = String.Empty
  Private _IncludeDefault As Boolean = True
  Private _DefaultText As String = "-- Select --"
  Private _DefaultValue As String = String.Empty
  Public Event SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
  Public ReadOnly Property LCClientID() As String
    Get
      Return DDLqapAttachmentStates.ClientID
    End Get
  End Property
  Public Property AddAttributes() As String
    Get
      Return DDLqapAttachmentStates.Attributes.ToString
    End Get
    Set(ByVal value As String)
			Try
				Dim aVal() As String = value.Split(",".ToCharArray)
				DDLqapAttachmentStates.Attributes.Add(aVal(0), aVal(1))
			Catch ex As Exception
			End Try
    End Set
  End Property
  Public Property CssClass() As String
    Get
      Return DDLqapAttachmentStates.CssClass
    End Get
    Set(ByVal value As String)
      DDLqapAttachmentStates.CssClass = value
    End Set
  End Property
  Public Property Width() As System.Web.UI.WebControls.Unit
    Get
      Return DDLqapAttachmentStates.Width
    End Get
    Set(ByVal value As System.Web.UI.WebControls.Unit)
      DDLqapAttachmentStates.Width = value
    End Set
  End Property
  Public Property RequiredFieldErrorMessage() As String
    Get
      Return RequiredFieldValidatorqapAttachmentStates.Text
    End Get
    Set(ByVal value As String)
      RequiredFieldValidatorqapAttachmentStates.Text = value
    End Set
  End Property
  Public Property ValidationGroup() As String
    Get
      Return RequiredFieldValidatorqapAttachmentStates.ValidationGroup
    End Get
    Set(ByVal value As String)
      RequiredFieldValidatorqapAttachmentStates.ValidationGroup = value
    End Set
  End Property
  Public Property Enabled() As Boolean
    Get
      Return DDLqapAttachmentStates.Enabled
    End Get
    Set(ByVal value As Boolean)
      DDLqapAttachmentStates.Enabled = value
    End Set
  End Property
  Public Property AutoPostBack() As Boolean
    Get
      Return DDLqapAttachmentStates.AutoPostBack
    End Get
    Set(ByVal value As Boolean)
      DDLqapAttachmentStates.AutoPostBack = value
    End Set
  End Property
  Public Property DataTextField() As String
    Get
      Return DDLqapAttachmentStates.DataTextField
    End Get
    Set(ByVal value As String)
      DDLqapAttachmentStates.DataTextField = value
    End Set
  End Property
  Public Property DataValueField() As String
    Get
      Return DDLqapAttachmentStates.DataValueField
    End Get
    Set(ByVal value As String)
      DDLqapAttachmentStates.DataValueField = value
    End Set
  End Property
  Public Property SelectedValue() As String
    Get
      Return DDLqapAttachmentStates.SelectedValue
    End Get
    Set(ByVal value As String)
      If Convert.IsDBNull(value) Then
        DDLqapAttachmentStates.SelectedValue = String.Empty
      Else
        DDLqapAttachmentStates.SelectedValue = value
      End If
    End Set
  End Property
  Public Property OrderBy() As String
    Get
      Return _OrderBy
    End Get
    Set(ByVal value As String)
      _OrderBy = value
    End Set
  End Property
  Public Property IncludeDefault() As Boolean
    Get
      Return _IncludeDefault
    End Get
    Set(ByVal value As Boolean)
      _IncludeDefault = value
    End Set
  End Property
  Public Property DefaultText() As String
    Get
      Return _DefaultText
    End Get
    Set(ByVal value As String)
      _DefaultText = value
    End Set
  End Property
  Public Property DefaultValue() As String
    Get
      Return _DefaultValue
    End Get
    Set(ByVal value As String)
      _DefaultValue = value
    End Set
  End Property
  Protected Sub OdsDdlqapAttachmentStates_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles OdsDdlqapAttachmentStates.Selecting
    e.Arguments.SortExpression = _OrderBy
  End Sub
  Protected Sub DDLqapAttachmentStates_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLqapAttachmentStates.DataBinding
    If _IncludeDefault Then
      DDLqapAttachmentStates.Items.Add(new ListItem(_DefaultText, _DefaultValue))
    End If
  End Sub
  Protected Sub DDLqapAttachmentStates_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLqapAttachmentStates.SelectedIndexChanged
    RaiseEvent SelectedIndexChanged(sender, e)
  End Sub
End Class
