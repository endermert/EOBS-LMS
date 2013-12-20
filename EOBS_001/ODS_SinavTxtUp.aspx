<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ODS_SinavTxtUp.aspx.cs" Inherits="EOBS_001.ODS_SinavTxtUp" %>
<asp:Content ID="ContentSinavTxtUp" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Sınav Dosyası Yukle<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
            <%-- <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
             <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="GridDamla">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="GridDamla" LoadingPanelID="RadAjaxLoadingPanel1">
                            </telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>--%>
                <div style="margin:10px;">
                        <div style="float:right; border:none; margin-bottom:10px;">
                    <asp:Table ID="TableDeg" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <span>Okul Belirleme Kriteri</span>
                            </asp:TableCell><asp:TableCell>
                                <span>:</span>
                            </asp:TableCell><asp:TableCell>
                                <asp:DropDownList ID="krList1" runat="server">
                                    <asp:ListItem Selected="True" Text="Dosyadan Al" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Aktif Okul" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>

                        </asp:TableRow><asp:TableRow>
                            <asp:TableCell>
                                <span>Öğrenci Belirleme Kriteri</span>
                            </asp:TableCell><asp:TableCell>
                                <span>:</span>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="krList2" runat="server">
                                    <asp:ListItem Selected="True" Text="Numara" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="TC Kimlik No" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Numara ve TC Kimlik" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell>

                                       </asp:TableRow><asp:TableRow>
                            <asp:TableCell>
                            </asp:TableCell><asp:TableCell>
                            </asp:TableCell><asp:TableCell>
                                <div style="float:right">
                                    <asp:Button ID="btn_Kaydet" runat="server" Text="KAYDET" OnClick="btn_Kaydet_Click" />
                                </div>
                            </asp:TableCell></asp:TableRow>

                    </asp:Table></div>

                        <asp:Table runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:FileUpload ID="txtup" runat="server" />
                                    <asp:Button ID="btn_upload" runat="server" Text="YUKLE" OnClick="btn_upload_Click" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="lbl_msg" runat="server" />
                                </asp:TableCell></asp:TableRow></asp:Table><%--<asp:Panel ID="Panel1" runat="server">
                    <telerik:RadGrid ID="GridDamla" AllowPaging="True" AllowMultiRowSelection="True" runat="server"  Skin="WebBlue"  GridLines="None">
                        <MasterTableView Width="100%" Summary="RadGrid table" NoMasterRecordsText="Yüklü kayıt yok."><CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>

                        <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                        </MasterTableView>
                        <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                    <FilterMenu EnableImageSprites="False"></FilterMenu>
</telerik:RadGrid></asp:Panel>--%></div></div></div><asp:Panel ID="Panel1" runat="server" BorderStyle="None" BackColor="Transparent">
                    <div class="box grid_16">
			            <h2 class="box_head">Dosyadaki Kayitlar<span></span></h2><div class="controls">
				            <a href="#" class="grabber"></a>
				            <a href="#" class="toggle"></a>
			            </div>

			            <div class="toggle_container">
                      <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
             <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="GridDamla">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="GridDamla" LoadingPanelID="RadAjaxLoadingPanel1">
                            </telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="WebBlue"></telerik:RadAjaxLoadingPanel>
                            <telerik:RadGrid ID="GridDamla" AllowPaging="True" AllowMultiRowSelection="True" runat="server"  Skin="WebBlue"  GridLines="None">
                        <MasterTableView Width="100%" Summary="RadGrid table" NoMasterRecordsText="Yüklü kayıt yok."><CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

                        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

                        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>

                        <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
                        </EditFormSettings>
                        </MasterTableView>
                        <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                    <FilterMenu EnableImageSprites="False"></FilterMenu>
                        </telerik:RadGrid>
			            </div>
                    </div>
                </asp:Panel>
        </div>
</asp:Content>
