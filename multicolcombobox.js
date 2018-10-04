//when arrow down button is clicked
function onDownArrowBtnClick(divId , ctrlsToHide)
{
	document.getElementById(divId).style.display="block";
	
	if (ctrlsToHide.length > 0)
		showCtrls(ctrlsToHide , 0);
		
				
	return false;//avoid post back
}

//when lost focus occured on textbox
function onLostFocus(divId , ctrlsToHide)
{
	document.getElementById(divId).style.display="none";
	
	if ( ctrlsToHide.length > 0)
		showCtrls(ctrlsToHide , 1);
	return false;//avoid post back
}

function setData(txtId , v)
{
	
		
		var txt = document.getElementById(txtId);
		//alert(txt);
		txt.value = v;
		
}
	
function showIntellisense(divId,txtId , tblId , ctrlsToHide , keyColIndex)
{
		
		var div = document.getElementById(divId);
		var txtData = document.getElementById(txtId);
		var tbl = document.getElementById(tblId);
		
		if ( tbl == null )
		{
		return;
		}
		
				
		var rows = tbl.rows.length;//no. of rows
		var index;
		var cellText;
					
				
		if ( txtData.value.length == 0)
		{
			div.style.display = "none";
			if ( trim(ctrlsToHide).length > 0)
			{
				showCtrls(ctrlsToHide , 1);
			}
		}
		else
		{
			div.style.display = "block";
			if ( trim(ctrlsToHide).length > 0)
			{
				showCtrls(ctrlsToHide , 0);
			}
		}
		
		
		
						
		var match = trim(txtData.value).toUpperCase();
		var matchFound = 0;
		var cellCtrl;
		//start from row # 1 excluding header row.
		for (index=1;index<rows;index++)
		{
				//cellText = tbl.rows(index).cells(0).firstChild.innerText.toUpperCase();
				//cellCtrl = tbl.rows(index).cells(keyColIndex).firstChild;
				
				//if ( cellCtrl == null ) return;			
				
				
				cellText = tbl.rows(index).cells(keyColIndex).firstChild.innerText.toUpperCase();
				//cellText = cellCtrl.innerText.toUpperCase();
					
			
					
			/*
				we are doing search from the start of the string.if present it's starting index will be 0
			*/
			if ( cellText.indexOf(match) == 0)
			{
					tbl.rows(index).style.display = 'block';
					matchFound = 1;
			}
			else
			{
					tbl.rows(index).style.display = 'none'
			}
					
					
											
		}	
				
		if ( matchFound == 0)
		{
			div.style.display='none';
			if ( trim(ctrlsToHide).length > 0)
				showCtrls(ctrlsToHide , 1);
		}
			
}

function showCtrls(ctrls , isShow)
{
	var ctrlsArray = ctrls.split("-");
	var index;
	var ctrl;
	
	if ( isShow == 1)
	{
		for ( index=0; index<ctrlsArray.length; index++)
		{
			ctrl = document.getElementById(ctrlsArray[index]);
			if ( ctrl != null)
				ctrl.style.display = "block";
		}
	}
	else
	{
		for ( index=0; index<ctrlsArray.length; index++)
		{
			ctrl = document.getElementById(ctrlsArray[index]);
			if ( ctrl != null)
				ctrl.style.display = "none";
		}
	}
}
