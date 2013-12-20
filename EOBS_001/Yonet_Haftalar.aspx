<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yonet_Haftalar.aspx.cs" Inherits="EOBS_001.Yonet_Haftalar" %>
<asp:Content ID="ContentHaftalar" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Hafta Yönetimi <span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
             <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
             <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="GridHafta">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="GridHafta" LoadingPanelID="RadAjaxLoadingPanel1">
                            </telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
               <telerik:RadGrid ID="GridHafta" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="EDS_Haftalar" OnSelectedIndexChanged="GridHafta_SelectedIndexChanged" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Haftalar" AutoGenerateColumns="False" CommandItemSettings-AddNewRecordText="Yeni Hafta Ekle" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" DataKeyNames="HFT_ID" NoMasterRecordsText="Kayıt Yok">
    
<CommandItemSettings AddNewRecordText="Yeni Hafta Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                     
                        <telerik:GridBoundColumn DataField="HFT_ID" DataType="System.Int32" Visible="false" HeaderText="HFT_ID" ReadOnly="True"  UniqueName="HFT_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="HFT_AD" HeaderText="HAFTA ADI" UniqueName="HFT_AD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="HFT_DETAY" HeaderText="AÇIKLAMA" UniqueName="HFT_DETAY" Visible="false">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="HFT_BITTAR" DataType="System.DateTime" HeaderText="BİTİŞ TARİHİ" UniqueName="HFT_BITTAR">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDateTimeColumn DataField="HFT_BITTAR" DataType="System.DateTime" DataFormatString="{0:dd.MM.yyyy}"  HeaderText="BİTİŞ TARİHİ" UniqueName="HFT_BITTAR">
                            <HeaderStyle Width="90px" HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" />
                           
                        </telerik:GridDateTimeColumn>
                        <telerik:GridCheckBoxColumn DataField="HFT_IZINVELI" DataType="System.Boolean" HeaderText="İZİNLER" UniqueName="HFT_IZINVELI" Visible="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="HFT_AKTIF" DataType="System.Boolean" HeaderText="AKTİF" UniqueName="HFT_AKTIF">
                            <HeaderStyle Width="40px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridEditCommandColumn ButtonType="PushButton" EditText="Düzenle" UniqueName="EditCommandColumn">
                            <HeaderStyle Width="60px"></HeaderStyle>
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn  ConfirmText="Siliniyor..Onaylıyor musunuz?" ConfirmDialogType="RadWindow"
                            ConfirmTitle="Siliniyor.." ButtonType="PushButton" CommandName="Delete" Text="Sil" UniqueName="DeleteColumn">
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                        <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" Text="Seç" >
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                    </Columns>
                    <EditFormSettings >
                        <EditColumn ButtonType="PushButton" CancelText="İptal" InsertText="Kaydet" UpdateText="Güncelle" />
                        
                    </EditFormSettings>
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
		
		
                <asp:EntityDataSource ID="EDS_Haftalar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="HAFTALAR" EntityTypeFilter="HAFTALAR" >
                </asp:EntityDataSource>
		
		
                <asp:SqlDataSource ID="DS1" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT * FROM [HAFTALAR]"></asp:SqlDataSource>
		
		
            </div>
		</div>
	</div>
</asp:Content>
