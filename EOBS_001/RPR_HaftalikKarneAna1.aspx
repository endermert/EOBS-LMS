<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPR_HaftalikKarneAna1.aspx.cs" Inherits="EOBS_001.RPR_HaftalikKarneAna1" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="ContentHaftalikKarneAna1" ContentPlaceHolderID="MainContent" runat="server">
      <telerik:RadScriptManager ID="RadScriptManager1" Runat="server" />
    <asp:Panel runat="server" ID="Panel2">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">HAFTALIK KARNE RAPORU PARAMETRELERi<span></span></h2>
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
                                <asp:Label runat="server" ID="lbl1" Text="HAFTA :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <telerik:RadComboBox ID="cb_Hafta" Runat="server" Skin="WebBlue" DataSourceID="SDS_Haftalar" DataTextField="HFT_AD" DataValueField="HFT_ID" EmptyMessage="SEÇİNİZ.." Width="100" ></telerik:RadComboBox>
                            </asp:TableCell>
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
                                <div style="margin-left:5px;">
                                    <asp:Label runat="server" ID="Label2" Text="Rapor Türü :"></asp:Label>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="7">
                                <telerik:RadComboBox runat="server" ID="RPR_Sec" Skin="WebBlue" Width="200">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Selected="true" Text="TASARIM 1" Value="RPR_HaftalikKarneAna1.rdlc" />
                                        <telerik:RadComboBoxItem runat="server" Text="TASARIM 2" Value="RPR_HaftalikKarneAna2.rdlc" />
                                        <telerik:RadComboBoxItem runat="server" Text="TASARIM 3" Value="RPR_HaftalikKarneAna3.rdlc" />
                                    </Items>
                                </telerik:RadComboBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
		</div>
	</div>
    </asp:Panel>
     <asp:Panel runat="server" ID="PanelOgr">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">HAFTALIK KARNE RAPORU PARAMETRELERi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <div style="margin:10px;">
                    <asp:Table ID="Table2" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="Label1" Text="HAFTA :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <telerik:RadComboBox ID="cb_HaftaOgr" Runat="server" Skin="WebBlue" DataSourceID="SDS_Haftalar" DataTextField="HFT_AD" DataValueField="HFT_ID" EmptyMessage="SEÇİNİZ.." Width="100" ></telerik:RadComboBox>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Button runat="server" ID="btn_RaporlaOgr" Text="RAPORLA" OnClick="btn_RaporlaOgr_Click" />
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
			<h2 class="box_head">HAFTALIK KARNE RAPORU<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <div style="margin:10px;">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Height="600px" 
                ShowParameterPrompts="false" ShowBackButton="false" ShowRefreshButton="false" ShowFindControls="false" ShowPrintButton="true"  >
            <LocalReport ReportPath="RPR_HaftalikKarneAna2.rdlc"  >
                
                <DataSources>
                    <%--<rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />--%>
                    <%--<rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="KULLANICILAR" />
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource7" Name="OKULRESIM" />--%>
                   <%-- <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DUYURULAR" />
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource3" Name="ODEVLER" />
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource4" Name="DAMLACIKLAR" />
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource5" Name="OZELNOT" />
                    <rsweb:ReportDataSource DataSourceId="SqlDataSource6" Name="ODEVSNC" />--%>
                </DataSources>
                
                <%--<DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>--%>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:SqlDataSource ID="SDS_Haftalar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT HFT_ID, HFT_AD FROM HAFTALAR">
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

        <asp:SqlDataSource ID="SDS_Duyurular" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT        DUYURULAR.DYR_METIN, KULLANICILAR.KUL_AD, DUYURULAR.SUB_ADS
FROM            DUYURULAR INNER JOIN
                         KULLANICILAR ON DUYURULAR.KUL_ID = KULLANICILAR.KUL_ID
