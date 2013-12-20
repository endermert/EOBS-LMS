<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yonet_Davranislar.aspx.cs" Inherits="EOBS_001.Yonet_Davranislar" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="ContentBranslar" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">DAVRANIS YONETiMi <span> </span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">

            <telerik:RadScriptManager ID="RadScriptManager1" Runat="server"></telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="GridDavranis">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridDavranis" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <telerik:RadGrid ID="GridDavranis" runat="server" CellSpacing="0" DataSourceID="EDS_Davranislar" GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
            <ExportSettings FileName="EOBS_Branslar">
                <Excel Format="Biff" />

            </ExportSettings>
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Davranislar" AutoGenerateColumns="False" DataKeyNames="DVR_ID" CommandItemSettings-AddNewRecordText="Yeni Branş Ekle" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" NoMasterRecordsText="Kayıt Yok">
                <%--<CommandItemSettings ShowExportToExcelButton="true" >
                </CommandItemSettings>--%>
    
<CommandItemSettings AddNewRecordText="Yeni Davranış Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <%--<telerik:GridBoundColumn DataField="DVR_ID" FilterControlAltText="Filter DVR_ID column" HeaderText="DVR_ID" SortExpression="DVR_ID" UniqueName="DVR_ID" DataType="System.Int32" ReadOnly="True">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="SNF_ID" DataSourceID="EDS_Siniflar" HeaderText="SINIF" ListTextField="SNF_AD" ListValueField="SNF_ID" UniqueName="SNF_ID">
                            <HeaderStyle Width="100" HorizontalAlign="Center" />
                        </telerik:GridDropDownColumn>
                        <telerik:GridBoundColumn DataField="DVR_AD" FilterControlAltText="Filter DVR_AD column" HeaderText="TANIM" SortExpression="DVR_AD" UniqueName="DVR_AD">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="SNF_ID" DataType="System.Int32" FilterControlAltText="Filter SNF_ID column" HeaderText="SNF_ID" SortExpression="SNF_ID" UniqueName="SNF_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridCheckBoxColumn DataField="DVR_OLUMLU" DataType="System.Boolean" FilterControlAltText="Filter DVR_OLUMLU column" HeaderText="OLUMLU" SortExpression="DVR_OLUMLU" UniqueName="DVR_OLUMLU">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="DVR_NOT" DataType="System.Int16" FilterControlAltText="Filter DVR_NOT column" HeaderText="NOT" SortExpression="DVR_NOT" UniqueName="DVR_NOT">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
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
		
		<asp:EntityDataSource ID="EDS_Davranislar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="DAVRANISLAR" EntityTypeFilter="DAVRANISLAR">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="EDS_Siniflar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SINIFLAR" Select="it.[SNF_ID], it.[SNF_AD]" AutoGenerateWhereClause="True" Where="">
             <WhereParameters>
                 <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
             </WhereParameters>
         </asp:EntityDataSource>
            </div>
		</div>
	</div>
</asp:Content>
