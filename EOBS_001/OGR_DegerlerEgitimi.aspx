<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OGR_DegerlerEgitimi.aspx.cs" Inherits="EOBS_001.OGR_DegerlerEgitimi" %>
<asp:Content ID="ContentDegerEgitim" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">DEGERLER EGiTiMi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Degerler" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT DEGEREGITIM.DGE_ID, DEGEREGITIM.DGE_AD, DEGEREGITIM.DGE_METIN, HAFTALAR.HFT_AD, KULLANICILAR.KUL_ADSOYAD FROM DEGEREGITIM INNER JOIN HAFTALAR ON DEGEREGITIM.HFT_ID = HAFTALAR.HFT_ID INNER JOIN KULLANICILAR ON DEGEREGITIM.KUL_ID = KULLANICILAR.KUL_ID WHERE (DEGEREGITIM.SUB_ADS LIKE @SUB_AD) AND (DEGEREGITIM.OKL_ID = @OKL_ID) ORDER BY DEGEREGITIM.DGE_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="SUB_AD" />
                        <asp:Parameter Name="OKL_ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
           <telerik:RadGrid ID="Grid1" PageSize="20" runat="server" CellSpacing="0" GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_Degerler" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_Degerler" AutoGenerateColumns="False" NoMasterRecordsText="Kayıt Yok." DataKeyNames="DGE_ID">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <%--<telerik:GridBoundColumn DataField="DGE_ID" HeaderText="DGE_ID" UniqueName="DGE_ID" DataType="System.Int32" FilterControlAltText="Filter DGE_ID column" ReadOnly="True" SortExpression="DGE_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="DGE_AD" HeaderText="DGE_AD" UniqueName="DGE_AD" >
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="DGE_METIN" HeaderText="EĞİTİM METNİ" UniqueName="DGE_METIN">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="HFT_AD" HeaderText="HAFTA" UniqueName="HFT_AD">
                            <HeaderStyle Width="60"/>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_ADSOYAD" HeaderText="ÖĞRETMEN" UniqueName="KUL_ADSOYAD">
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