WHERE        (DUYURULAR.OKL_ID = @OKL_ID) AND (DUYURULAR.HFT_ID = @HFT_ID)
ORDER BY DUYURULAR.DRY_TAR DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="OKL_ID" />
                <asp:Parameter DefaultValue="2" Name="HFT_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Odevler" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT        ODEVLER.ODV_METIN, ODEVLER.SUB_ADS, KULLANICILAR.KUL_AD
FROM            ODEVLER INNER JOIN
                         KULLANICILAR ON ODEVLER.KUL_ID = KULLANICILAR.KUL_ID
WHERE        (ODEVLER.HFT_ID = @HFT_ID) AND (ODEVLER.OKL_ID = @OKL_ID)
ORDER BY ODEVLER.ODV_TAR DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="OKL_ID" />
                <asp:Parameter DefaultValue="2" Name="HFT_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Damlaciklar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT        DAMLACIKLAR.DML_METIN, KULLANICILAR.KUL_AD, DAMLACIKLAR.SUB_ADS
FROM            DAMLACIKLAR INNER JOIN
                         KULLANICILAR ON DAMLACIKLAR.KUL_ID = KULLANICILAR.KUL_ID
WHERE        (DAMLACIKLAR.OKL_ID = @OKL_ID) AND (DAMLACIKLAR.HFT_ID = @HFT_ID)
ORDER BY DAMLACIKLAR.DML_TAR DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="OKL_ID" />
                <asp:Parameter DefaultValue="2" Name="HFT_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_OzelNot" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT        OZELNOT.KUL_ID, OZELNOT.OZN_NOT, KULLANICILAR.KUL_AD
FROM            OZELNOT INNER JOIN
                         OZELNOTLAR ON OZELNOT.OZL_ID = OZELNOTLAR.OZL_ID INNER JOIN
                         KULLANICILAR ON OZELNOTLAR.KUL_ID = KULLANICILAR.KUL_ID
WHERE        (OZELNOT.OZN_AKTIF = 1) AND (OZELNOT.HFT_ID = @HFT_ID) AND (OZELNOTLAR.OKL_ID = @OKL_ID)
ORDER BY OZELNOT.OZN_TAR DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="HFT_ID" />
                <asp:Parameter DefaultValue="3" Name="OKL_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SDS_OdevSnc" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT ODEVSNC.KUL_ID, ODEVSNC.ODE_NOT, KULLANICILAR.KUL_AD, ODEVSNC.ODE_SNC FROM ODEVSNC INNER JOIN ODEVSNCLAR ON ODEVSNC.SNC_ID = ODEVSNCLAR.SNC_ID INNER JOIN KULLANICILAR ON ODEVSNCLAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (ODEVSNC.HFT_ID = @HFT_ID) AND (ODEVSNC.ODE_AKTIF = 1) AND (ODEVSNCLAR.OKL_ID = @OKL_ID) ORDER BY ODEVSNC.ODE_TAR DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="HFT_ID" />
                <asp:Parameter DefaultValue="3" Name="OKL_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Sinavlar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SINAVLAR.SNV_ID, SINAVLAR.SNV_AD, DRSSNVSNC.KUL_ID, DERSLER.DRS_AD, DRSSNVSNC.DSN_SS, DRSSNVSNC.DSN_DS, DRSSNVSNC.DSN_YS, DRSSNVSNC.DSN_NS, DRSSNVSNC.DSN_SRASUB, DRSSNVSNC.DSN_SRASNF, DRSSNVSNC.DSN_SRAOKL, DRSSNVSNC.DSN_BSRYZD, DRSSNVSNC.DSN_BSRYRM, SINAVSNC.SNS_SS, SINAVSNC.SNS_DS, SINAVSNC.SNS_YS, SINAVSNC.SNS_NS, SINAVSNC.SNS_SRASUB, SINAVSNC.SNS_SRASNF, SINAVSNC.SNS_SRAOKL, SINAVSNC.SNS_BSRYZD, SINAVSNC.SNS_BSRYRM, SINAVSNC.SNS_PUAN FROM SINAVLAR INNER JOIN DRSSNVSNC ON SINAVLAR.SNV_ID = DRSSNVSNC.SNV_ID INNER JOIN DERSLER ON DRSSNVSNC.DRS_ID = DERSLER.DRS_ID INNER JOIN SINAVSNC ON DRSSNVSNC.KUL_ID = SINAVSNC.KUL_ID AND DRSSNVSNC.SNV_ID = SINAVSNC.SNV_ID WHERE (SINAVLAR.SNV_DEG = 1) AND (SINAVLAR.HFT_ID = @HFT_ID) AND (SINAVLAR.OKL_ID = @OKL_ID) AND (SINAVLAR.SNV_KARNE = 1)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="HFT_ID" />
                <asp:Parameter DefaultValue="3" Name="OKL_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_DersNot" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT KARNEDERSNOT.KDN_ID, DERSLER.DRS_AD, KARNEDERSNOT.KUL_ID, KARNEDERSNOT.KDN_S1, KARNEDERSNOT.KDN_S2, KARNEDERSNOT.KDN_S3, KARNEDERSNOT.KDN_S4, KARNEDERSNOT.KDN_PROORT, KARNEDERSNOT.KDN_PERORT, KARNEDERSNOT.KDN_NOT, KARNEDERSNOT.KDN_PUAN FROM KARNEDERSNOT INNER JOIN DERSLER ON KARNEDERSNOT.DRS_ID = DERSLER.DRS_ID INNER JOIN KULLANICILAR ON KARNEDERSNOT.KUL_ID = KULLANICILAR.KUL_ID WHERE (KULLANICILAR.OKL_ID = @OKL_ID)">
            <SelectParameters>
                <asp:Parameter Name="OKL_ID" />
            </SelectParameters>
        </asp:SqlDataSource>

      <asp:SqlDataSource ID="SDS_Planlar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT        HPL_ID, HPL_PTESI, HPL_IPTESI, HPL_SALI, HPL_ISALI, HPL_CARS, HPL_ICARS, HPL_PERS, HPL_IPERS, HPL_CUMA, HPL_ICUMA, SUB_ADS
