<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index1.aspx.cs" Inherits="EOBS_001.index1" %>
<asp:Content ID="ContentIndex1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">DUYURULAR (SON 3)<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Duyurular" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT TOP 3 DUYURULAR.DYR_METIN, KULLANICILAR.KUL_ADSOYAD FROM DUYURULAR INNER JOIN KULLANICILAR ON DUYURULAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (DUYURULAR.SUB_ADS LIKE @SUB_AD) AND (DUYURULAR.OKL_ID = @OKL_ID) ORDER BY DUYURULAR.DRY_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="SUB_AD" />
                        <asp:Parameter Name="OKL_ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
           <telerik:RadGrid ID="Grid1" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_Duyurular" >
            
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
    
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">SiZE OZEL NOTLAR (SON 3)<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_OzelNot" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT TOP 3 OZELNOT.OZN_NOT, KULLANICILAR.KUL_ADSOYAD FROM OZELNOT INNER JOIN OZELNOTLAR ON OZELNOT.OZL_ID = OZELNOTLAR.OZL_ID INNER JOIN KULLANICILAR ON OZELNOTLAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (OZELNOT.KUL_ID = @KUL_ID) AND (OZELNOT.OZN_AKTIF = 1) ORDER BY OZELNOT.OZN_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="KUL_ID" DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <telerik:RadGrid ID="Grid2" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_OzelNot" >
            
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

    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
             <telerik:RadCodeBlock ID="Block1" runat="server">
                <%if (Session["OkulTur"].ToString() != "111")
                {
                %>  
			        <h2 class="box_head">ODEVLER (SON 3)<span></span></h2>
                <%} %>
                <%if (Session["OkulTur"].ToString() == "111")
                {
                %>  
			        <h2 class="box_head">EV CALISMALARI (SON 3)<span></span></h2>
                <%} %>
            </telerik:RadCodeBlock>
			
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Odevler" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT TOP 3 ODEVLER.ODV_METIN, KULLANICILAR.KUL_ADSOYAD FROM ODEVLER INNER JOIN KULLANICILAR ON ODEVLER.KUL_ID = KULLANICILAR.KUL_ID WHERE (ODEVLER.OKL_ID = @OKL_ID) AND (ODEVLER.SUB_ADS LIKE @SUB_AD) ORDER BY ODEVLER.ODV_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="OKL_ID" />
                        <asp:Parameter Name="SUB_AD" />
                    </SelectParameters>
                </asp:SqlDataSource>
           <telerik:RadGrid ID="Grid3" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_Odevler" >
            
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
    <telerik:RadCodeBlock ID="Block2" runat="server">
                <%if (Session["OkulTur"].ToString() != "111")
                {
                %>  
<div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">ODEVLER SONUCLARI (SON 3)<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_OdevSnc" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT TOP 3 ODEVSNC.ODE_SNC, ODEVSNC.ODE_NOT, KULLANICILAR.KUL_ADSOYAD FROM ODEVSNC INNER JOIN ODEVSNCLAR ON ODEVSNC.SNC_ID = ODEVSNCLAR.SNC_ID INNER JOIN KULLANICILAR ON ODEVSNCLAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (ODEVSNC.ODE_AKTIF = 1) AND (ODEVSNC.KUL_ID = @KUL_ID) AND (ODEVSNC.HFT_ID = @HFT_ID) ORDER BY ODEVSNC.ODE_TAR DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="KUL_ID" SessionField="KulId" />
                        <asp:SessionParameter Name="HFT_ID" SessionField="AktifHaftaId" />
                    </SelectParameters>
                </asp:SqlDataSource>
           <telerik:RadGrid ID="Grid5" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_OdevSnc" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_OdevSnc" AutoGenerateColumns="False" NoMasterRecordsText="Ödev Sonucu Girilmemiş.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="ODE_SNC" HeaderText="DURUM" UniqueName="ODE_SNC"  >
                            <HeaderStyle Width="100" HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ODE_NOT" HeaderText="MESAJ" UniqueName="ODE_NOT" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_ADSOYAD"  HeaderText="ÖDEV VEREN" UniqueName="KUL_ADSOYAD">
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
                <%} %>
            </telerik:RadCodeBlock>
 
    <telerik:RadCodeBlock ID="Block3" runat="server">
                <%if (Session["OkulTur"].ToString() != "111")
                {
                %>  
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">REHBERLiK SERViSi (SON 3)<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Damlaciklar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT TOP 3 DAMLACIKLAR.DML_METIN, KULLANICILAR.KUL_ADSOYAD FROM DAMLACIKLAR INNER JOIN KULLANICILAR ON DAMLACIKLAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (DAMLACIKLAR.OKL_ID = @OKL_ID) AND (DAMLACIKLAR.SUB_ADS LIKE @SUB_AD) ORDER BY DAMLACIKLAR.DML_TAR DESC">
                    <SelectParameters>
                        <asp:Parameter Name="OKL_ID" />
                        <asp:Parameter Name="SUB_AD" />
                    </SelectParameters>
                </asp:SqlDataSource>
           <telerik:RadGrid ID="Grid4" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_Damlaciklar" >
            
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
			<h2 class="box_head">HAYDi TEKRAR EDELiM (SON 3)<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_Damlaciklar1" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT TOP 3 DAMLACIKLAR.DML_METIN, KULLANICILAR.KUL_ADSOYAD FROM DAMLACIKLAR INNER JOIN KULLANICILAR ON DAMLACIKLAR.KUL_ID = KULLANICILAR.KUL_ID WHERE (DAMLACIKLAR.OKL_ID = @OKL_ID) AND (DAMLACIKLAR.SUB_ADS LIKE @SUB_AD) ORDER BY DAMLACIKLAR.DML_TAR DESC">
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
