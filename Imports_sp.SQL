SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spqapPurposeSelectList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spqapPurposeSelectList]
GO
 
CREATE PROCEDURE [dbo].[spqapPurposeSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
		[QAP_Purpose].[PurposeID] ,
		[QAP_Purpose].[PurposeName]  
  FROM [QAP_Purpose] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Purpose].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Purpose].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'PurposeName' THEN [QAP_Purpose].[PurposeName] END,
     CASE @OrderBy WHEN 'PurposeName DESC' THEN [QAP_Purpose].[PurposeName] END DESC 
  SET @RecordCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spqapPurposeAutoCompleteList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spqapPurposeAutoCompleteList]
GO
 
CREATE PROCEDURE [dbo].[spqapPurposeAutoCompleteList]
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
  SET @LGSQL = @LGSQL + ' [QAP_Purpose].[PurposeName]' 
  SET @LGSQL = @LGSQL + ',[QAP_Purpose].[PurposeID]' 
  SET @LGSQL = @LGSQL + ' FROM [QAP_Purpose] ' 
  SET @LGSQL = @LGSQL + ' WHERE 1 = 1 ' 
  SET @LGSQL = @LGSQL + ' AND (LTRIM(STR(ISNULL([QAP_Purpose].[PurposeID],0))) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ' OR LOWER(ISNULL([QAP_Purpose].[PurposeName],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL = @LGSQL + ')' 
  
  EXEC (@LGSQL)
  END 
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spqapPurposeSelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spqapPurposeSelectByID]
GO
 
CREATE PROCEDURE [dbo].[spqapPurposeSelectByID]
  @LoginID NVarChar(8),
  @PurposeID Int 
  AS
  SELECT
		[QAP_Purpose].[PurposeID] ,
		[QAP_Purpose].[PurposeName]  
  FROM [QAP_Purpose] 
  WHERE
  [QAP_Purpose].[PurposeID] = @PurposeID
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spqapPurposeSelectListSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spqapPurposeSelectListSearch]
GO
 
CREATE PROCEDURE [dbo].[spqapPurposeSelectListSearch]
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
 ,PurposeID Int NOT NULL
  )
  INSERT INTO #PageIndex (PurposeID)
  SELECT [QAP_Purpose].[PurposeID] FROM [QAP_Purpose]
 WHERE  
   ( 
         STR(ISNULL([QAP_Purpose].[PurposeID], 0)) LIKE @KeyWord1
     OR LOWER(ISNULL([QAP_Purpose].[PurposeName],'')) LIKE @KeyWord1
   ) 
  ORDER BY
     CASE @OrderBy WHEN 'PurposeID' THEN [QAP_Purpose].[PurposeID] END,
     CASE @OrderBy WHEN 'PurposeID DESC' THEN [QAP_Purpose].[PurposeID] END DESC,
     CASE @OrderBy WHEN 'PurposeName' THEN [QAP_Purpose].[PurposeName] END,
     CASE @OrderBy WHEN 'PurposeName DESC' THEN [QAP_Purpose].[PurposeName] END DESC 

    SET @RecordCount = @@RowCount

  SELECT
		[QAP_Purpose].[PurposeID] ,
		[QAP_Purpose].[PurposeName]  
  FROM [QAP_Purpose] 
    	INNER JOIN #PageIndex
          ON [QAP_Purpose].[PurposeID] = #PageIndex.PurposeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spqapPurposeSelectListFilteres]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spqapPurposeSelectListFilteres]
GO
 
CREATE PROCEDURE [dbo].[spqapPurposeSelectListFilteres]
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
 ,PurposeID Int NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL = @LGSQL + 'PurposeID'
  SET @LGSQL = @LGSQL + ')'
  SET @LGSQL = @LGSQL + ' SELECT '
  SET @LGSQL = @LGSQL + '[QAP_Purpose].[PurposeID]'
  SET @LGSQL = @LGSQL + ' FROM [QAP_Purpose] '
  SET @LGSQL = @LGSQL + '  WHERE 1 = 1 '
  SET @LGSQL = @LGSQL + '  ORDER BY '
  SET @LGSQL = @LGSQL + CASE @OrderBy
                        WHEN 'PurposeID' THEN '[QAP_Purpose].[PurposeID]'
                        WHEN 'PurposeID DESC' THEN '[QAP_Purpose].[PurposeID] DESC'
                        WHEN 'PurposeName' THEN '[QAP_Purpose].[PurposeName]'
                        WHEN 'PurposeName DESC' THEN '[QAP_Purpose].[PurposeName] DESC'
                        ELSE '[QAP_Purpose].[PurposeID]'
                    END
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
		[QAP_Purpose].[PurposeID] ,
		[QAP_Purpose].[PurposeName]  
  FROM [QAP_Purpose] 
    	INNER JOIN #PageIndex
          ON [QAP_Purpose].[PurposeID] = #PageIndex.PurposeID
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spqapPurposeInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spqapPurposeInsert]
GO
 
CREATE PROCEDURE [dbo].[spqapPurposeInsert]
  @PurposeName NVarChar(50),
  @Return_PurposeID Int = null OUTPUT 
  AS
  INSERT [QAP_Purpose]
  (
   [PurposeName]
  )
  VALUES
  (
   @PurposeName
  )
  SET @Return_PurposeID = Scope_Identity()
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spqapPurposeUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spqapPurposeUpdate]
GO
 
CREATE PROCEDURE [dbo].[spqapPurposeUpdate]
  @Original_PurposeID Int, 
  @PurposeName NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  UPDATE [QAP_Purpose] SET 
   [PurposeName] = @PurposeName
  WHERE
  [PurposeID] = @Original_PurposeID
  SET @RowCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spqapPurposeDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spqapPurposeDelete]
GO
 
CREATE PROCEDURE [dbo].[spqapPurposeDelete]
  @Original_PurposeID Int,
  @RowCount int = null OUTPUT
  AS
  DELETE [QAP_Purpose]
  WHERE
  [QAP_Purpose].[PurposeID] = @Original_PurposeID
  SET @RowCount = @@RowCount
  GO

SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
