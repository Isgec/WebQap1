<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_qapList.ascx.vb" Inherits="LC_qapList" %>
<script type="text/javascript">
  var lc_qapList = {
    mayHide: false,
    getQap: function(o) {
      showProcessingMPV();
      $get('<%= F_ErrMsg.ClientID %>').innerHTML = '';
      var dt = $get(o.id.replace('cmdQapList','F_DocumentTypeID_DDLqapDocumentTypes'));
      var pj = $get(o.id.replace('cmdQapList','F_ProjectID'));
      var vn = $get(o.id.replace('cmdQapList','F_SupplierID'));
      
      PageMethods.GetQAPData(dt.value + '|' + pj.value +'|' + vn.value, this.DataReceived, this.DataError);
    },
    DataReceived: function(r) {
      try {
        var aVal = r.split('|');
        $get('divHdr').innerHTML = aVal[0];
        $get('divCLP').innerHTML = aVal[1];
      } catch (e) { }
      hideProcessingMPV();
      $find('mpeqapList').show();
    },
    DataError: function(r) {
      $get('<%= F_ErrMsg.ClientID %>').innerHTML = r._message;
      hideProcessingMPV();
    },
    showPop: function() {
      var mPop = $find('mpeqapList');
      mPop.show();
    },
    hidePop: function() {
      var mPop = $find('mpeqapList');
      mPop.hide();
    }
  }
</script>
    <asp:Label ID="dummy" runat="server" Text="dummy" style="display:none" ></asp:Label>
    <asp:Panel ID="pnlOTPLinkCLP" runat="server" Style="display:none; width: 1080px" CssClass="modalPopup">
      <table style="width: 100%">
        <tr>
          <td style="background-color: Navy">
            <asp:Image ID="Image2" runat="server" AlternateText="Task" ToolTip="Task" ImageUrl="~/App_Themes/Default/Images/application.png" />
          </td>
          <td id="dragOTPLinkCLP" runat="server" style="background-color: Navy; cursor: move; text-align: left; width: 100%; font-weight: bold; color: White; height: 24px">
            Already Created QAP List
          </td>
          <td style="background-color: Navy; text-align: right">
            <asp:ImageButton ID="closeOTPLinkCLP" runat="server" Height="20px" Width="20px" AlternateText="Close" ToolTip="Close" ImageUrl="~/App_Themes/Default/Images/closeWindow.png" />
          </td>
        </tr>
      </table>
    <asp:Label ID="F_ErrMsg" ForeColor="Red" Font-Size="10px" style="display:block" runat="server" Text="" />
    <div id="divHdr" style="width:100%">&nbsp;</div>
    <div id="divCLP" style="width:100%;height:400px;overflow:scroll">&nbsp;</div>
    <table width="100%">
      <tr>
      <td style="text-align:center">
        <input type="button" value="Cancel" onclick="lc_qapList.hidePop();" style="background-color: silver;color: Red" />
        </td>
      </tr>
    </table>
    </asp:Panel>
    <AJX:ModalPopupExtender BehaviorID="mpeqapList" PopupControlID="pnlOTPLinkCLP" OkControlID="closeOTPLinkCLP" CancelControlID="closeOTPLinkCLP" PopupDragHandleControlID="dragOTPLinkCLP" ID="MPE1" runat="server" TargetControlID="dummy" BackgroundCssClass="modalBackground" DropShadow="true" />