FROM            AOPLANLAR
WHERE        (HFT_ID = @HFT_ID) AND (OKL_ID = @OKL_ID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="HFT_ID" />
                <asp:Parameter DefaultValue="1" Name="OKL_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SDS_Degerler" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT        DEGEREGITIM.DGE_METIN, DEGEREGITIM.SUB_ADS, KULLANICILAR.KUL_AD
FROM            DEGEREGITIM INNER JOIN
                         KULLANICILAR ON DEGEREGITIM.KUL_ID = KULLANICILAR.KUL_ID
WHERE        (DEGEREGITIM.HFT_ID = @HFT_ID) AND (DEGEREGITIM.OKL_ID = @OKL_ID)
ORDER BY DEGEREGITIM.DGE_TAR DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="HFT_ID" />
                <asp:Parameter DefaultValue="3" Name="OKL_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
      <%--  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT KULLANICILAR.KUL_ID, KULLANICILAR.KUL_NO, SUBELER.SUB_AD, KULLANICILAR.OKL_ID, KULLANICILAR.KUL_ISIM, KULLANICILAR.KUL_SOYISIM, KULLANICILAR.KUL_SIFRE FROM KULLANICILAR INNER JOIN SUBELER ON KULLANICILAR.SUB_ID = SUBELER.SUB_ID WHERE (KULLANICILAR.OKL_ID = @OKL_ID)">
            <SelectParameters>
                <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT OKULLAR.OKL_ADI, RESIMLER.RSM_TYPE, RESIMLER.RSM_IMG FROM OKULLAR INNER JOIN RESIMLER ON OKULLAR.RSM_ID = RESIMLER.RSM_ID WHERE (OKULLAR.OKL_ID = @OKL_ID)">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                    </SelectParameters>
                </asp:SqlDataSource>--%>
        
            </div>
		</div>
	</div>
        </div>
    </asp:Panel>

</asp:Content>
