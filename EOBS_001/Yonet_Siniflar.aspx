<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yonet_Siniflar.aspx.cs" Inherits="EOBS_001.Yonet_Siniflar" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="ContentSiniflar" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Sınıf Yönetimi <span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">

         <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
         <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="GridSnflar">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridSnflar" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
          <telerik:RadGrid ID="GridSnflar" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="EDS_Siniflar">
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Siniflar" AutoGenerateColumns="False" CommandItemSettings-AddNewRecordText="Yeni Sınıf Ekle" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" DataKeyNames="SNF_ID" NoMasterRecordsText="Kayıt Yok">
    
<CommandItemSettings AddNewRecordText="Yeni Sınıf Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <%--<telerik:GridBoundColumn DataField="SNF_ID" FilterControlAltText="Filter SNF_ID column" HeaderText="SNF_ID" SortExpression="SNF_ID" UniqueName="SNF_ID" DataType="System.Int32" ReadOnly="True">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="SNF_AD" HeaderText="SINIF ADI" UniqueName="SNF_AD">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="SNF_SIRA" DataType="System.Int32" FilterControlAltText="Filter SNF_SIRA column" HeaderText="SNF_SIRA" SortExpression="SNF_SIRA" UniqueName="SNF_SIRA">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="KRN_ID" DataType="System.Int32" FilterControlAltText="Filter KRN_ID column" HeaderText="KARNE" SortExpression="KRN_ID" UniqueName="KRN_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DefaultInsertValue="-1" DataField="KRN_ID" DataSourceID="EDS_Karneler" HeaderText="KARNE TiPi" ListTextField="KRN_AD" ListValueField="KRN_ID" UniqueName="KRN_ID">
                        </telerik:GridDropDownColumn>
                        <%--<telerik:GridBoundColumn DataField="OKL_ID" DataType="System.Int32" FilterControlAltText="Filter OKL_ID column" HeaderText="OKUL" SortExpression="OKL_ID" UniqueName="OKL_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="OKL_ID" DataSourceID="EDS_Okullar" HeaderText="OKUL ADI" ListTextField="OKL_ADI" ListValueField="OKL_ID" UniqueName="OKL_ID">
                        </telerik:GridDropDownColumn>--%>
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

		
         <%--<telerik:GridBoundColumn DataField="SNF_ID" FilterControlAltText="Filter SNF_ID column" HeaderText="SNF_ID" SortExpression="SNF_ID" UniqueName="SNF_ID" DataType="System.Int32" ReadOnly="True">
                        </telerik:GridBoundColumn>--%>

		
         <asp:EntityDataSource ID="EDS_Siniflar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SINIFLAR" EntityTypeFilter="SINIFLAR" AutoGenerateWhereClause="True" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="">
             <WhereParameters>
                 <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" Direction="InputOutput" />
             </WhereParameters>
         </asp:EntityDataSource>
         <asp:EntityDataSource ID="EDS_Karneler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="KARNELER" Select="it.[KRN_ID], it.[KRN_AD]">
         </asp:EntityDataSource>
		
        </div>
		</div>
	</div>
</asp:Content>
