Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.QAP
  <DataObject()> _
  Partial Public Class qapRequests
    Private Shared _RecordCount As Integer
    Private _RequestNo As Int32 = 0
    Private _DocumentTypeID As String = ""
    Private _QAPRevisionNo As String = ""
    Private _QAPNo As String = ""
    Private _ProjectID As String = ""
    Private _SupplierID As String = ""
    Private _SubSupplier As String = ""
    Private _MainItem As String = ""
    Private _SubItem As String = ""
    Private _ClientApprovalRequired As Boolean = False
    Private _Remarks As String = ""
    Private _CreatedBy As String = ""
    Private _CreatedOn As String = ""
    Private _CreatersDivision As String = ""
    Private _ReviewBy As String = ""
    Private _ReviewOn As String = ""
    Private _ReviewerRemarks As String = ""
    Private _ReviewerDivision As String = ""
    Private _ApproveBy As String = ""
    Private _ApproveOn As String = ""
    Private _ApproverRemarks As String = ""
    Private _ApproverDivision As String = ""
    Private _StatusID As String = ""
    Private _PurposeID As Int32 = 0
    Private _Division As String = ""
    Private _aspnet_Users1_UserFullName As String = ""
    Private _aspnet_Users2_UserFullName As String = ""
    Private _aspnet_Users3_UserFullName As String = ""
    Private _HRM_Divisions4_Description As String = ""
    Private _HRM_Divisions5_Description As String = ""
    Private _HRM_Divisions6_Description As String = ""
    Private _IDM_Projects7_Description As String = ""
    Private _IDM_Vendors8_Description As String = ""
    Private _QAP_DocumentTypes9_DocumentName As String = ""
    Private _QAP_States12_QAPStatus As String = ""
    Private _QAP_Purpose1_PurposeName As String = ""
    Private _FK_QAP_Requests_CreatedBy As SIS.QCM.qcmUsers = Nothing
    Private _FK_QAP_Requests_ReviewBy As SIS.QCM.qcmUsers = Nothing
    Private _FK_QAP_Requests_ApprovedBy As SIS.QCM.qcmUsers = Nothing
    Private _FK_QAP_Requests_ApproverDivision As SIS.QCM.qcmDivisions = Nothing
    Private _FK_QAP_Requests_ReviewerDivision As SIS.QCM.qcmDivisions = Nothing
    Private _FK_QAP_Requests_CreaterDivision As SIS.QCM.qcmDivisions = Nothing
    Private _FK_QAP_Requests_ProjectID As SIS.QCM.qcmProjects = Nothing
    Private _FK_QAP_Requests_SupplierID As SIS.QCM.qcmVendors = Nothing
    Private _FK_QAP_Requests_DocumentTypeID As SIS.QAP.qapDocumentTypes = Nothing
    Private _FK_QAP_Requests_DP As SIS.QAP.qapRequests = Nothing
    Private _FK_QAP_Requests_DPS As SIS.QAP.qapRequests = Nothing
    Private _FK_QAP_Requests_StatusID As SIS.QAP.qapStates = Nothing
    Private _FK_QAP_Requests_PurposeID As SIS.QAP.qapPurpose = Nothing
    Public ReadOnly Property ForeColor() As System.Drawing.Color
      Get
        Dim mRet As System.Drawing.Color = Drawing.Color.Blue
        Try
					mRet = GetColor()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Visible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
					mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Enable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
					mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public Property RequestNo() As Int32
      Get
        Return _RequestNo
      End Get
      Set(ByVal value As Int32)
        _RequestNo = value
      End Set
    End Property
    Public Property DocumentTypeID() As String
      Get
        Return _DocumentTypeID
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _DocumentTypeID = ""
				 Else
					 _DocumentTypeID = value
			   End If
      End Set
    End Property
    Public Property QAPRevisionNo() As String
      Get
        Return _QAPRevisionNo
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _QAPRevisionNo = ""
				 Else
					 _QAPRevisionNo = value
			   End If
      End Set
    End Property
    Public Property QAPNo() As String
      Get
        Return _QAPNo
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _QAPNo = ""
				 Else
					 _QAPNo = value
			   End If
      End Set
    End Property
    Public Property ProjectID() As String
      Get
        Return _ProjectID
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ProjectID = ""
				 Else
					 _ProjectID = value
			   End If
      End Set
    End Property
    Public Property SupplierID() As String
      Get
        Return _SupplierID
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _SupplierID = ""
				 Else
					 _SupplierID = value
			   End If
      End Set
    End Property
    Public Property SubSupplier() As String
      Get
        Return _SubSupplier
      End Get
      Set(ByVal value As String)
        _SubSupplier = value
      End Set
    End Property
    Public Property MainItem() As String
      Get
        Return _MainItem
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _MainItem = ""
				 Else
					 _MainItem = value
			   End If
      End Set
    End Property
    Public Property SubItem() As String
      Get
        Return _SubItem
      End Get
      Set(ByVal value As String)
        _SubItem = value
      End Set
    End Property
    Public Property ClientApprovalRequired() As Boolean
      Get
        Return _ClientApprovalRequired
      End Get
      Set(ByVal value As Boolean)
        _ClientApprovalRequired = value
      End Set
    End Property
    Public Property Remarks() As String
      Get
        Return _Remarks
      End Get
      Set(ByVal value As String)
        _Remarks = value
      End Set
    End Property
    Public Property CreatedBy() As String
      Get
        Return _CreatedBy
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _CreatedBy = ""
				 Else
					 _CreatedBy = value
			   End If
      End Set
    End Property
    Public Property CreatedOn() As String
      Get
        If Not _CreatedOn = String.Empty Then
          Return Convert.ToDateTime(_CreatedOn).ToString("dd/MM/yyyy")
        End If
        Return _CreatedOn
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _CreatedOn = ""
				 Else
					 _CreatedOn = value
			   End If
      End Set
    End Property
    Public Property CreatersDivision() As String
      Get
        Return _CreatersDivision
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _CreatersDivision = ""
				 Else
					 _CreatersDivision = value
			   End If
      End Set
    End Property
    Public Property ReviewBy() As String
      Get
        Return _ReviewBy
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ReviewBy = ""
				 Else
					 _ReviewBy = value
			   End If
      End Set
    End Property
    Public Property ReviewOn() As String
      Get
        If Not _ReviewOn = String.Empty Then
          Return Convert.ToDateTime(_ReviewOn).ToString("dd/MM/yyyy")
        End If
        Return _ReviewOn
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ReviewOn = ""
				 Else
					 _ReviewOn = value
			   End If
      End Set
    End Property
    Public Property ReviewerRemarks() As String
      Get
        Return _ReviewerRemarks
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ReviewerRemarks = ""
				 Else
					 _ReviewerRemarks = value
			   End If
      End Set
    End Property
    Public Property ReviewerDivision() As String
      Get
        Return _ReviewerDivision
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ReviewerDivision = ""
				 Else
					 _ReviewerDivision = value
			   End If
      End Set
    End Property
    Public Property ApproveBy() As String
      Get
        Return _ApproveBy
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ApproveBy = ""
				 Else
					 _ApproveBy = value
			   End If
      End Set
    End Property
    Public Property ApproveOn() As String
      Get
        If Not _ApproveOn = String.Empty Then
          Return Convert.ToDateTime(_ApproveOn).ToString("dd/MM/yyyy")
        End If
        Return _ApproveOn
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ApproveOn = ""
				 Else
					 _ApproveOn = value
			   End If
      End Set
    End Property
    Public Property ApproverRemarks() As String
      Get
        Return _ApproverRemarks
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ApproverRemarks = ""
				 Else
					 _ApproverRemarks = value
			   End If
      End Set
    End Property
    Public Property ApproverDivision() As String
      Get
        Return _ApproverDivision
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _ApproverDivision = ""
				 Else
					 _ApproverDivision = value
			   End If
      End Set
    End Property
    Public Property StatusID() As String
      Get
        Return _StatusID
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _StatusID = ""
				 Else
					 _StatusID = value
			   End If
      End Set
    End Property
    Public Property PurposeID() As Int32
      Get
        Return _PurposeID
      End Get
      Set(ByVal value As Int32)
        _PurposeID = value
      End Set
    End Property
    Public Property Division() As String
      Get
        Return _Division
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _Division = ""
				 Else
					 _Division = value
			   End If
      End Set
    End Property
    Public Property aspnet_Users1_UserFullName() As String
      Get
        Return _aspnet_Users1_UserFullName
      End Get
      Set(ByVal value As String)
        _aspnet_Users1_UserFullName = value
      End Set
    End Property
    Public Property aspnet_Users2_UserFullName() As String
      Get
        Return _aspnet_Users2_UserFullName
      End Get
      Set(ByVal value As String)
        _aspnet_Users2_UserFullName = value
      End Set
    End Property
    Public Property aspnet_Users3_UserFullName() As String
      Get
        Return _aspnet_Users3_UserFullName
      End Get
      Set(ByVal value As String)
        _aspnet_Users3_UserFullName = value
      End Set
    End Property
    Public Property HRM_Divisions4_Description() As String
      Get
        Return _HRM_Divisions4_Description
      End Get
      Set(ByVal value As String)
        _HRM_Divisions4_Description = value
      End Set
    End Property
    Public Property HRM_Divisions5_Description() As String
      Get
        Return _HRM_Divisions5_Description
      End Get
      Set(ByVal value As String)
        _HRM_Divisions5_Description = value
      End Set
    End Property
    Public Property HRM_Divisions6_Description() As String
      Get
        Return _HRM_Divisions6_Description
      End Get
      Set(ByVal value As String)
        _HRM_Divisions6_Description = value
      End Set
    End Property
    Public Property IDM_Projects7_Description() As String
      Get
        Return _IDM_Projects7_Description
      End Get
      Set(ByVal value As String)
        _IDM_Projects7_Description = value
      End Set
    End Property
    Public Property IDM_Vendors8_Description() As String
      Get
        Return _IDM_Vendors8_Description
      End Get
      Set(ByVal value As String)
        _IDM_Vendors8_Description = value
      End Set
    End Property
    Public Property QAP_DocumentTypes9_DocumentName() As String
      Get
        Return _QAP_DocumentTypes9_DocumentName
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _QAP_DocumentTypes9_DocumentName = ""
				 Else
					 _QAP_DocumentTypes9_DocumentName = value
			   End If
      End Set
    End Property
    Public Property QAP_States12_QAPStatus() As String
      Get
        Return _QAP_States12_QAPStatus
      End Get
      Set(ByVal value As String)
				 If Convert.IsDBNull(Value) Then
					 _QAP_States12_QAPStatus = ""
				 Else
					 _QAP_States12_QAPStatus = value
			   End If
      End Set
    End Property
    Public Property QAP_Purpose1_PurposeName() As String
      Get
        Return _QAP_Purpose1_PurposeName
      End Get
      Set(ByVal value As String)
        _QAP_Purpose1_PurposeName = value
      End Set
    End Property
    Public Readonly Property DisplayField() As String
      Get
        Return "" & _QAPNo.ToString.PadRight(50, " ")
      End Get
    End Property
    Public Readonly Property PrimaryKey() As String
      Get
        Return _RequestNo
      End Get
    End Property
    Public Shared Property RecordCount() As Integer
      Get
        Return _RecordCount
      End Get
      Set(ByVal value As Integer)
        _RecordCount = value
      End Set
    End Property
    Public Class PKqapRequests
			Private _RequestNo As Int32 = 0
			Public Property RequestNo() As Int32
				Get
					Return _RequestNo
				End Get
				Set(ByVal value As Int32)
					_RequestNo = value
				End Set
			End Property
    End Class
    Public ReadOnly Property FK_QAP_Requests_CreatedBy() As SIS.QCM.qcmUsers
      Get
        If _FK_QAP_Requests_CreatedBy Is Nothing Then
          _FK_QAP_Requests_CreatedBy = SIS.QCM.qcmUsers.qcmUsersGetByID(_CreatedBy)
        End If
        Return _FK_QAP_Requests_CreatedBy
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_ReviewBy() As SIS.QCM.qcmUsers
      Get
        If _FK_QAP_Requests_ReviewBy Is Nothing Then
          _FK_QAP_Requests_ReviewBy = SIS.QCM.qcmUsers.qcmUsersGetByID(_ReviewBy)
        End If
        Return _FK_QAP_Requests_ReviewBy
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_ApprovedBy() As SIS.QCM.qcmUsers
      Get
        If _FK_QAP_Requests_ApprovedBy Is Nothing Then
          _FK_QAP_Requests_ApprovedBy = SIS.QCM.qcmUsers.qcmUsersGetByID(_ApproveBy)
        End If
        Return _FK_QAP_Requests_ApprovedBy
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_ApproverDivision() As SIS.QCM.qcmDivisions
      Get
        If _FK_QAP_Requests_ApproverDivision Is Nothing Then
          _FK_QAP_Requests_ApproverDivision = SIS.QCM.qcmDivisions.qcmDivisionsGetByID(_ApproverDivision)
        End If
        Return _FK_QAP_Requests_ApproverDivision
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_ReviewerDivision() As SIS.QCM.qcmDivisions
      Get
        If _FK_QAP_Requests_ReviewerDivision Is Nothing Then
          _FK_QAP_Requests_ReviewerDivision = SIS.QCM.qcmDivisions.qcmDivisionsGetByID(_ReviewerDivision)
        End If
        Return _FK_QAP_Requests_ReviewerDivision
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_CreaterDivision() As SIS.QCM.qcmDivisions
      Get
        If _FK_QAP_Requests_CreaterDivision Is Nothing Then
          _FK_QAP_Requests_CreaterDivision = SIS.QCM.qcmDivisions.qcmDivisionsGetByID(_CreatersDivision)
        End If
        Return _FK_QAP_Requests_CreaterDivision
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_ProjectID() As SIS.QCM.qcmProjects
      Get
        If _FK_QAP_Requests_ProjectID Is Nothing Then
          _FK_QAP_Requests_ProjectID = SIS.QCM.qcmProjects.qcmProjectsGetByID(_ProjectID)
        End If
        Return _FK_QAP_Requests_ProjectID
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_SupplierID() As SIS.QCM.qcmVendors
      Get
        If _FK_QAP_Requests_SupplierID Is Nothing Then
          _FK_QAP_Requests_SupplierID = SIS.QCM.qcmVendors.qcmVendorsGetByID(_SupplierID)
        End If
        Return _FK_QAP_Requests_SupplierID
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_DocumentTypeID() As SIS.QAP.qapDocumentTypes
      Get
        If _FK_QAP_Requests_DocumentTypeID Is Nothing Then
          _FK_QAP_Requests_DocumentTypeID = SIS.QAP.qapDocumentTypes.qapDocumentTypesGetByID(_DocumentTypeID)
        End If
        Return _FK_QAP_Requests_DocumentTypeID
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_StatusID() As SIS.QAP.qapStates
      Get
        If _FK_QAP_Requests_StatusID Is Nothing Then
          _FK_QAP_Requests_StatusID = SIS.QAP.qapStates.qapStatesGetByID(_StatusID)
        End If
        Return _FK_QAP_Requests_StatusID
      End Get
    End Property
    Public ReadOnly Property FK_QAP_Requests_PurposeID() As SIS.QAP.qapPurpose
      Get
        If _FK_QAP_Requests_PurposeID Is Nothing Then
          _FK_QAP_Requests_PurposeID = SIS.QAP.qapPurpose.qapPurposeGetByID(_PurposeID)
        End If
        Return _FK_QAP_Requests_PurposeID
      End Get
    End Property
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsSelectList(ByVal OrderBy As String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsGetNewRecord() As SIS.QAP.qapRequests
      Return New SIS.QAP.qapRequests()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsGetByID(ByVal RequestNo As Int32) As SIS.QAP.qapRequests
      Dim Results As SIS.QAP.qapRequests = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@RequestNo",SqlDbType.Int,RequestNo.ToString.Length, RequestNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
					If Reader.Read() Then
						Results = New SIS.QAP.qapRequests(Reader)
					End If
					Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetByDocumentTypeID(ByVal DocumentTypeID As Int32, ByVal OrderBy as String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByDocumentTypeID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@DocumentTypeID",SqlDbType.Int,DocumentTypeID.ToString.Length, DocumentTypeID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetByProjectID(ByVal ProjectID As String, ByVal OrderBy as String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByProjectID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectID",SqlDbType.NVarChar,ProjectID.ToString.Length, ProjectID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetBySupplierID(ByVal SupplierID As String, ByVal OrderBy as String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectBySupplierID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SupplierID",SqlDbType.NVarChar,SupplierID.ToString.Length, SupplierID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetByCreatedBy(ByVal CreatedBy As String, ByVal OrderBy as String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByCreatedBy"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedBy",SqlDbType.NVarChar,CreatedBy.ToString.Length, CreatedBy)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetByCreatersDivision(ByVal CreatersDivision As String, ByVal OrderBy as String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByCreatersDivision"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatersDivision",SqlDbType.NVarChar,CreatersDivision.ToString.Length, CreatersDivision)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetByReviewBy(ByVal ReviewBy As String, ByVal OrderBy as String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByReviewBy"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewBy",SqlDbType.NVarChar,ReviewBy.ToString.Length, ReviewBy)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetByApproveBy(ByVal ApproveBy As String, ByVal OrderBy as String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByApproveBy"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproveBy",SqlDbType.NVarChar,ApproveBy.ToString.Length, ApproveBy)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function GetByStatusID(ByVal StatusID As Int32, ByVal OrderBy as String) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsSelectByStatusID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,StatusID.ToString.Length, StatusID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal DocumentTypeID As Int32, ByVal ProjectID As String, ByVal SupplierID As String, ByVal StatusID As Int32) As List(Of SIS.QAP.qapRequests)
      Dim Results As List(Of SIS.QAP.qapRequests) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          If OrderBy = String.Empty Then OrderBy = "RequestNo DESC"
          Cmd.CommandType = CommandType.StoredProcedure
					If SearchState Then
						Cmd.CommandText = "spqapRequestsSelectListSearch"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
					Else
						Cmd.CommandText = "spqapRequestsSelectListFilteres"
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_DocumentTypeID",SqlDbType.Int,10, IIf(DocumentTypeID = Nothing, 0,DocumentTypeID))
						SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_ProjectID",SqlDbType.NVarChar,6, IIf(ProjectID Is Nothing, String.Empty,ProjectID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_SupplierID", SqlDbType.NVarChar, 9, IIf(SupplierID Is Nothing, String.Empty, SupplierID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_StatusID",SqlDbType.Int,10, IIf(StatusID = Nothing, 0,StatusID))
					End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
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
    Public Shared Function qapRequestsSelectCount(ByVal SearchState As Boolean, ByVal SearchText As String, ByVal DocumentTypeID As Int32, ByVal ProjectID As String, ByVal SupplierID As String, ByVal StatusID As Int32) As Integer
      Return _RecordCount
    End Function
      'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function qapRequestsGetByID(ByVal RequestNo As Int32, ByVal Filter_DocumentTypeID As Int32, ByVal Filter_ProjectID As String, ByVal Filter_SupplierID As String, ByVal Filter_StatusID As Int32) As SIS.QAP.qapRequests
      Return qapRequestsGetByID(RequestNo)
    End Function
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function qapRequestsInsert(ByVal Record As SIS.QAP.qapRequests) As SIS.QAP.qapRequests
      Dim _Rec As SIS.QAP.qapRequests = SIS.QAP.qapRequests.qapRequestsGetNewRecord()
      With _Rec
        .DocumentTypeID = Record.DocumentTypeID
        .QAPRevisionNo = Record.QAPRevisionNo
        .QAPNo = Record.QAPNo
        .ProjectID = Record.ProjectID
        .SupplierID = Record.SupplierID
        .SubSupplier = Record.SubSupplier
        .MainItem = Record.MainItem
        .SubItem = Record.SubItem
        .ClientApprovalRequired = Record.ClientApprovalRequired
        .Remarks = Record.Remarks
        .CreatedBy =  Global.System.Web.HttpContext.Current.Session("LoginID")
        .CreatedOn = Now
        .CreatersDivision = _Rec.FK_QAP_Requests_CreatedBy.C_DivisionID
        .StatusID = States.Free
        .PurposeID = Record.PurposeID
        .Division = Record.Division
      End With
      Return SIS.QAP.qapRequests.InsertData(_Rec)
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.QAP.qapRequests) As SIS.QAP.qapRequests
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@DocumentTypeID",SqlDbType.Int,11, Iif(Record.DocumentTypeID= "" ,Convert.DBNull, Record.DocumentTypeID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@QAPRevisionNo",SqlDbType.NVarChar,51, Iif(Record.QAPRevisionNo= "" ,Convert.DBNull, Record.QAPRevisionNo))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@QAPNo",SqlDbType.NVarChar,51, Iif(Record.QAPNo= "" ,Convert.DBNull, Record.QAPNo))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectID",SqlDbType.NVarChar,7, Iif(Record.ProjectID= "" ,Convert.DBNull, Record.ProjectID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SupplierID", SqlDbType.NVarChar, 9, IIf(Record.SupplierID = "", Convert.DBNull, Record.SupplierID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SubSupplier",SqlDbType.NVarChar,251, Record.SubSupplier)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MainItem",SqlDbType.NVarChar,251, Iif(Record.MainItem= "" ,Convert.DBNull, Record.MainItem))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SubItem",SqlDbType.NVarChar,251, Record.SubItem)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ClientApprovalRequired",SqlDbType.Bit,3, Record.ClientApprovalRequired)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Remarks",SqlDbType.NVarChar,251, Record.Remarks)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedBy",SqlDbType.NVarChar,9, Iif(Record.CreatedBy= "" ,Convert.DBNull, Record.CreatedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedOn",SqlDbType.DateTime,21, Iif(Record.CreatedOn= "" ,Convert.DBNull, Record.CreatedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatersDivision",SqlDbType.NVarChar,7, Iif(Record.CreatersDivision= "" ,Convert.DBNull, Record.CreatersDivision))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewBy",SqlDbType.NVarChar,9, Iif(Record.ReviewBy= "" ,Convert.DBNull, Record.ReviewBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewOn",SqlDbType.DateTime,21, Iif(Record.ReviewOn= "" ,Convert.DBNull, Record.ReviewOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewerRemarks",SqlDbType.NVarChar,251, Iif(Record.ReviewerRemarks= "" ,Convert.DBNull, Record.ReviewerRemarks))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewerDivision",SqlDbType.NVarChar,7, Iif(Record.ReviewerDivision= "" ,Convert.DBNull, Record.ReviewerDivision))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproveBy",SqlDbType.NVarChar,9, Iif(Record.ApproveBy= "" ,Convert.DBNull, Record.ApproveBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproveOn",SqlDbType.DateTime,21, Iif(Record.ApproveOn= "" ,Convert.DBNull, Record.ApproveOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproverRemarks",SqlDbType.NVarChar,251, Iif(Record.ApproverRemarks= "" ,Convert.DBNull, Record.ApproverRemarks))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproverDivision",SqlDbType.NVarChar,7, Iif(Record.ApproverDivision= "" ,Convert.DBNull, Record.ApproverDivision))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,11, Iif(Record.StatusID= "" ,Convert.DBNull, Record.StatusID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@PurposeID",SqlDbType.Int,11, Record.PurposeID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Division",SqlDbType.NVarChar,31, Iif(Record.Division= "" ,Convert.DBNull, Record.Division))
          Cmd.Parameters.Add("@Return_RequestNo", SqlDbType.Int, 11)
          Cmd.Parameters("@Return_RequestNo").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          Record.RequestNo = Cmd.Parameters("@Return_RequestNo").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)> _
    Public Shared Function qapRequestsUpdate(ByVal Record As SIS.QAP.qapRequests) As SIS.QAP.qapRequests
      Dim _Rec As SIS.QAP.qapRequests = SIS.QAP.qapRequests.qapRequestsGetByID(Record.RequestNo)
      With _Rec
        .DocumentTypeID = Record.DocumentTypeID
        .QAPRevisionNo = Record.QAPRevisionNo
        .QAPNo = Record.QAPNo
        .ProjectID = Record.ProjectID
        .SupplierID = Record.SupplierID
        .SubSupplier = Record.SubSupplier
        .MainItem = Record.MainItem
        .SubItem = Record.SubItem
        .ClientApprovalRequired = Record.ClientApprovalRequired
        .Remarks = Record.Remarks
        .CreatedBy = Global.System.Web.HttpContext.Current.Session("LoginID")
        .CreatedOn = Now
        .CreatersDivision = _Rec.FK_QAP_Requests_CreatedBy.C_DivisionID
        .StatusID = Record.StatusID
        .PurposeID = Record.PurposeID
        .Division = Record.Division
      End With
      Return SIS.QAP.qapRequests.UpdateData(_Rec)
    End Function
    Public Shared Function UpdateData(ByVal Record As SIS.QAP.qapRequests) As SIS.QAP.qapRequests
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsUpdate"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_RequestNo",SqlDbType.Int,11, Record.RequestNo)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@DocumentTypeID",SqlDbType.Int,11, Iif(Record.DocumentTypeID= "" ,Convert.DBNull, Record.DocumentTypeID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@QAPRevisionNo",SqlDbType.NVarChar,51, Iif(Record.QAPRevisionNo= "" ,Convert.DBNull, Record.QAPRevisionNo))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@QAPNo",SqlDbType.NVarChar,51, Iif(Record.QAPNo= "" ,Convert.DBNull, Record.QAPNo))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ProjectID",SqlDbType.NVarChar,7, Iif(Record.ProjectID= "" ,Convert.DBNull, Record.ProjectID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SupplierID", SqlDbType.NVarChar, 9, IIf(Record.SupplierID = "", Convert.DBNull, Record.SupplierID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SubSupplier",SqlDbType.NVarChar,251, Record.SubSupplier)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MainItem",SqlDbType.NVarChar,251, Iif(Record.MainItem= "" ,Convert.DBNull, Record.MainItem))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SubItem",SqlDbType.NVarChar,251, Record.SubItem)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ClientApprovalRequired",SqlDbType.Bit,3, Record.ClientApprovalRequired)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Remarks",SqlDbType.NVarChar,251, Record.Remarks)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedBy",SqlDbType.NVarChar,9, Iif(Record.CreatedBy= "" ,Convert.DBNull, Record.CreatedBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatedOn",SqlDbType.DateTime,21, Iif(Record.CreatedOn= "" ,Convert.DBNull, Record.CreatedOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@CreatersDivision",SqlDbType.NVarChar,7, Iif(Record.CreatersDivision= "" ,Convert.DBNull, Record.CreatersDivision))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewBy",SqlDbType.NVarChar,9, Iif(Record.ReviewBy= "" ,Convert.DBNull, Record.ReviewBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewOn",SqlDbType.DateTime,21, Iif(Record.ReviewOn= "" ,Convert.DBNull, Record.ReviewOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewerRemarks",SqlDbType.NVarChar,251, Iif(Record.ReviewerRemarks= "" ,Convert.DBNull, Record.ReviewerRemarks))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ReviewerDivision",SqlDbType.NVarChar,7, Iif(Record.ReviewerDivision= "" ,Convert.DBNull, Record.ReviewerDivision))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproveBy",SqlDbType.NVarChar,9, Iif(Record.ApproveBy= "" ,Convert.DBNull, Record.ApproveBy))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproveOn",SqlDbType.DateTime,21, Iif(Record.ApproveOn= "" ,Convert.DBNull, Record.ApproveOn))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproverRemarks",SqlDbType.NVarChar,251, Iif(Record.ApproverRemarks= "" ,Convert.DBNull, Record.ApproverRemarks))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ApproverDivision",SqlDbType.NVarChar,7, Iif(Record.ApproverDivision= "" ,Convert.DBNull, Record.ApproverDivision))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StatusID",SqlDbType.Int,11, Iif(Record.StatusID= "" ,Convert.DBNull, Record.StatusID))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@PurposeID",SqlDbType.Int,11, Record.PurposeID)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Division",SqlDbType.NVarChar,31, Iif(Record.Division= "" ,Convert.DBNull, Record.Division))
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Delete, True)> _
    Public Shared Function qapRequestsDelete(ByVal Record As SIS.QAP.qapRequests) As Int32
      Dim _Result as Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spqapRequestsDelete"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_RequestNo",SqlDbType.Int,Record.RequestNo.ToString.Length, Record.RequestNo)
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return _RecordCount
    End Function
