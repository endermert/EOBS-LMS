<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OGR_Duyurular.aspx.cs" Inherits="EOBS_001.OGR_Duyurular" %>
<asp:Content ID="ContentOgrDuyurular" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">DUYURULAR<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Duyurular" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT DUYURULAR.DYR_METIN, KULLANICILAR.KUL_ADSOYAD FROM DUYURULAR INNER JOIN KULLANICILAR ON DUYURULAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (DUYURULAR.SUB_ADS LIKE @SUB_AD) AND (DUYURULAR.OKL_ID = @OKL_ID) ORDER BY DUYURULAR.DRY_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="SUB_AD" />
                        <asp:Parameter Name="OKL_ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
           <telerik:RadGrid ID="Grid1" PageSize="20" runat="server" CellSpacing="0" GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_Duyurular" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_Duyurular" AutoGenerateColumns="False" NoMasterRecordsText="Bu Hafta İçin Duyurunuz Yok.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="DYR_METIN" HeaderText="DUYURU METNİ" UniqueName="DYR_METIN">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_ADSOYAD" HeaderText="GÖNDEREN" UniqueName="KUL_ADSOYAD" >
                            <HeaderStyle Width="160"/>
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
