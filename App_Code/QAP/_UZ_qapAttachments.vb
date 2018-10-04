Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.QAP
  Partial Public Class qapAttachments
		Public Function GetColor() As System.Drawing.Color
			Dim mRet As System.Drawing.Color = Drawing.Color.Blue
			If _StatusID = 4 Then
				mRet = Drawing.Color.BurlyWood
			End If
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
		Public ReadOnly Property GetLink() As String
			Get
				Return "javascript:window.open('" & HttpContext.Current.Request.Url.Scheme & Uri.SchemeDelimiter & HttpContext.Current.Request.Url.Authority & HttpContext.Current.Request.ApplicationPath & "/QAP_Main/App_Downloads/filedownload.aspx?req=" & _RequestNo & "|" & _SerialNo & "', 'win" & _SerialNo & "', 'left=20,top=20,width=100,height=100,toolbar=1,resizable=1,scrollbars=1'); return false;"
			End Get
		End Property
    Public Shared Function UZ_qapAttachmentsUpdate(ByVal Record As SIS.QAP.qapAttachments) As SIS.QAP.qapAttachments
      Dim _Result As SIS.QAP.qapAttachments = qapAttachmentsUpdate(Record)
      Return _Result
    End Function
    Public Shared Function UZ_qapAttachmentsDelete(ByVal Record As SIS.QAP.qapAttachments) As Integer
			Dim _Result As Integer = qapAttachmentsDelete(Record)
			If IO.File.Exists(Record.DiskFile) Then
				Try
					IO.File.Delete(Record.DiskFile)
				Catch ex As Exception
				End Try
			End If
      Return _Result
    End Function
  End Class
End Namespace
