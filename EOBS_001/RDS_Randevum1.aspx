<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RDS_Randevum1.aspx.cs" Inherits="EOBS_001.RDS_Randevum1" %>
<asp:Content ID="ContentRandevum1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">RANDEVULU DERS SiSTEMi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:EntityDataSource ID="EDS_Dersler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="DERSLER" Select="it.[DRS_ID], it.[DRS_AD]">
            </asp:EntityDataSource>
            <asp:EntityDataSource ID="EDS_Siniflar" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SINIFLAR" Select="it.[SNF_ID], it.[SNF_AD]">
            </asp:EntityDataSource>
			<asp:EntityDataSource ID="EDS_RDSDersler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="RDSDERSLER" EntityTypeFilter="RDSDERSLER" AutoGenerateWhereClause="true">
            </asp:EntityDataSource>
			<asp:EntityDataSource ID="EDS_Ogretmenler" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="KULLANICILAR" Select="it.[KUL_ADSOYAD], it.[KUL_ID]" Where="">
                <WhereParameters>
                    <asp:Parameter DefaultValue="2" Name="YTK_ID" DbType="Int16" />
                </WhereParameters>
            </asp:EntityDataSource>
			<asp:SqlDataSource ID="SDS_RDSListe" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT RDSLISTE.RDL_ID, RDSDERSLER.KUL_ID, RDSDERSLER.RDS_ID, RDSDERSLER.RDS_KONU, RDSDERSLER.SNF_ID, RDSDERSLER.DRS_ID, RDSDERSLER.RDS_YER, RDSDERSLER.RDS_ZAMAN, RDSDERSLER.RDS_KONT, RDSDERSLER.RDS_KONTBOS, RDSDERSLER.RDS_EKLTAR, RDSDERSLER.RDS_AKTIF FROM RDSLISTE INNER JOIN RDSDERSLER ON RDSLISTE.RDS_ID = RDSDERSLER.RDS_ID WHERE (RDSLISTE.KUL_ID = @KUL_ID)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="KUL_ID" SessionField="KulId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
             <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="Grid1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Grid1" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Grid2" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="Grid2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Grid1" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Grid2" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
          <telerik:RadGrid ID="Grid1" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="EDS_RDSDersler" OnDeleteCommand="Grid1_DeleteCommand">
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_RDSDersler" AutoGenerateColumns="False"  DataKeyNames="RDS_ID" NoMasterRecordsText="Aktif Ders Yok.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="RDS_ID" HeaderText="RDS_ID" UniqueName="RDS_ID" DataType="System.Int32" ReadOnly="True"  Visible="false">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="KUL_ID" DataType="System.Int32" FilterControlAltText="Filter KUL_ID column" HeaderText="KUL_ID" SortExpression="KUL_ID" UniqueName="KUL_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="KUL_ID" DataSourceID="EDS_Ogretmenler" HeaderText="ÖĞRETMEN" ListTextField="KUL_ADSOYAD" ListValueField="KUL_ID" EmptyListItemText="SEÇİNİZ.." UniqueName="KUL_ID" EnableEmptyListItem="true">
                        </telerik:GridDropDownColumn>
                        <telerik:GridBoundColumn DataField="RDS_KONU" HeaderText="KONU" UniqueName="RDS_KONU">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="SNF_ID" DataType="System.Int32" FilterControlAltText="Filter SNF_ID column" HeaderText="SNF_ID" SortExpression="SNF_ID" UniqueName="SNF_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="SNF_ID" DataSourceID="EDS_Siniflar" HeaderText="SINIF" ListTextField="SNF_AD" ListValueField="SNF_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ.." UniqueName="SNF_ID">
                        </telerik:GridDropDownColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="DRS_ID" DataSourceID="EDS_Dersler" HeaderText="DERS" ListTextField="DRS_AD" ListValueField="DRS_ID"  EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ.." UniqueName="DRS_ID">
                        </telerik:GridDropDownColumn>
                        <telerik:GridBoundColumn DataField="RDS_KONT" DataType="System.Int16" HeaderText="KONT." UniqueName="RDS_KONT">
                            <HeaderStyle HorizontalAlign="Center" Width="40" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RDS_KONTBOS" DataType="System.Int16" HeaderText="BOŞ KONT." UniqueName="RDS_KONTBOS" ReadOnly="true">
                            <HeaderStyle HorizontalAlign="Center" Width="40" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RDS_YER" HeaderText="YER" UniqueName="RDS_YER">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RDS_ZAMAN" HeaderText="ZAMAN" UniqueName="RDS_ZAMAN">
                            <HeaderStyle HorizontalAlign="Center" Width="40" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="RDS_TAR" DataType="System.DateTime" EmptyDataText="25.01.2013" HeaderText="ZAMAN" UniqueName="RDS_TAR">
                        </telerik:GridBoundColumn>--%>
                       
                        
                        <%--<telerik:GridBoundColumn DataField="RDS_KONTBOS" DataType="System.Int16" FilterControlAltText="Filter RDS_KONTBOS column" HeaderText="RDS_KONTBOS" SortExpression="RDS_KONTBOS" UniqueName="RDS_KONTBOS">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="RDS_EKLTAR" DataType="System.DateTime" FilterControlAltText="Filter RDS_EKLTAR column" HeaderText="RDS_EKLTAR" SortExpression="RDS_EKLTAR" UniqueName="RDS_EKLTAR">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridDateTimeColumn EnableTimeIndependentFiltering="true" DataField="RDS_TAR" DataType="System.DateTime" HeaderText="ZAMAN" UniqueName="RDS_TAR">
                        </telerik:GridDateTimeColumn>--%>
                        <telerik:GridCheckBoxColumn DataField="RDS_AKTIF" DataType="System.Boolean" HeaderText="AKTİF" UniqueName="RDS_AKTIF" Visible="false">
                        </telerik:GridCheckBoxColumn>
                         <telerik:GridButtonColumn  ConfirmText="Randevu Alınsın mı?" ConfirmDialogType="RadWindow" CommandArgument="RDS"
                            ConfirmTitle="RDS" ButtonType="PushButton" CommandName="Delete" Text="RANDEVU AL" UniqueName="DeleteColumn">
                            <HeaderStyle Width="50px"></HeaderStyle>
                        </telerik:GridButtonColumn>
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
		<h2 class="box_head">ALINAN RANDEVULARINIZ <span></span></h2>
		<div class="controls">
			<a href="#" class="grabber"></a>
			<a href="#" class="toggle"></a>
		</div>
        <div class="toggle_container">
            <telerik:RadGrid ID="Grid2" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_RDSListe" OnDeleteCommand="Grid2_DeleteCommand">
            
        <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
            <MasterTableView DataSourceID="SDS_RDSListe" AutoGenerateColumns="False"  DataKeyNames="RDL_ID" NoMasterRecordsText="Alınan Randevunuz Yok.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                <Columns>
                    <telerik:GridBoundColumn DataField="RDL_ID" HeaderText="RDL_ID" UniqueName="RDL_ID" DataType="System.Int32" ReadOnly="True"  Visible="false">
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridBoundColumn DataField="KUL_ID" DataType="System.Int32" FilterControlAltText="Filter KUL_ID column" HeaderText="KUL_ID" SortExpression="KUL_ID" UniqueName="KUL_ID">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="KUL_ID" DataSourceID="EDS_Ogretmenler" HeaderText="ÖĞRETMEN" ListTextField="KUL_ADSOYAD" ListValueField="KUL_ID" EmptyListItemText="SEÇİNİZ.." UniqueName="KUL_ID" EnableEmptyListItem="true">
                    </telerik:GridDropDownColumn>
                    <telerik:GridBoundColumn DataField="RDS_KONU" HeaderText="KONU" UniqueName="RDS_KONU">
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridBoundColumn DataField="SNF_ID" DataType="System.Int32" FilterControlAltText="Filter SNF_ID column" HeaderText="SNF_ID" SortExpression="SNF_ID" UniqueName="SNF_ID">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="SNF_ID" DataSourceID="EDS_Siniflar" HeaderText="SINIF" ListTextField="SNF_AD" ListValueField="SNF_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ.." UniqueName="SNF_ID">
                    </telerik:GridDropDownColumn>
                    <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="DRS_ID" DataSourceID="EDS_Dersler" HeaderText="DERS" ListTextField="DRS_AD" ListValueField="DRS_ID"  EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ.." UniqueName="DRS_ID">
                    </telerik:GridDropDownColumn>
                    <%-- <telerik:GridBoundColumn DataField="RDS_KONT" DataType="System.Int16" HeaderText="KONT." UniqueName="RDS_KONT">
                        <HeaderStyle HorizontalAlign="Center" Width="40" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RDS_KONTBOS" DataType="System.Int16" HeaderText="BOŞ KONT." UniqueName="RDS_KONTBOS" ReadOnly="true">
                        <HeaderStyle HorizontalAlign="Center" Width="40" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn DataField="RDS_YER" HeaderText="YER" UniqueName="RDS_YER">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RDS_ZAMAN" HeaderText="ZAMAN" UniqueName="RDS_ZAMAN">
                        <HeaderStyle HorizontalAlign="Center" Width="40" />
                        <ItemStyle HorizontalAlign="Center" />
                    </telerik:GridBoundColumn>
                    <%--<telerik:GridBoundColumn DataField="RDS_TAR" DataType="System.DateTime" EmptyDataText="25.01.2013" HeaderText="ZAMAN" UniqueName="RDS_TAR">
                    </telerik:GridBoundColumn>--%>
                       
                        
                    <%--<telerik:GridBoundColumn DataField="RDS_KONTBOS" DataType="System.Int16" FilterControlAltText="Filter RDS_KONTBOS column" HeaderText="RDS_KONTBOS" SortExpression="RDS_KONTBOS" UniqueName="RDS_KONTBOS">
                    </telerik:GridBoundColumn>--%>
                    <%--<telerik:GridBoundColumn DataField="RDS_EKLTAR" DataType="System.DateTime" FilterControlAltText="Filter RDS_EKLTAR column" HeaderText="RDS_EKLTAR" SortExpression="RDS_EKLTAR" UniqueName="RDS_EKLTAR">
                    </telerik:GridBoundColumn>--%>
                    <%--<telerik:GridDateTimeColumn EnableTimeIndependentFiltering="true" DataField="RDS_TAR" DataType="System.DateTime" HeaderText="ZAMAN" UniqueName="RDS_TAR">
                    </telerik:GridDateTimeColumn>--%>
                    <telerik:GridCheckBoxColumn DataField="RDS_AKTIF" DataType="System.Boolean" HeaderText="AKTİF" UniqueName="RDS_AKTIF" Visible="false">
                    </telerik:GridCheckBoxColumn>
                        <telerik:GridButtonColumn  ConfirmText="Randevu Silinsin mi?" ConfirmDialogType="RadWindow" CommandArgument="RDS"
                        ConfirmTitle="RDS" ButtonType="PushButton" CommandName="Delete" Text="İPTAL" UniqueName="DeleteColumn">
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
        </div>
    </div>
</div>
</asp:Content>
