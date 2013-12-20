<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yonet_Dersler.aspx.cs" Inherits="EOBS_001.Yonet_Dersler" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="ContentDersler" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Ders Yönetimi <span>Aktif okul için dersleri tanımlayabilirsiniz.</span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
    
        <telerik:RadScriptManager ID="RadScriptManager1" Runat="server"></telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="GridDersler">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridDersler" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <telerik:RadGrid ID="GridDersler" runat="server" CellSpacing="0" DataSourceID="EDS_Dersler" GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" PageSize="10" AllowAutomaticUpdates="True">
            <ExportSettings FileName="EOBS_Dersler">
                <Excel Format="Biff" />

            </ExportSettings>
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Dersler" AutoGenerateColumns="False" DataKeyNames="DRS_ID" CommandItemSettings-AddNewRecordText="Yeni Ders Ekle" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top">
                <%--<CommandItemSettings ShowExportToExcelButton="true" >
                </CommandItemSettings>--%>
    
<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn Visible="false" DataField="DRS_ID" DataType="System.Int32" FilterControlAltText="Filter DRS_ID column" HeaderText="DRS_ID" ReadOnly="True" SortExpression="DRS_ID" UniqueName="DRS_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DRS_AD" FilterControlAltText="Filter DRS_AD column" HeaderText="DERS ADI" SortExpression="DRS_AD" UniqueName="DRS_AD">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn Visible="false" DataField="DRS_SIRA" DataType="System.Int32" FilterControlAltText="Filter DRS_SIRA column" HeaderText="SIRA" SortExpression="DRS_SIRA" UniqueName="DRS_SIRA">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridEditCommandColumn ButtonType="PushButton" EditText="Düzenle" UniqueName="EditCommandColumn">
                            <HeaderStyle Width="60px"></HeaderStyle>
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn  ConfirmText="Siliniyor..Onaylıyor musunuz?" ConfirmDialogType="RadWindow"
                            ConfirmTitle="Siliniyor.." ButtonType="PushButton" CommandName="Delete" Text="Sil" UniqueName="DeleteColumn">
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
		
		<asp:EntityDataSource ID="EDS_Dersler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="DERSLER" EntityTypeFilter="DERSLER">
        </asp:EntityDataSource>
        
        </div>
		</div>
	</div>
</asp:Content>
