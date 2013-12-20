<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OGR_BanaOzel.aspx.cs" Inherits="EOBS_001.OGR_BanaOzel" %>
<asp:Content ID="ContentOgrBanaOzel" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">SiZE OZEL NOTLAR<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_OzelNot" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT OZELNOT.OZN_NOT, KULLANICILAR.KUL_ADSOYAD FROM OZELNOT INNER JOIN OZELNOTLAR ON OZELNOT.OZL_ID = OZELNOTLAR.OZL_ID INNER JOIN KULLANICILAR ON OZELNOTLAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (OZELNOT.KUL_ID = @KUL_ID) AND (OZELNOT.OZN_AKTIF = 1) ORDER BY OZELNOT.OZN_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="KUL_ID" DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                <telerik:RadGrid ID="Grid2" PageSize="20" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_OzelNot" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_OzelNot" AutoGenerateColumns="False" NoMasterRecordsText="Özel Notunuz Yok.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="OZN_NOT" HeaderText="NOT METNİ" UniqueName="OZN_NOT">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_ADSOYAD" HeaderText="GÖNDEREN" UniqueName="KUL_ADSOYAD">
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
