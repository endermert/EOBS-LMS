<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPR_SinavSonucListe1.aspx.cs" Inherits="EOBS_001.RPR_SinavSonucListe1" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="ContentRPR_SinavSonucListe1" ContentPlaceHolderID="MainContent" runat="server">
<telerik:RadScriptManager ID="RadScriptManager1" Runat="server" />
    <asp:Panel runat="server" ID="Panel2">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">SINAV SONUC LiSTESi PARAMETRELERi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="cb_Sinif">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="cb_Sube" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                                <telerik:AjaxUpdatedControl ControlID="cb_Sinav" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
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
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lbl1" Text="SINAV :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="3">
                                <telerik:RadComboBox ID="cb_Sinav" Runat="server" Skin="WebBlue" DataSourceID="SDS_Sinavlar" DataTextField="SNV_AD" DataValueField="SNV_ID" EmptyMessage="SEÇİNİZ.." Width="200" ></telerik:RadComboBox>
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="3">
                                <asp:Label runat="server" ID="Label3" Text="ŞEBE ŞUBE :"></asp:Label>
                                <asp:CheckBox runat="server" ID="chkSub" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <%--<asp:TableRow>
                            <asp:TableCell>
                                <div style="margin-left:5px;">
                                    <asp:Label runat="server" ID="Label2" Text="ALTBİLGİ :"></asp:Label>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="6">
                                <asp:TextBox ID="txtBilgi" runat="server" Width="650" Text="Geleceğinize Işık Tutun.."></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>--%>
                    </asp:Table>
                </div>
            </div>
		</div>
	</div>
    </asp:Panel>
    <asp:Panel runat="server" ID="Panel1">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">SINAV SONUC LiSTESi RAPORU<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <div style="margin:10px;">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Height="600px" 
                ShowParameterPrompts="false" ShowBackButton="false" ShowRefreshButton="false" ShowFindControls="false" ShowPrintButton="true"  >
                <LocalReport ReportPath="RPR_SinavSonucListe1.rdlc"></LocalReport>
            </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SDS_Sinavlar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SNV_ID, SNV_AD FROM SINAVLAR WHERE (OKL_ID = @OKL_ID) AND (SNF_ID = @SNF_ID) ORDER BY SNV_EKLTAR DESC">
            <SelectParameters>
                <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                <asp:ControlParameter ControlID="cb_Sinif" DbType="Int32" Name="SNF_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Sinavlar1" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SNV_ID, SNV_AD FROM SINAVLAR WHERE (OKL_ID = @OKL_ID) AND (SNF_ID = @SNF_ID) ORDER BY SNV_EKLTAR DESC">
            <SelectParameters>
                <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                <asp:ControlParameter ControlID="cb_Sinif" DbType="Int32" Name="SNF_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        
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

       <%--<asp:SqlDataSource ID="SDS_DersSnc" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT DRSSNVSNC.DSN_ID, DRSSNVSNC.SNV_ID, DRSSNVSNC.KUL_ID, DERSLER.DRS_AD, DRSSNVSNC.DSN_SS, DRSSNVSNC.DSN_DS, DRSSNVSNC.DSN_YS, DRSSNVSNC.DSN_NS, DRSSNVSNC.DSN_ORTSUB, DRSSNVSNC.DSN_SRASUB, DRSSNVSNC.DSN_TOPSUB, DRSSNVSNC.DSN_ORTSNF, DRSSNVSNC.DSN_SRASNF, DRSSNVSNC.DSN_TOPSNF, DRSSNVSNC.DSN_ORTOKL, DRSSNVSNC.DSN_SRAOKL, DRSSNVSNC.DSN_TOPOKL, DRSSNVSNC.DSN_BSRYZD, DRSSNVSNC.DSN_BSRYRM, DRSSNVSNC.DSN_KTPCK, DRSSNVSNC.DSN_CVPANH, DRSSNVSNC.DSN_CVPKUL, DRSSNVSNC.DSN_CVPAE FROM DRSSNVSNC INNER JOIN DERSLER ON DRSSNVSNC.DRS_ID = DERSLER.DRS_ID WHERE (DRSSNVSNC.SNV_ID = @SNV_ID)">
            <SelectParameters>
                <asp:Parameter Name="SNV_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_SnvSnc" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SINAVLAR.SNV_ID, SINAVLAR.SNV_AD, SINAVSNC.KUL_ID, SINAVSNC.SNS_SS, SINAVSNC.SNS_DS, SINAVSNC.SNS_YS, SINAVSNC.SNS_NS, SINAVSNC.SNS_PUAN, SINAVSNC.SNS_SRASUB, SINAVSNC.SNS_ORTSUB, SINAVSNC.SNS_TOPSUB, SINAVSNC.SNS_ORTSNF, SINAVSNC.SNS_SRASNF, SINAVSNC.SNS_TOPSNF, SINAVSNC.SNS_ORTOKL, SINAVSNC.SNS_SRAOKL, SINAVSNC.SNS_TOPOKL, SINAVSNC.SNS_BSRYZD, SINAVSNC.SNS_BSRYRM, SINAVSNC.SNS_YGS1, SINAVSNC.SNS_YGS2, SINAVSNC.SNS_YGS3, SINAVSNC.SNS_YGS4, SINAVSNC.SNS_YGS5, SINAVSNC.SNS_YGS6, SINAVSNC.SNS_MF1, SINAVSNC.SNS_MF2, SINAVSNC.SNS_MF3, SINAVSNC.SNS_MF4, SINAVSNC.SNS_TM1, SINAVSNC.SNS_TM2, SINAVSNC.SNS_TM3, SINAVSNC.SNS_TS1, SINAVSNC.SNS_TS2, SINAVSNC.SNS_DIL1, SINAVSNC.SNS_DIL2 FROM SINAVLAR INNER JOIN SINAVDETAY ON SINAVLAR.SDT_ID = SINAVDETAY.SDT_ID INNER JOIN SINAVSNC ON SINAVLAR.SNV_ID = SINAVSNC.SNV_ID WHERE (SINAVDETAY.STP_ID = @STP_ID) AND (SINAVLAR.SNF_ID = @SNF_ID) ORDER BY SINAVLAR.SNV_EKLTAR DESC">
            <SelectParameters>
                <asp:Parameter Name="STP_ID" DefaultValue="" />
                <asp:Parameter Name="SNF_ID" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
        <asp:SqlDataSource ID="SDS_SnvSncKul" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT OKULLAR.OKL_ADI, OKULLAR.OKL_KISA, SUBELER.SUB_AD, KULLANICILAR.KUL_NO, KULLANICILAR.KUL_ISIM, KULLANICILAR.KUL_SOYISIM, DRSSNVSNC.DSN_KTPCK, DERSLER.DRS_AD, DRSSNVSNC.DSN_DS, DRSSNVSNC.DSN_YS, DRSSNVSNC.DSN_BS, DRSSNVSNC.DSN_NS, SINAVSNC.SNS_DS, SINAVSNC.SNS_YS, SINAVSNC.SNS_BS, SINAVSNC.SNS_NS, SINAVSNC.SNS_SRASUB, SINAVSNC.SNS_SRASNF, SINAVSNC.SNS_SRAOKL, SINAVSNC.SNS_SRAKRM, SINAVSNC.SNS_PUAN, SINAVSNC.SNS_BSRYZD, SINAVLAR.SNV_AD, SINAVSNC.SNS_TOPKRM, KULLANICILAR.KUL_ID FROM SINAVLAR INNER JOIN DRSSNVSNC ON SINAVLAR.SNV_ID = DRSSNVSNC.SNV_ID INNER JOIN DERSLER ON DRSSNVSNC.DRS_ID = DERSLER.DRS_ID INNER JOIN KULLANICILAR ON DRSSNVSNC.KUL_ID = KULLANICILAR.KUL_ID INNER JOIN OKULLAR ON KULLANICILAR.OKL_ID = OKULLAR.OKL_ID INNER JOIN SUBELER ON KULLANICILAR.SUB_ID = SUBELER.SUB_ID INNER JOIN SINAVSNC ON SINAVLAR.SNV_ID = SINAVSNC.SNV_ID AND KULLANICILAR.KUL_ID = SINAVSNC.KUL_ID WHERE (SINAVLAR.SNV_ID = @SNV_ID) ">
            <SelectParameters>
                <asp:Parameter Name="SNV_ID" />
            </SelectParameters>
        </asp:SqlDataSource>

            </div>
		</div>
	</div>
        </div>
    </asp:Panel>
</asp:Content>
