<%@ Control Language="VB" AutoEventWireup="false" CodeFile="lgMessageBox.ascx.vb" Inherits="lgMessageBox" %>
<script type="text/javascript">
	var lgMessageBox = {
		MessageBoxTitle: 'Dynamic Data',
		CallBackMethodName: '',
		CallBackMethodArguments: '',
		CancellingScript: '',
		CancelledScript: '',
		CancelReturn: false,

		Execute: function(title, method, args) {
			$get('tdTitle').innerHTML = title;
			var dData = $get('dynamicData');
			dData.innerHTML = '';
			dData.style.display = 'block';
			//var doc = $get('=IfBd1.ClientID %>');
			var doc = $get('IfBd1');
			doc.style.display = 'none';
			var fdoc = doc.contentDocument || doc.contentWindow.document;
			fdoc.getElementsByTagName('body')[0].innerHTML = '';
			var toExecute = 'PageMethods.' + method + '(' + args + ',this.showMessageMPV,this.showErrorMPV)';
			eval(toExecute);
			return false;
		},
		ExecuteURL: function(title, url) {
			$get('tdTitle').innerHTML = title;
			var dData = $get('dynamicData');
			dData.style.display = 'none';
			dData.innerHTML = '';
			//var doc = $get('=IfBd1.ClientID %>');
			var doc = $get('IfBd1');
			var fdoc = doc.contentDocument || doc.contentWindow.document;
			fdoc.getElementsByTagName('body')[0].innerHTML = '';
			doc.style.display = 'block';
			doc.src = url;
			$find('mpe1Box').show();
			return false;
		},
		CancelMessage: function() {
			try {
				eval(this.CancellingScript);
			} catch (ex) { }
			var mPB = $find('mpe1Box');
			mPB.hide();
			try {
				eval(this.CancelledScript);
			} catch (ex) { }
			return this.CancelReturn;
		},
		hideMessageMPV: function() {
			var mPB = $find('mpe1Box');
			mPB.hide();
			return false;
		},
		showMessageMPV: function(ev) {
			var mPB = $find('mpe1Box');
			var dData = $get('dynamicData');
			if (ev) {
				dData.innerHTML = ev;
			}
			mPB.show();
			return false;
		},
		close: function() {
			this.hideMessageMPV();
			return false;
		},
		showErrorMPV: function(ev) {
			var mPB = $find('mpe1Box');
			var dData = $get('dynamicData');
			if (ev) {
				dData.innerHTML = ev;
			}
			this.resizeFrame(dData);
			mPB.show();
			return false;
		},
		resizeFrame: function(o) {
			var ht = 100;
			var wt = 400;
			var doc = document.frames[o.id];
			if (doc) {
				ht = doc.document.body.scrollHeight;
				wt = doc.document.body.scrollWidth;
			}
			var pnl = $get('<%=pnl1.ClientID %>');

			if (ht < 100)
				ht = 100;
			if (ht > 450)
				ht = 450
			if (wt > 1000)
				wt = 1000
			if (wt < 400)
				wt = 400;
			pnl.height = ht;
			pnl.width = wt;
			$get('mboxtable').width = wt;
			$get('tdTitle').width = wt;
			o.height = ht;
			o.width = wt;
			return true;
		},
		resizeDiv: function(o) {
			var ht = 100;
			var wt = 400;
			var doc = $get([o.id]);
			if (doc) {
				ht = doc.offsetHeight;
				wt = doc.offsetWidth;
			}
			var pnl = $get('<%=pnl1.ClientID %>');

			if (ht < 100)
				ht = 100;
			if (ht > 450)
				ht = 450
			if (wt > 1000)
				wt = 1000
			if (wt < 400)
				wt = 400;
			pnl.height = ht;
			pnl.width = wt;
			$get('mboxtable').width = wt;
			$get('tdTitle').width = wt;
			o.style.height = ht + 'px';
			o.style.width = wt + 'px';
			return true;
		}
		
	}
</script>

<asp:Label ID="fakeButton" runat="server" Style="display: none"></asp:Label>
<asp:Panel ID="pnl1" runat="server" BackColor="white" Style="display:none" Height="325px" Width="600px">
	<table id="mboxtable" width="600px">
		<tr>
			<td style="background-color:Navy">
				<asp:Image ID="imgerr" runat="server" AlternateText="Message" ToolTip="Message" ImageUrl="~/App_Themes/Default/Images/Error1.gif" />
			</td>
			<td id="tdTitle" width="100%" style="background-color: Navy;cursor:move;text-align: left;font-weight:bold;color:White">
				Message
			</td>
			<td style="background-color: Navy">
				<asp:ImageButton ID="cmdClose0" runat="server" Height="18px" Width="18px" OnClientClick="return lgMessageBox.CancelMessage();" AlternateText="Close" ToolTip="Close" ImageUrl="~/App_Themes/Default/Images/closeWindow.png" />
			</td>
		</tr>
	</table>
	<div id="dynamicData" enableviewstate="false" style="display:none;height:300px;width:600px;overflow:visible"></div>
	<div id="serverData" runat="server" enableviewstate="false" style="display:none;height:600px;width:600px;overflow:visible"></div>
  <iframe id="IfBd1" enableviewstate="false" frameborder="0" style="display:none;height:300px;width:600px;overflow:visible">
  <%--onload="return window.parent.lgMessageBox.resizeFrame(this);"--%>
  </iframe>
</asp:Panel>
<AJX:ModalPopupExtender ID="mPopup" RepositionMode="None" TargetControlID="fakeButton" BackgroundCssClass="modalBackground" BehaviorID="mpe1Box" CancelControlID="cmdClose0" OkControlID="cmdClose0" PopupControlID="pnl1" PopupDragHandleControlID="tdTitle" runat="server">
</AJX:ModalPopupExtender>