'		Autocomplete Method
		Public Shared Function SelectqapRequestsAutoCompleteList(ByVal Prefix As String, ByVal count As Integer, ByVal contextKey As String) As String()
			Dim Results As List(Of String) = Nothing
      Dim aVal() As String = contextKey.Split("|".ToCharArray)
			Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
				Using Cmd As SqlCommand = Con.CreateCommand()
					Cmd.CommandType = CommandType.StoredProcedure
					Cmd.CommandText = "spqapRequestsAutoCompleteList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@prefix", SqlDbType.NVarChar, 50, Prefix)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@records", SqlDbType.Int, -1, count)
					SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@bycode", SqlDbType.Int, 1, IIf(IsNumeric(Prefix), 0, 1))
					Results = New List(Of String)()
					Con.Open()
					Dim Reader As SqlDataReader = Cmd.ExecuteReader()
					If Not Reader.HasRows Then
					  Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem("---Select Value---".PadRight(50, " "),""))
					End If
					While (Reader.Read())
            Dim Tmp As SIS.QAP.qapRequests = New SIS.QAP.qapRequests(Reader)
					  Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Tmp.DisplayField, Tmp.PrimaryKey))
					End While
					Reader.Close()
				End Using
			End Using
			Return Results.ToArray
		End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      On Error Resume Next
      _RequestNo = Ctype(Reader("RequestNo"),Int32)
      If Convert.IsDBNull(Reader("DocumentTypeID")) Then
        _DocumentTypeID = String.Empty
      Else
        _DocumentTypeID = Ctype(Reader("DocumentTypeID"), String)
      End If
      If Convert.IsDBNull(Reader("QAPRevisionNo")) Then
        _QAPRevisionNo = String.Empty
      Else
        _QAPRevisionNo = Ctype(Reader("QAPRevisionNo"), String)
      End If
      If Convert.IsDBNull(Reader("QAPNo")) Then
        _QAPNo = String.Empty
      Else
        _QAPNo = Ctype(Reader("QAPNo"), String)
      End If
      If Convert.IsDBNull(Reader("ProjectID")) Then
        _ProjectID = String.Empty
      Else
        _ProjectID = Ctype(Reader("ProjectID"), String)
      End If
      If Convert.IsDBNull(Reader("SupplierID")) Then
        _SupplierID = String.Empty
      Else
        _SupplierID = Ctype(Reader("SupplierID"), String)
      End If
      _SubSupplier = Ctype(Reader("SubSupplier"),String)
      If Convert.IsDBNull(Reader("MainItem")) Then
        _MainItem = String.Empty
      Else
        _MainItem = Ctype(Reader("MainItem"), String)
      End If
      _SubItem = Ctype(Reader("SubItem"),String)
      _ClientApprovalRequired = Ctype(Reader("ClientApprovalRequired"),Boolean)
      _Remarks = Ctype(Reader("Remarks"),String)
      If Convert.IsDBNull(Reader("CreatedBy")) Then
        _CreatedBy = String.Empty
      Else
        _CreatedBy = Ctype(Reader("CreatedBy"), String)
      End If
      If Convert.IsDBNull(Reader("CreatedOn")) Then
        _CreatedOn = String.Empty
      Else
        _CreatedOn = Ctype(Reader("CreatedOn"), String)
      End If
      If Convert.IsDBNull(Reader("CreatersDivision")) Then
        _CreatersDivision = String.Empty
      Else
        _CreatersDivision = Ctype(Reader("CreatersDivision"), String)
      End If
      If Convert.IsDBNull(Reader("ReviewBy")) Then
        _ReviewBy = String.Empty
      Else
        _ReviewBy = Ctype(Reader("ReviewBy"), String)
      End If
      If Convert.IsDBNull(Reader("ReviewOn")) Then
        _ReviewOn = String.Empty
      Else
        _ReviewOn = Ctype(Reader("ReviewOn"), String)
      End If
      If Convert.IsDBNull(Reader("ReviewerRemarks")) Then
        _ReviewerRemarks = String.Empty
      Else
        _ReviewerRemarks = Ctype(Reader("ReviewerRemarks"), String)
      End If
      If Convert.IsDBNull(Reader("ReviewerDivision")) Then
        _ReviewerDivision = String.Empty
      Else
        _ReviewerDivision = Ctype(Reader("ReviewerDivision"), String)
      End If
      If Convert.IsDBNull(Reader("ApproveBy")) Then
        _ApproveBy = String.Empty
      Else
        _ApproveBy = Ctype(Reader("ApproveBy"), String)
      End If
      If Convert.IsDBNull(Reader("ApproveOn")) Then
        _ApproveOn = String.Empty
      Else
        _ApproveOn = Ctype(Reader("ApproveOn"), String)
      End If
      If Convert.IsDBNull(Reader("ApproverRemarks")) Then
        _ApproverRemarks = String.Empty
      Else
        _ApproverRemarks = Ctype(Reader("ApproverRemarks"), String)
      End If
      If Convert.IsDBNull(Reader("ApproverDivision")) Then
        _ApproverDivision = String.Empty
      Else
        _ApproverDivision = Ctype(Reader("ApproverDivision"), String)
      End If
      If Convert.IsDBNull(Reader("StatusID")) Then
        _StatusID = String.Empty
      Else
        _StatusID = Ctype(Reader("StatusID"), String)
      End If
      _PurposeID = Ctype(Reader("PurposeID"),Int32)
      If Convert.IsDBNull(Reader("Division")) Then
        _Division = String.Empty
      Else
        _Division = Ctype(Reader("Division"), String)
      End If
      _aspnet_Users1_UserFullName = Ctype(Reader("aspnet_Users1_UserFullName"),String)
      _aspnet_Users2_UserFullName = Ctype(Reader("aspnet_Users2_UserFullName"),String)
      _aspnet_Users3_UserFullName = Ctype(Reader("aspnet_Users3_UserFullName"),String)
      _HRM_Divisions4_Description = Ctype(Reader("HRM_Divisions4_Description"),String)
      _HRM_Divisions5_Description = Ctype(Reader("HRM_Divisions5_Description"),String)
      _HRM_Divisions6_Description = Ctype(Reader("HRM_Divisions6_Description"),String)
      _IDM_Projects7_Description = Ctype(Reader("IDM_Projects7_Description"),String)
      _IDM_Vendors8_Description = Ctype(Reader("IDM_Vendors8_Description"),String)
      If Convert.IsDBNull(Reader("QAP_DocumentTypes9_DocumentName")) Then
        _QAP_DocumentTypes9_DocumentName = String.Empty
      Else
        _QAP_DocumentTypes9_DocumentName = Ctype(Reader("QAP_DocumentTypes9_DocumentName"), String)
      End If
      If Convert.IsDBNull(Reader("QAP_States12_QAPStatus")) Then
        _QAP_States12_QAPStatus = String.Empty
      Else
        _QAP_States12_QAPStatus = Ctype(Reader("QAP_States12_QAPStatus"), String)
      End If
      _QAP_Purpose1_PurposeName = Ctype(Reader("QAP_Purpose1_PurposeName"),String)
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace
