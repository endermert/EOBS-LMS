<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OGR_Damlalar.aspx.cs" Inherits="EOBS_001.OGR_Damlalar" %>
<asp:Content ID="ContentDamlalar" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
     <telerik:RadCodeBlock ID="Block3" runat="server">
                <%if (Session["OkulTur"].ToString() != "111")
                {
                %>  
			        <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">REHBERLiK SERViSi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Damlaciklar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT DAMLACIKLAR.DML_METIN, KULLANICILAR.KUL_ADSOYAD FROM DAMLACIKLAR INNER JOIN KULLANICILAR ON DAMLACIKLAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (DAMLACIKLAR.OKL_ID = @OKL_ID) AND (DAMLACIKLAR.SUB_ADS LIKE @SUB_AD) ORDER BY DAMLACIKLAR.DML_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="OKL_ID" />
                        <asp:Parameter Name="SUB_AD" />
                    </SelectParameters>
                </asp:SqlDataSource>
           <telerik:RadGrid ID="Grid4" PageSize="20" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_Damlaciklar" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_Damlaciklar" AutoGenerateColumns="False" NoMasterRecordsText="Bu Hafta İçin Duyurunuz Yok.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="DML_METIN" HeaderText="DAMLACIK METNİ" UniqueName="DML_METIN" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_ADSOYAD" HeaderText="REHBER ÖĞRETMEN" UniqueName="KUL_ADSOYAD" >
                            <HeaderStyle Width="160" />
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

            <FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
            </div>
		</div>
	</div>
                <%} %>
                <%if (Session["OkulTur"].ToString() == "111")
                {
                %>  
			        <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">HAYDi TEKRAR EDELiM<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Damlaciklar1" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT DAMLACIKLAR.DML_METIN, KULLANICILAR.KUL_ADSOYAD FROM DAMLACIKLAR INNER JOIN KULLANICILAR ON DAMLACIKLAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (DAMLACIKLAR.OKL_ID = @OKL_ID) AND (DAMLACIKLAR.SUB_ADS LIKE @SUB_AD) ORDER BY DAMLACIKLAR.DML_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="OKL_ID" />
                        <asp:Parameter Name="SUB_AD" />
                    </SelectParameters>
                </asp:SqlDataSource>
           <telerik:RadGrid ID="Grid6" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_Damlaciklar" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_Damlaciklar1" AutoGenerateColumns="False" NoMasterRecordsText="Bu Hafta İçin Duyurunuz Yok.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="DML_METIN" HeaderText="DAMLACIK METNİ" UniqueName="DML_METIN" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_ADSOYAD" HeaderText="REHBER ÖĞRETMEN" UniqueName="KUL_ADSOYAD" >
                            <HeaderStyle Width="160" />
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

            <FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
            </div>
		</div>
	</div>
                <%} %>
            </telerik:RadCodeBlock>
</asp:Content>
