<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RPR_SinavSonucListesii.aspx.cs" Inherits="EOBS_001.RPR_SinavSonucListesii" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="ContentSonucListesi" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">SINAV SONUC LiSTESi RAPORLA<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server" />
                <asp:SqlDataSource ID="SDS_Liste" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SNV_ID, SNV_AD FROM SINAVLAR WHERE (OKL_ID = @OKL_ID) ORDER BY SNV_EKLTAR DESC">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulID" DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                <div style="margin:10px;">
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label runat="server" ID="lbl" Text="SINAV :"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <telerik:RadComboBox ID="cb" Runat="server" Skin="WebBlue" DataSourceID="SDS_Liste" DataTextField="SNV_AD" DataValueField="SNV_ID" EmptyMessage="SEÇİNİZ.." Width="250"></telerik:RadComboBox>
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

 <asp:Panel runat="server" ID="Panel1">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">SINAV SONUC LiSTESi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <div style="margin:10px;">
                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Tahoma" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Height="600px" EnableTheming="False" ExportContentDisposition="AlwaysInline" Font-Bold="True">
                        <LocalReport ReportPath="RPR_Randevular.rdlc" >
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DataSet1" />
                                <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSet2" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                </div>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT RDSLISTE.RDL_ID, RDSLISTE.RDS_ID, DERSLER.DRS_AD, RDSDERSLER.RDS_KONU, RDSDERSLER.RDS_YER, RDSDERSLER.RDS_ZAMAN, RDSDERSLER.RDS_KONT, RDSDERSLER.RDS_AKTIF, KULLANICILAR.KUL_ISIM, KULLANICILAR.KUL_SOYISIM, KULLANICILAR.KUL_NO, KULLANICILAR.KUL_CINSIYET, SUBELER.SUB_AD FROM RDSLISTE INNER JOIN KULLANICILAR ON RDSLISTE.KUL_ID = KULLANICILAR.KUL_ID INNER JOIN RDSDERSLER ON RDSLISTE.RDS_ID = RDSDERSLER.RDS_ID INNER JOIN DERSLER ON RDSDERSLER.DRS_ID = DERSLER.DRS_ID INNER JOIN SUBELER ON KULLANICILAR.SUB_ID = SUBELER.SUB_ID WHERE (RDSLISTE.RDS_ID = @RDS_ID)">
                     <SelectParameters>
                         <asp:QueryStringParameter DbType="Int32" DefaultValue="0" Name="RDS_ID" QueryStringField="ref" />
                     </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT OKULLAR.OKL_ADI, RESIMLER.RSM_TYPE, RESIMLER.RSM_IMG FROM OKULLAR INNER JOIN RESIMLER ON OKULLAR.RSM_ID = RESIMLER.RSM_ID WHERE (OKULLAR.OKL_ID = @OKL_ID)">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                    </SelectParameters>
                </asp:SqlDataSource>
        
            </div>
		</div>
	</div>
    </asp:Panel>
</asp:Content>
