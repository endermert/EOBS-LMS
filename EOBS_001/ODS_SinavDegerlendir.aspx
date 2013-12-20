<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ODS_SinavDegerlendir.aspx.cs" Inherits="EOBS_001.ODS_SinavDegerlendir" %>
<asp:Content ID="ContentSinavDegerlendir" ContentPlaceHolderID="MainContent" runat="server">
      <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Sinav Degerlendirme<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
             <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
             <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="GridDamla">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="GridDamla" LoadingPanelID="RadAjaxLoadingPanel1">
                            </telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
               <telerik:RadGrid ID="GridDamla" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="EDS_Sinavlar" OnSelectedIndexChanged="GridDamla_SelectedIndexChanged" OnDeleteCommand="GridDamla_DeleteCommand" >
                
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Sinavlar" AutoGenerateColumns="False" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="None" DataKeyNames="SNV_ID" NoMasterRecordsText="Kayıt Yok">
    
<CommandItemSettings AddNewRecordText="Yeni Sınav Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                    
                    <Columns >
                        <telerik:GridBoundColumn DataField="SNV_ID" DataType="System.Int32" ReadOnly="True" UniqueName="SNV_ID" FilterControlAltText="Filter SNV_ID column" HeaderText="SNV_ID" SortExpression="SNV_ID" Visible="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNV_AD" HeaderText="SINAV ADI"  UniqueName="SNV_AD">
                        </telerik:GridBoundColumn>
                        <telerik:GridDropDownColumn  DropDownControlType="DropDownList" DataField="SDT_ID" DataSourceID="EDS_SinavDetay" HeaderText="DETAYLAR" ListTextField="SDT_AD" ListValueField="SDT_ID" UniqueName="SDT_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ.." >
                            <HeaderStyle Width="100" />
                        </telerik:GridDropDownColumn>
                        <telerik:GridDropDownColumn  DropDownControlType="DropDownList" DataField="SNF_ID" DataSourceID="EDS_Sinif" HeaderText="SINIF" ListTextField="SNF_AD" ListValueField="SNF_ID" UniqueName="SNF_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ.." >
                            <HeaderStyle Width="60" />
                        </telerik:GridDropDownColumn>
                        <%--<telerik:GridBoundColumn DataField="SDT_ID" HeaderText="SDT_ID" UniqueName="SDT_ID" DataType="System.Int32" FilterControlAltText="Filter SDT_ID column" SortExpression="SDT_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="SNF_ID" DataType="System.Int32" HeaderText="SNF_ID" UniqueName="SNF_ID" FilterControlAltText="Filter SNF_ID column" SortExpression="SNF_ID">
                        </telerik:GridBoundColumn>--%>
                       <%-- <telerik:GridBoundColumn DataField="OKL_ID" DataType="System.Int32" HeaderText="OKL_ID" UniqueName="OKL_ID" FilterControlAltText="Filter OKL_ID column" SortExpression="OKL_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="SNV_KACY1D" HeaderText="DOĞRU/YANLIŞ" UniqueName="SNV_KACY1D" DataType="System.Int16" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="SNV_KB" DataType="System.Boolean" HeaderText="B KİTAPÇIKĞI" UniqueName="SNV_KB" Visible="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="SNV_KC" DataType="System.Boolean" HeaderText="C KİTAPÇIĞI" UniqueName="SNV_KC" Visible="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="SNV_KD" DataType="System.Boolean" HeaderText="D KİTAPÇIĞI" UniqueName="SNV_KD" Visible="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="SNV_DEG" DataType="System.Boolean" HeaderText="DEG.?" UniqueName="SNV_DEG">
                            <HeaderStyle Width="60" HorizontalAlign="Center" />                            
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridDateTimeColumn  DataField="SNV_DEGTAR" DataType="System.DateTime" HeaderText="TARİH" UniqueName="SNV_DEGTAR">
                            <HeaderStyle Width="70" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridDateTimeColumn>
                        <telerik:GridButtonColumn  ConfirmText="Bu Sınava Ait Tüm Veriler SİLİNECEK .. Onaylıyor Musunuz?" ConfirmDialogType="RadWindow"  CommandArgument="TEM"
                            ConfirmTitle="Temizle.." ButtonType="PushButton" CommandName="Delete" Text="Temizle" UniqueName="DeleteColumn">
                            <HeaderStyle Width="70px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                        <telerik:GridButtonColumn  ConfirmText="Bu Sınav Değerlendirilecek.. Onaylıyor musunuz?" ConfirmDialogType="RadWindow"  CommandArgument="DEG"
                            ConfirmTitle="Değerlendir.." ButtonType="PushButton" CommandName="Delete" Text="Değerlendir" UniqueName="DeleteColumn">
                            <HeaderStyle Width="70px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                        <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" Text="Txt" >
                            <HeaderStyle Width="45px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                         <%--<telerik:GridEditCommandColumn ButtonType="PushButton" EditText="Düzenle" UniqueName="EditCommandColumn">
                            <HeaderStyle Width="60px"></HeaderStyle>
                        </telerik:GridEditCommandColumn> --%>
                        
                    </Columns>
                    
                    <EditFormSettings ColumnNumber="4"  >
                        <EditColumn ButtonType="PushButton" CancelText="İptal" InsertText="Kaydet" UpdateText="Güncelle" />
                     </EditFormSettings>
                    <EditItemStyle BackColor="Yellow" />
                    
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
                
                <asp:EntityDataSource ID="EDS_Sinavlar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="SINAVLAR" EntityTypeFilter="SINAVLAR" AutoGenerateWhereClause="true" >
                </asp:EntityDataSource>
		
		
                <asp:EntityDataSource ID="EDS_SinavDetay" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SINAVDETAY" Select="it.[SDT_ID], it.[SDT_AD]" >
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Sinif" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SINIFLAR" Select="it.[SNF_ID], it.[SNF_AD]" AutoGenerateWhereClause="true">
                </asp:EntityDataSource>
		
		
            </div>
		</div>
	</div>
</asp:Content>
