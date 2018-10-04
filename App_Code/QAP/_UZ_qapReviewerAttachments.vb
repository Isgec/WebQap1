Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.QAP
  Partial Public Class qapReviewerAttachments
    Public Shared Function UZ_qapReviewerAttachmentsInsert(ByVal Record As SIS.QAP.qapReviewerAttachments) As SIS.QAP.qapReviewerAttachments
      Dim _Result As SIS.QAP.qapReviewerAttachments = qapReviewerAttachmentsInsert(Record)
      Return _Result
    End Function
    Public Shared Function UZ_qapReviewerAttachmentsUpdate(ByVal Record As SIS.QAP.qapReviewerAttachments) As SIS.QAP.qapReviewerAttachments
      Dim _Result As SIS.QAP.qapReviewerAttachments = qapReviewerAttachmentsUpdate(Record)
      Return _Result
    End Function
    Public Shared Function UZ_qapReviewerAttachmentsDelete(ByVal Record As SIS.QAP.qapReviewerAttachments) As Int32
			Dim _Result As Integer = qapReviewerAttachments.qapAttachmentsDelete(Record)
      Return _Result
    End Function
  End Class
End Namespace
