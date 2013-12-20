<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HKS_Gelmeyenler.aspx.cs" Inherits="EOBS_001.HKS_Gelmeyenler" %>

<asp:Content ID="ContentRPRHaftalikKarne" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server" />
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">GELMEYEN OGRENCi GiRiSi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="cb_Sinif">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="cb_Sube" LoadingPanelID="RadAjaxLoadingPanel1">
                                </telerik:AjaxUpdatedControl>
                                <telerik:AjaxUpdatedControl ControlID="cb_Kul" LoadingPanelID="RadAjaxLoadingPanel1">
                                </telerik:AjaxUpdatedControl>
                                <telerik:AjaxUpdatedControl ControlID="cb_Davranis" LoadingPanelID="RadAjaxLoadingPanel1">
                                </telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                        <telerik:AjaxSetting AjaxControlID="cb_Sube">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="cb_Kul" LoadingPanelID="RadAjaxLoadingPanel1">
                                </telerik:AjaxUpdatedControl>
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                </telerik:RadAjaxManager>
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
                <div style="margin:10px;">
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                <asp:Label runat="server" ID="lb2" Text="SINIF :"></asp:Label>
                                    </div>
                            </asp:TableCell>
                            <asp:TableCell>
                                <telerik:RadComboBox ID="cb_Sinif" Runat="server" Skin="WebBlue" AutoPostBack="true" DataSourceID="SDS_Siniflar" DataTextField="SNF_AD" DataValueField="SNF_ID" EmptyMessage="SEÇİNİZ" Width="100" OnSelectedIndexChanged="cb_Sinif_SelectedIndexChanged" ></telerik:RadComboBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                <asp:Label runat="server" ID="lbl3" Text="ŞUBE :"></asp:Label>
                                    </div>
                            </asp:TableCell>
                            <asp:TableCell>
                                <telerik:RadComboBox ID="cb_Sube" Runat="server" Skin="WebBlue" AutoPostBack="true" DataSourceID="SDS_Subeler" DataTextField="SUB_AD" DataValueField="SUB_ID" EmptyMessage="SEÇİNİZ" Width="100" OnSelectedIndexChanged="cb_Sube_SelectedIndexChanged" ></telerik:RadComboBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                <asp:Label runat="server" ID="lbl4" Text="ÖĞRENCİ :"></asp:Label>
                                    </div>
                            </asp:TableCell>
                            <asp:TableCell>
                                <telerik:RadComboBox ID="cb_Kul" Runat="server" Skin="WebBlue" DataSourceID="SDS_Kullar" DataTextField="KUL_ADSOYAD" DataValueField="KUL_ID" EmptyMessage="SEÇİNİZ" CheckBoxes="true" CheckedItemsTexts="DisplayAllInInput"  Localization-CheckAllString="TÜMÜ" EnableCheckAllItemsCheckBox="true" Width="250" ></telerik:RadComboBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                    <asp:Label runat="server" ID="Label2" Text="GÜN :"></asp:Label>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell >
                                <telerik:RadComboBox ID="cb_Gun" Runat="server" Skin="WebBlue" EmptyMessage="SEÇİNİZ.." Width="150" >
                                    <Items>
                                        <telerik:RadComboBoxItem Text="TAM GÜN" Value="0" />
                                        <telerik:RadComboBoxItem Text="ÖĞLEDEN ÖNCE" Value="1" />
                                        <telerik:RadComboBoxItem Text="ÖĞLEDEN SONRA" Value="2" />
                                    </Items>
                                </telerik:RadComboBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                    <asp:Label runat="server" ID="Label1" Text="MAZERET :"></asp:Label>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell >
                                <telerik:RadComboBox ID="cb_Mazeret" Runat="server" Skin="WebBlue" EmptyMessage="SEÇİNİZ.." Width="100" >
                                    <Items>
                                        <telerik:RadComboBoxItem Text="İZİNLİ" Value="0" />
                                        <telerik:RadComboBoxItem Text="HASTA" Value="1" />
                                        <telerik:RadComboBoxItem Text="GEÇ KALDI" Value="2" />
                                        <telerik:RadComboBoxItem Text="DİĞER" Value="3" />
                                    </Items>
                                </telerik:RadComboBox><br />
                                <asp:TextBox runat="server" ID="txtMazeret" Width ="300" TextMode="MultiLine" Height="200" />

                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                    <asp:Label runat="server" ID="Label3" Text="TARİH :"></asp:Label>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell >
                                <asp:TextBox runat="server" ID="txt_Tar" />
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <asp:Button runat="server" ID="bnt_kaydet" Text="KAYDET" OnClick="bnt_kaydet_Click"  />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
		</div>
	</div>
    
     
        
        <asp:SqlDataSource ID="SDS_Siniflar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SNF_ID, SNF_AD FROM SINIFLAR WHERE (OKL_ID = @OKL_ID)">
            <SelectParameters>
                <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Subeler" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SUB_ID, SUB_AD FROM SUBELER WHERE (OKL_ID = @OKL_ID) AND (SNF_ID = @SNF_ID)">
            <SelectParameters>
                <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                <asp:ControlParameter ControlID="cb_Sinif" DbType="Int32" Name="SNF_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Kullar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT KUL_ID, KUL_ADSOYAD FROM KULLANICILAR WHERE (SUB_ID = @SUB_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cb_Sube" DbType="Int32" Name="SUB_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Davranis" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT DVR_AD, DVR_ID FROM DAVRANISLAR WHERE (SNF_ID = @SNF_ID) ORDER BY DVR_AD">
            <SelectParameters>
                <asp:ControlParameter ControlID="cb_Sinif" DbType="Int32" Name="SNF_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
