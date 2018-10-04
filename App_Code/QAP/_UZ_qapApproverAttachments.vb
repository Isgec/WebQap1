Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.QAP
  Partial Public Class qapApproverAttachments
    Public Shared Function UZ_qapApproverAttachmentsInsert(ByVal Record As SIS.QAP.qapApproverAttachments) As SIS.QAP.qapApproverAttachments
      Dim _Result As SIS.QAP.qapApproverAttachments = qapApproverAttachmentsInsert(Record)
      Return _Result
    End Function
    Public Shared Function UZ_qapApproverAttachmentsUpdate(ByVal Record As SIS.QAP.qapApproverAttachments) As SIS.QAP.qapApproverAttachments
      Dim _Result As SIS.QAP.qapApproverAttachments = qapApproverAttachmentsUpdate(Record)
      Return _Result
    End Function
    Public Shared Function UZ_qapApproverAttachmentsDelete(ByVal Record As SIS.QAP.qapApproverAttachments) As Int32
			Dim _Result As Integer = qapAttachments.qapAttachmentsDelete(Record)
      Return _Result
    End Function
  End Class
End Namespace
