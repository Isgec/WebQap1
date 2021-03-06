USE [IJTPerks]
GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsAutoCompleteList]    Script Date: 03/29/2016 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spqapRequestsAutoCompleteList]
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL = @LGSQL + ' [QAP_Requests].[QAPNo]' 
  SET @LGSQL = @LGSQL + ',[QAP_Requests].[RequestNo]' 
  SET @LGSQL = @LGSQL + ' FROM [QAP_Requests] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([QAP_Requests].[RequestNo],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([QAP_Requests].[QAPNo],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END

GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsDelete]    Script Date: 03/29/2016 16:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsDelete]
  @Original_RequestNo Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QAP_Requests]
  WHERE
  [QAP_Requests].[RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsInsert]    Script Date: 03/29/2016 16:01:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsInsert]
  @DocumentTypeID Int,
  @QAPRevisionNo NVarChar(50),
  @QAPNo NVarChar(50),
  @ProjectID NVarChar(6),
  @SupplierID NVarChar(6),
  @SubSupplier NVarChar(250),
  @MainItem NVarChar(250),
  @SubItem NVarChar(250),
  @ClientApprovalRequired Bit,
  @Remarks NVarChar(250),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @CreatersDivision NVarChar(6),
  @ReviewBy NVarChar(8),
  @ReviewOn DateTime,
  @ReviewerRemarks NVarChar(250),
  @ReviewerDivision NVarChar(6),
  @ApproveBy NVarChar(8),
  @ApproveOn DateTime,
  @ApproverRemarks NVarChar(250),
  @ApproverDivision NVarChar(6),
  @StatusID Int,
  @PurposeID Int,
  @Return_RequestNo Int = null OUTPUT 
  AS
  INSERT [QAP_Requests]
  (
   [DocumentTypeID]
  ,[QAPRevisionNo]
  ,[QAPNo]
  ,[ProjectID]
  ,[SupplierID]
  ,[SubSupplier]
  ,[MainItem]
  ,[SubItem]
  ,[ClientApprovalRequired]
  ,[Remarks]
  ,[CreatedBy]
  ,[CreatedOn]
  ,[CreatersDivision]
  ,[ReviewBy]
  ,[ReviewOn]
  ,[ReviewerRemarks]
  ,[ReviewerDivision]
  ,[ApproveBy]
  ,[ApproveOn]
  ,[ApproverRemarks]
  ,[ApproverDivision]
  ,[StatusID]
  ,[PurposeID]
  )
  VALUES
  (
   @DocumentTypeID
  ,@QAPRevisionNo
  ,@QAPNo
  ,@ProjectID
  ,@SupplierID
  ,@SubSupplier
  ,@MainItem
  ,@SubItem
  ,@ClientApprovalRequired
  ,@Remarks
  ,@CreatedBy
  ,@CreatedOn
  ,@CreatersDivision
  ,@ReviewBy
  ,@ReviewOn
  ,@ReviewerRemarks
  ,@ReviewerDivision
  ,@ApproveBy
  ,@ApproveOn
  ,@ApproverRemarks
  ,@ApproverDivision
  ,@StatusID
  ,@PurposeID
  )
  SET @Return_RequestNo = Scope_Identity()


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectByApproveBy]    Script Date: 03/29/2016 16:01:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectByApproveBy]
  @ApproveBy NVarChar(8),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[ApproveBy] = @ApproveBy
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectByCreatedBy]    Script Date: 03/29/2016 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectByCreatedBy]
  @CreatedBy NVarChar(8),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[CreatedBy] = @CreatedBy
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectByCreatersDivision]    Script Date: 03/29/2016 16:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectByCreatersDivision]
  @CreatersDivision NVarChar(6),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[CreatersDivision] = @CreatersDivision
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectByDocumentTypeID]    Script Date: 03/29/2016 16:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectByDocumentTypeID]
  @DocumentTypeID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[DocumentTypeID] = @DocumentTypeID
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectByID]    Script Date: 03/29/2016 16:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectByID]
  @LoginID NVarChar(8),
  @RequestNo Int 
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[RequestNo] = @RequestNo


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectByProjectID]    Script Date: 03/29/2016 16:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectByProjectID]
  @ProjectID NVarChar(6),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[ProjectID] = @ProjectID
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectByReviewBy]    Script Date: 03/29/2016 16:01:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectByReviewBy]
  @ReviewBy NVarChar(8),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[ReviewBy] = @ReviewBy
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectByStatusID]    Script Date: 03/29/2016 16:01:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectByStatusID]
  @StatusID Int,
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[StatusID] = @StatusID
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectBySupplierID]    Script Date: 03/29/2016 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectBySupplierID]
  @SupplierID NVarChar(6),
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
  [QAP_Requests].[SupplierID] = @SupplierID
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectList]    Script Date: 03/29/2016 16:01:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectListFilteres]    Script Date: 03/29/2016 16:01:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectListFilteres]
  @Filter_DocumentTypeID Int,
  @Filter_ProjectID NVarChar(6),
  @Filter_SupplierID NVarChar(6),
  @Filter_StatusID Int,
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestNo Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'RequestNo'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QAP_Requests].[RequestNo]'
  SET @LGSQL = @LGSQL + ' FROM [QAP_Requests] '
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]'
  SET @LGSQL = @LGSQL + '  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]'
  SET @LGSQL = @LGSQL + '  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]'
  SET @LGSQL = @LGSQL + '    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]'
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  IF (@Filter_DocumentTypeID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[DocumentTypeID] = ' + STR(@Filter_DocumentTypeID)
  IF (@Filter_ProjectID > '') 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[ProjectID] = ''' + @Filter_ProjectID + ''''
  IF (@Filter_SupplierID > '') 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[SupplierID] = ''' + @Filter_SupplierID + ''''
  IF (@Filter_StatusID > 0) 
    SET @LGSQL = @LGSQL + ' AND [QAP_Requests].[StatusID] = ' + STR(@Filter_StatusID)
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'RequestNo' THEN '[QAP_Requests].[RequestNo]'
                        WHEN 'RequestNo DESC' THEN '[QAP_Requests].[RequestNo] DESC'
                        WHEN 'DocumentTypeID' THEN '[QAP_Requests].[DocumentTypeID]'
                        WHEN 'DocumentTypeID DESC' THEN '[QAP_Requests].[DocumentTypeID] DESC'
                        WHEN 'QAPRevisionNo' THEN '[QAP_Requests].[QAPRevisionNo]'
                        WHEN 'QAPRevisionNo DESC' THEN '[QAP_Requests].[QAPRevisionNo] DESC'
                        WHEN 'QAPNo' THEN '[QAP_Requests].[QAPNo]'
                        WHEN 'QAPNo DESC' THEN '[QAP_Requests].[QAPNo] DESC'
                        WHEN 'ProjectID' THEN '[QAP_Requests].[ProjectID]'
                        WHEN 'ProjectID DESC' THEN '[QAP_Requests].[ProjectID] DESC'
                        WHEN 'SupplierID' THEN '[QAP_Requests].[SupplierID]'
                        WHEN 'SupplierID DESC' THEN '[QAP_Requests].[SupplierID] DESC'
                        WHEN 'SubSupplier' THEN '[QAP_Requests].[SubSupplier]'
                        WHEN 'SubSupplier DESC' THEN '[QAP_Requests].[SubSupplier] DESC'
                        WHEN 'MainItem' THEN '[QAP_Requests].[MainItem]'
                        WHEN 'MainItem DESC' THEN '[QAP_Requests].[MainItem] DESC'
                        WHEN 'SubItem' THEN '[QAP_Requests].[SubItem]'
                        WHEN 'SubItem DESC' THEN '[QAP_Requests].[SubItem] DESC'
                        WHEN 'ClientApprovalRequired' THEN '[QAP_Requests].[ClientApprovalRequired]'
                        WHEN 'ClientApprovalRequired DESC' THEN '[QAP_Requests].[ClientApprovalRequired] DESC'
                        WHEN 'Remarks' THEN '[QAP_Requests].[Remarks]'
                        WHEN 'Remarks DESC' THEN '[QAP_Requests].[Remarks] DESC'
                        WHEN 'CreatedBy' THEN '[QAP_Requests].[CreatedBy]'
                        WHEN 'CreatedBy DESC' THEN '[QAP_Requests].[CreatedBy] DESC'
                        WHEN 'CreatedOn' THEN '[QAP_Requests].[CreatedOn]'
                        WHEN 'CreatedOn DESC' THEN '[QAP_Requests].[CreatedOn] DESC'
                        WHEN 'CreatersDivision' THEN '[QAP_Requests].[CreatersDivision]'
                        WHEN 'CreatersDivision DESC' THEN '[QAP_Requests].[CreatersDivision] DESC'
                        WHEN 'ReviewBy' THEN '[QAP_Requests].[ReviewBy]'
                        WHEN 'ReviewBy DESC' THEN '[QAP_Requests].[ReviewBy] DESC'
                        WHEN 'ReviewOn' THEN '[QAP_Requests].[ReviewOn]'
                        WHEN 'ReviewOn DESC' THEN '[QAP_Requests].[ReviewOn] DESC'
                        WHEN 'ReviewerRemarks' THEN '[QAP_Requests].[ReviewerRemarks]'
                        WHEN 'ReviewerRemarks DESC' THEN '[QAP_Requests].[ReviewerRemarks] DESC'
                        WHEN 'ReviewerDivision' THEN '[QAP_Requests].[ReviewerDivision]'
                        WHEN 'ReviewerDivision DESC' THEN '[QAP_Requests].[ReviewerDivision] DESC'
                        WHEN 'ApproveBy' THEN '[QAP_Requests].[ApproveBy]'
                        WHEN 'ApproveBy DESC' THEN '[QAP_Requests].[ApproveBy] DESC'
                        WHEN 'ApproveOn' THEN '[QAP_Requests].[ApproveOn]'
                        WHEN 'ApproveOn DESC' THEN '[QAP_Requests].[ApproveOn] DESC'
                        WHEN 'ApproverRemarks' THEN '[QAP_Requests].[ApproverRemarks]'
                        WHEN 'ApproverRemarks DESC' THEN '[QAP_Requests].[ApproverRemarks] DESC'
                        WHEN 'ApproverDivision' THEN '[QAP_Requests].[ApproverDivision]'
                        WHEN 'ApproverDivision DESC' THEN '[QAP_Requests].[ApproverDivision] DESC'
                        WHEN 'StatusID' THEN '[QAP_Requests].[StatusID]'
                        WHEN 'StatusID DESC' THEN '[QAP_Requests].[StatusID] DESC'
                        WHEN 'PurposeID' THEN '[QAP_Requests].[PurposeID]'
                        WHEN 'PurposeID DESC' THEN '[QAP_Requests].[PurposeID] DESC'
                        WHEN 'aspnet_Users1_UserFullName' THEN '[aspnet_Users1].[UserFullName]'
                        WHEN 'aspnet_Users1_UserFullName DESC' THEN '[aspnet_Users1].[UserFullName] DESC'
                        WHEN 'aspnet_Users2_UserFullName' THEN '[aspnet_Users2].[UserFullName]'
                        WHEN 'aspnet_Users2_UserFullName DESC' THEN '[aspnet_Users2].[UserFullName] DESC'
                        WHEN 'aspnet_Users3_UserFullName' THEN '[aspnet_Users3].[UserFullName]'
                        WHEN 'aspnet_Users3_UserFullName DESC' THEN '[aspnet_Users3].[UserFullName] DESC'
                        WHEN 'HRM_Divisions4_Description' THEN '[HRM_Divisions4].[Description]'
                        WHEN 'HRM_Divisions4_Description DESC' THEN '[HRM_Divisions4].[Description] DESC'
                        WHEN 'HRM_Divisions5_Description' THEN '[HRM_Divisions5].[Description]'
                        WHEN 'HRM_Divisions5_Description DESC' THEN '[HRM_Divisions5].[Description] DESC'
                        WHEN 'HRM_Divisions6_Description' THEN '[HRM_Divisions6].[Description]'
                        WHEN 'HRM_Divisions6_Description DESC' THEN '[HRM_Divisions6].[Description] DESC'
                        WHEN 'IDM_Projects7_Description' THEN '[IDM_Projects7].[Description]'
                        WHEN 'IDM_Projects7_Description DESC' THEN '[IDM_Projects7].[Description] DESC'
                        WHEN 'IDM_Vendors8_Description' THEN '[IDM_Vendors8].[Description]'
                        WHEN 'IDM_Vendors8_Description DESC' THEN '[IDM_Vendors8].[Description] DESC'
                        WHEN 'QAP_DocumentTypes9_DocumentName' THEN '[QAP_DocumentTypes9].[DocumentName]'
                        WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN '[QAP_DocumentTypes9].[DocumentName] DESC'
                        WHEN 'QAP_States12_QAPStatus' THEN '[QAP_States12].[QAPStatus]'
                        WHEN 'QAP_States12_QAPStatus DESC' THEN '[QAP_States12].[QAPStatus] DESC'
                        WHEN 'QAP_Purpose1_PurposeName' THEN '[QAP_Purpose1].[PurposeName]'
                        WHEN 'QAP_Purpose1_PurposeName DESC' THEN '[QAP_Purpose1].[PurposeName] DESC'
                        ELSE '[QAP_Requests].[RequestNo]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
    	INNER JOIN #PageIndex
          ON [QAP_Requests].[RequestNo] = #PageIndex.RequestNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsSelectListSearch]    Script Date: 03/29/2016 16:01:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,RequestNo Int NOT NULL
  )
  INSERT INTO #PageIndex (RequestNo)
  SELECT [QAP_Requests].[RequestNo] FROM [QAP_Requests]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
 WHERE  
   ( 
         STR(ISNULL([QAP_Requests].[RequestNo], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QAP_Requests].[DocumentTypeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[QAPRevisionNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[QAPNo],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[ProjectID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[SupplierID],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[SubSupplier],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[MainItem],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[SubItem],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[Remarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[CreatedBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[CreatersDivision],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[ReviewBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[ReviewerRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[ReviewerDivision],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[ApproveBy],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[ApproverRemarks],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Requests].[ApproverDivision],'')) LIKE @KeyWord1
     OR STR(ISNULL([QAP_Requests].[StatusID], 0)) LIKE @KeyWord1
     OR STR(ISNULL([QAP_Requests].[PurposeID], 0)) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'RequestNo' THEN [QAP_Requests].[RequestNo] END,
     CASE @OrderBy WHEN 'RequestNo DESC' THEN [QAP_Requests].[RequestNo] END DESC,
     CASE @OrderBy WHEN 'DocumentTypeID' THEN [QAP_Requests].[DocumentTypeID] END,
     CASE @OrderBy WHEN 'DocumentTypeID DESC' THEN [QAP_Requests].[DocumentTypeID] END DESC,
     CASE @OrderBy WHEN 'QAPRevisionNo' THEN [QAP_Requests].[QAPRevisionNo] END,
     CASE @OrderBy WHEN 'QAPRevisionNo DESC' THEN [QAP_Requests].[QAPRevisionNo] END DESC,
     CASE @OrderBy WHEN 'QAPNo' THEN [QAP_Requests].[QAPNo] END,
     CASE @OrderBy WHEN 'QAPNo DESC' THEN [QAP_Requests].[QAPNo] END DESC,
     CASE @OrderBy WHEN 'ProjectID' THEN [QAP_Requests].[ProjectID] END,
     CASE @OrderBy WHEN 'ProjectID DESC' THEN [QAP_Requests].[ProjectID] END DESC,
     CASE @OrderBy WHEN 'SupplierID' THEN [QAP_Requests].[SupplierID] END,
     CASE @OrderBy WHEN 'SupplierID DESC' THEN [QAP_Requests].[SupplierID] END DESC,
     CASE @OrderBy WHEN 'SubSupplier' THEN [QAP_Requests].[SubSupplier] END,
     CASE @OrderBy WHEN 'SubSupplier DESC' THEN [QAP_Requests].[SubSupplier] END DESC,
     CASE @OrderBy WHEN 'MainItem' THEN [QAP_Requests].[MainItem] END,
     CASE @OrderBy WHEN 'MainItem DESC' THEN [QAP_Requests].[MainItem] END DESC,
     CASE @OrderBy WHEN 'SubItem' THEN [QAP_Requests].[SubItem] END,
     CASE @OrderBy WHEN 'SubItem DESC' THEN [QAP_Requests].[SubItem] END DESC,
     CASE @OrderBy WHEN 'ClientApprovalRequired' THEN [QAP_Requests].[ClientApprovalRequired] END,
     CASE @OrderBy WHEN 'ClientApprovalRequired DESC' THEN [QAP_Requests].[ClientApprovalRequired] END DESC,
     CASE @OrderBy WHEN 'Remarks' THEN [QAP_Requests].[Remarks] END,
     CASE @OrderBy WHEN 'Remarks DESC' THEN [QAP_Requests].[Remarks] END DESC,
     CASE @OrderBy WHEN 'CreatedBy' THEN [QAP_Requests].[CreatedBy] END,
     CASE @OrderBy WHEN 'CreatedBy DESC' THEN [QAP_Requests].[CreatedBy] END DESC,
     CASE @OrderBy WHEN 'CreatedOn' THEN [QAP_Requests].[CreatedOn] END,
     CASE @OrderBy WHEN 'CreatedOn DESC' THEN [QAP_Requests].[CreatedOn] END DESC,
     CASE @OrderBy WHEN 'CreatersDivision' THEN [QAP_Requests].[CreatersDivision] END,
     CASE @OrderBy WHEN 'CreatersDivision DESC' THEN [QAP_Requests].[CreatersDivision] END DESC,
     CASE @OrderBy WHEN 'ReviewBy' THEN [QAP_Requests].[ReviewBy] END,
     CASE @OrderBy WHEN 'ReviewBy DESC' THEN [QAP_Requests].[ReviewBy] END DESC,
     CASE @OrderBy WHEN 'ReviewOn' THEN [QAP_Requests].[ReviewOn] END,
     CASE @OrderBy WHEN 'ReviewOn DESC' THEN [QAP_Requests].[ReviewOn] END DESC,
     CASE @OrderBy WHEN 'ReviewerRemarks' THEN [QAP_Requests].[ReviewerRemarks] END,
     CASE @OrderBy WHEN 'ReviewerRemarks DESC' THEN [QAP_Requests].[ReviewerRemarks] END DESC,
     CASE @OrderBy WHEN 'ReviewerDivision' THEN [QAP_Requests].[ReviewerDivision] END,
     CASE @OrderBy WHEN 'ReviewerDivision DESC' THEN [QAP_Requests].[ReviewerDivision] END DESC,
     CASE @OrderBy WHEN 'ApproveBy' THEN [QAP_Requests].[ApproveBy] END,
     CASE @OrderBy WHEN 'ApproveBy DESC' THEN [QAP_Requests].[ApproveBy] END DESC,
     CASE @OrderBy WHEN 'ApproveOn' THEN [QAP_Requests].[ApproveOn] END,
     CASE @OrderBy WHEN 'ApproveOn DESC' THEN [QAP_Requests].[ApproveOn] END DESC,
     CASE @OrderBy WHEN 'ApproverRemarks' THEN [QAP_Requests].[ApproverRemarks] END,
     CASE @OrderBy WHEN 'ApproverRemarks DESC' THEN [QAP_Requests].[ApproverRemarks] END DESC,
     CASE @OrderBy WHEN 'ApproverDivision' THEN [QAP_Requests].[ApproverDivision] END,
     CASE @OrderBy WHEN 'ApproverDivision DESC' THEN [QAP_Requests].[ApproverDivision] END DESC,
     CASE @OrderBy WHEN 'StatusID' THEN [QAP_Requests].[StatusID] END,
     CASE @OrderBy WHEN 'StatusID DESC' THEN [QAP_Requests].[StatusID] END DESC,
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Requests].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Requests].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName' THEN [aspnet_Users1].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users1_UserFullName DESC' THEN [aspnet_Users1].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName' THEN [aspnet_Users2].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users2_UserFullName DESC' THEN [aspnet_Users2].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName' THEN [aspnet_Users3].[UserFullName] END,
     CASE @OrderBy WHEN 'aspnet_Users3_UserFullName DESC' THEN [aspnet_Users3].[UserFullName] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description' THEN [HRM_Divisions4].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions4_Description DESC' THEN [HRM_Divisions4].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description' THEN [HRM_Divisions5].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions5_Description DESC' THEN [HRM_Divisions5].[Description] END DESC,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description' THEN [HRM_Divisions6].[Description] END,
     CASE @OrderBy WHEN 'HRM_Divisions6_Description DESC' THEN [HRM_Divisions6].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Projects7_Description' THEN [IDM_Projects7].[Description] END,
     CASE @OrderBy WHEN 'IDM_Projects7_Description DESC' THEN [IDM_Projects7].[Description] END DESC,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description' THEN [IDM_Vendors8].[Description] END,
     CASE @OrderBy WHEN 'IDM_Vendors8_Description DESC' THEN [IDM_Vendors8].[Description] END DESC,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName' THEN [QAP_DocumentTypes9].[DocumentName] END,
     CASE @OrderBy WHEN 'QAP_DocumentTypes9_DocumentName DESC' THEN [QAP_DocumentTypes9].[DocumentName] END DESC,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus' THEN [QAP_States12].[QAPStatus] END,
     CASE @OrderBy WHEN 'QAP_States12_QAPStatus DESC' THEN [QAP_States12].[QAPStatus] END DESC,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName' THEN [QAP_Purpose1].[PurposeName] END,
     CASE @OrderBy WHEN 'QAP_Purpose1_PurposeName DESC' THEN [QAP_Purpose1].[PurposeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QAP_Requests].[RequestNo] ,
		[QAP_Requests].[DocumentTypeID] ,
		[QAP_Requests].[QAPRevisionNo] ,
		[QAP_Requests].[QAPNo] ,
		[QAP_Requests].[ProjectID] ,
		[QAP_Requests].[SupplierID] ,
		[QAP_Requests].[SubSupplier] ,
		[QAP_Requests].[MainItem] ,
		[QAP_Requests].[SubItem] ,
		[QAP_Requests].[ClientApprovalRequired] ,
		[QAP_Requests].[Remarks] ,
		[QAP_Requests].[CreatedBy] ,
		[QAP_Requests].[CreatedOn] ,
		[QAP_Requests].[CreatersDivision] ,
		[QAP_Requests].[ReviewBy] ,
		[QAP_Requests].[ReviewOn] ,
		[QAP_Requests].[ReviewerRemarks] ,
		[QAP_Requests].[ReviewerDivision] ,
		[QAP_Requests].[ApproveBy] ,
		[QAP_Requests].[ApproveOn] ,
		[QAP_Requests].[ApproverRemarks] ,
		[QAP_Requests].[ApproverDivision] ,
		[QAP_Requests].[StatusID] ,
		[QAP_Requests].[PurposeID] ,
		[aspnet_Users1].[UserFullName] AS aspnet_Users1_UserFullName,
		[aspnet_Users2].[UserFullName] AS aspnet_Users2_UserFullName,
		[aspnet_Users3].[UserFullName] AS aspnet_Users3_UserFullName,
		[HRM_Divisions4].[Description] AS HRM_Divisions4_Description,
		[HRM_Divisions5].[Description] AS HRM_Divisions5_Description,
		[HRM_Divisions6].[Description] AS HRM_Divisions6_Description,
		[IDM_Projects7].[Description] AS IDM_Projects7_Description,
		[IDM_Vendors8].[Description] AS IDM_Vendors8_Description,
		[QAP_DocumentTypes9].[DocumentName] AS QAP_DocumentTypes9_DocumentName,
		[QAP_States12].[QAPStatus] AS QAP_States12_QAPStatus,
		[QAP_Purpose1].[PurposeName] AS QAP_Purpose1_PurposeName 
  FROM [QAP_Requests] 
    	INNER JOIN #PageIndex
          ON [QAP_Requests].[RequestNo] = #PageIndex.RequestNo
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users1]
    ON [QAP_Requests].[CreatedBy] = [aspnet_Users1].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users2]
    ON [QAP_Requests].[ReviewBy] = [aspnet_Users2].[LoginID]
  LEFT OUTER JOIN [aspnet_Users] AS [aspnet_Users3]
    ON [QAP_Requests].[ApproveBy] = [aspnet_Users3].[LoginID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions4]
    ON [QAP_Requests].[ApproverDivision] = [HRM_Divisions4].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions5]
    ON [QAP_Requests].[ReviewerDivision] = [HRM_Divisions5].[DivisionID]
  LEFT OUTER JOIN [HRM_Divisions] AS [HRM_Divisions6]
    ON [QAP_Requests].[CreatersDivision] = [HRM_Divisions6].[DivisionID]
  LEFT OUTER JOIN [IDM_Projects] AS [IDM_Projects7]
    ON [QAP_Requests].[ProjectID] = [IDM_Projects7].[ProjectID]
  LEFT OUTER JOIN [IDM_Vendors] AS [IDM_Vendors8]
    ON [QAP_Requests].[SupplierID] = [IDM_Vendors8].[VendorID]
  LEFT OUTER JOIN [QAP_DocumentTypes] AS [QAP_DocumentTypes9]
    ON [QAP_Requests].[DocumentTypeID] = [QAP_DocumentTypes9].[DocumentTypeID]
  LEFT OUTER JOIN [QAP_States] AS [QAP_States12]
    ON [QAP_Requests].[StatusID] = [QAP_States12].[StatusID]
  INNER JOIN [QAP_Purpose] AS [QAP_Purpose1]
    ON [QAP_Requests].[PurposeID] = [QAP_Purpose1].[PurposeID]
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END


GO
/****** Object:  StoredProcedure [dbo].[spqapRequestsUpdate]    Script Date: 03/29/2016 16:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE Procedure [dbo].[spqapRequestsUpdate]
  @Original_RequestNo Int, 
  @DocumentTypeID Int,
  @QAPRevisionNo NVarChar(50),
  @QAPNo NVarChar(50),
  @ProjectID NVarChar(6),
  @SupplierID NVarChar(6),
  @SubSupplier NVarChar(250),
  @MainItem NVarChar(250),
  @SubItem NVarChar(250),
  @ClientApprovalRequired Bit,
  @Remarks NVarChar(250),
  @CreatedBy NVarChar(8),
  @CreatedOn DateTime,
  @CreatersDivision NVarChar(6),
  @ReviewBy NVarChar(8),
  @ReviewOn DateTime,
  @ReviewerRemarks NVarChar(250),
  @ReviewerDivision NVarChar(6),
  @ApproveBy NVarChar(8),
  @ApproveOn DateTime,
  @ApproverRemarks NVarChar(250),
  @ApproverDivision NVarChar(6),
  @StatusID Int,
  @PurposeID Int,
  @RowCount int = null OUTPUT
  AS
  UPDATE [QAP_Requests] SET 
   [DocumentTypeID] = @DocumentTypeID
  ,[QAPRevisionNo] = @QAPRevisionNo
  ,[QAPNo] = @QAPNo
  ,[ProjectID] = @ProjectID
  ,[SupplierID] = @SupplierID
  ,[SubSupplier] = @SubSupplier
  ,[MainItem] = @MainItem
  ,[SubItem] = @SubItem
  ,[ClientApprovalRequired] = @ClientApprovalRequired
  ,[Remarks] = @Remarks
  ,[CreatedBy] = @CreatedBy
  ,[CreatedOn] = @CreatedOn
  ,[CreatersDivision] = @CreatersDivision
  ,[ReviewBy] = @ReviewBy
  ,[ReviewOn] = @ReviewOn
  ,[ReviewerRemarks] = @ReviewerRemarks
  ,[ReviewerDivision] = @ReviewerDivision
  ,[ApproveBy] = @ApproveBy
  ,[ApproveOn] = @ApproveOn
  ,[ApproverRemarks] = @ApproverRemarks
  ,[ApproverDivision] = @ApproverDivision
  ,[StatusID] = @StatusID
  ,[PurposeID] = @PurposeID
  WHERE
  [RequestNo] = @Original_RequestNo
  SET @RowCount = @@RowCount
