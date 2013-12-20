<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OGR_Odevler.aspx.cs" Inherits="EOBS_001.OGR_Odevler" %>
<asp:Content ID="ContentOgrOdevler" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
             <telerik:RadCodeBlock ID="Block1" runat="server">
                <%if (Session["OkulTur"].ToString() != "111")
                {
                %>  
			        <h2 class="box_head">ODEVLER<span></span></h2>
                <%} %>
                <%if (Session["OkulTur"].ToString() == "111")
                {
                %>  
			        <h2 class="box_head">EV CALISMALARI<span></span></h2>
                <%} %>
            </telerik:RadCodeBlock>
			
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Odevler" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT ODEVLER.ODV_METIN, KULLANICILAR.KUL_ADSOYAD FROM ODEVLER INNER JOIN KULLANICILAR ON ODEVLER.KUL_ID = KULLANICILAR.KUL_ID WHERE (ODEVLER.OKL_ID = @OKL_ID) AND (ODEVLER.SUB_ADS LIKE @SUB_AD) ORDER BY ODEVLER.ODV_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="OKL_ID" />
                        <asp:Parameter Name="SUB_AD" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
           <telerik:RadGrid ID="Grid3" PageSize="20" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_Odevler" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_Odevler" AutoGenerateColumns="False" NoMasterRecordsText="Bu Hafta İçin Ev Çalışması Yok.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="ODV_METIN" HeaderText="ÖDEV METNİ" UniqueName="ODV_METIN" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_ADSOYAD" HeaderText="ÖDEV VEREN" UniqueName="KUL_ADSOYAD">
                            <HeaderStyle Width="160" />
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings >
                        <EditColumn ButtonType="PushButton" CancelText="İptal" InsertText="Kaydet" UpdateText="Güncelle" />
                    </EditFormSettings>
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

            <FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
            </div>
		</div>
	</div>
</asp:Content>
