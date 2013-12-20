<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPR_HepRaporu1.aspx.cs" Inherits="EOBS_001.RPR_HepRaporu1" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="ContentRprHep1" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server" />
     <asp:Panel runat="server" ID="Panel2">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">HEP RAPORU PARAMETRELERi<span></span></h2>
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
                                <telerik:RadComboBox ID="cb_Sinif" Runat="server" Skin="WebBlue" AutoPostBack="true" DataSourceID="SDS_Siniflar" DataTextField="SNF_AD" DataValueField="SNF_ID" EmptyMessage="TÜMÜ" Width="100" OnSelectedIndexChanged="cb_Sinif_SelectedIndexChanged" ></telerik:RadComboBox>
                            </asp:TableCell>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                <asp:Label runat="server" ID="lbl3" Text="ŞUBE :"></asp:Label>
                                    </div>
                            </asp:TableCell>
                            <asp:TableCell>
                                <telerik:RadComboBox ID="cb_Sube" Runat="server" Skin="WebBlue" AutoPostBack="true" DataSourceID="SDS_Subeler" DataTextField="SUB_AD" DataValueField="SUB_ID" EmptyMessage="TÜMÜ" Width="100" OnSelectedIndexChanged="cb_Sube_SelectedIndexChanged" ></telerik:RadComboBox>
                            </asp:TableCell>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                <asp:Label runat="server" ID="lbl4" Text="ÖĞRENCİ :"></asp:Label>
                                    </div>
                            </asp:TableCell>
                            <asp:TableCell>
                                <telerik:RadComboBox ID="cb_Kul" Runat="server" Skin="WebBlue" DataSourceID="SDS_Kullar" DataTextField="KUL_ADSOYAD" DataValueField="KUL_ID" EmptyMessage="TÜMÜ" EnableCheckAllItemsCheckBox="true" Width="250" ></telerik:RadComboBox>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" ID="bnt_raporla" Text="RAPORLA" OnClick="bnt_raporla_Click" />
                            </asp:TableCell>
                        </asp:TableRow>
                        
                    </asp:Table>
                </div>
            </div>
		</div>
	</div>
    </asp:Panel>
    <asp:Panel runat="server" ID="Panel1">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">HEP RAPORU<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <div style="margin:10px;">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Height="600px" 
                ShowParameterPrompts="false" ShowBackButton="false" ShowRefreshButton="false" ShowFindControls="false" ShowPrintButton="true"  >
            <LocalReport ReportPath="RPR_HepRaporu1.rdlc"  ></LocalReport>
        </rsweb:ReportViewer>
        
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

        <asp:SqlDataSource ID="SDS_HepTablo" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT HEP_ID, OKL_ID, HEP_GRUP, KUL_ID, HEP_H1, HEP_G1, HEP_H2, HEP_G2, HEP_H3, HEP_H4, HEP_G3, HEP_G4, HEP_H5, HEP_G5, HEP_H6, HEP_G6, HEP_H7, HEP_G7, HEP_H8, HEP_G8 FROM HEPTABLO WHERE (OKL_ID = @OKL_ID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="OKL_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        
            </div>
		</div>
	</div>
        </div>
    </asp:Panel>
</asp:Content>
