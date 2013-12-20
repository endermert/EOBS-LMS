<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yonet_Okullar.aspx.cs" Inherits="EOBS_001.Yonet_Okullar" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="ContentOkullar" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Okul Yönetimi <span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">

          <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
         <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="GridOkullar">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridOkullar" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
           <telerik:RadGrid ID="GridOkullar" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="EDS_Okullar" OnSelectedIndexChanged="GridOkullar_SelectedIndexChanged">
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Okullar" AutoGenerateColumns="False" CommandItemSettings-AddNewRecordText="Yeni Okul Ekle" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" DataKeyNames="OKL_ID" NoMasterRecordsText="Kayıt Yok">
<CommandItemSettings AddNewRecordText="Yeni Okul Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <%--<telerik:GridBoundColumn DataField="OKL_ID" DataType="System.Int32" FilterControlAltText="Filter OKL_ID column" HeaderText="OKL_ID" ReadOnly="True" SortExpression="OKL_ID" UniqueName="OKL_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn  DataField="OKL_KODU" HeaderText="OKUL KODU" UniqueName="OKL_KODU">
                            <HeaderStyle Width="100px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OKL_ADI" HeaderText="OKUL ADI" UniqueName="OKL_ADI">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OKL_KISA" HeaderText="KISA AD" UniqueName="OKL_KISA" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="OTR_KOD" DataSourceID="EDS_OkulTur" HeaderText="TÜR" ListTextField="OTR_AD" ListValueField="OTR_KOD" UniqueName="OTR_KOD" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ">
                        </telerik:GridDropDownColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="RSM_ID" DataSourceID="EDS_Resimler" HeaderText="RESİM" ListTextField="RSM_AD" ListValueField="RSM_ID" UniqueName="RSM_ID" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ">
                        </telerik:GridDropDownColumn>
                        <%--<telerik:GridBoundColumn DataField="OKL_SIRA" DataType="System.Int32" FilterControlAltText="Filter OKL_SIRA column" HeaderText="OKL_SIRA" SortExpression="OKL_SIRA" UniqueName="OKL_SIRA">
                        </telerik:GridBoundColumn>--%>
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
		
		
         <asp:EntityDataSource ID="EDS_Okullar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="OKULLAR" EntityTypeFilter="OKULLAR">
         </asp:EntityDataSource>
		


                <asp:EntityDataSource ID="EDS_OkulTur" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="OKULTUR" Select="it.[OTR_KOD], it.[OTR_AD]">
                </asp:EntityDataSource>
		


                <asp:EntityDataSource ID="EDS_Resimler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="RESIMLER" Select="it.[RSM_ID], it.[RSM_AD]" Where="" EntityTypeFilter="">
                </asp:EntityDataSource>
		


            </div>
		</div>
	</div>


</asp:Content>

