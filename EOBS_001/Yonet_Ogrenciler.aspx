<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yonet_Ogrenciler.aspx.cs" Inherits="EOBS_001.Yonet_Ogrenciler" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="ContentOgrenciler" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Ogrenci Yönetimi <span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
         <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="GridOgrenci">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridOgrenci" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RC_Sube">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridOgrenci" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="RC_Kur" >
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RC_Kur">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridOgrenci" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="RC_Sube">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
            <div style="margin:10px;">
                <asp:Label runat="server" ID="lbl_sube" Text="Sınıf :"></asp:Label>
                <telerik:RadComboBox ID="RC_Sube" Runat="server" AutoPostBack="true" Skin="WebBlue" DataSourceID="EDS_Subeler" DataTextField="SUB_AD" DataValueField="SUB_ID" EmptyMessage="Seçiniz.." OnSelectedIndexChanged="RC_Sube_SelectedIndexChanged"   >
                </telerik:RadComboBox>
                <asp:Label runat="server" ID="lbl_kur" Text="Kur :"></asp:Label>
                <telerik:RadComboBox ID="RC_Kur" Runat="server" AutoPostBack="true" Skin="WebBlue" DataSourceID="EDS_Kurlar" DataTextField="KUR_AD" DataValueField="KUR_ID" EmptyMessage="Seçiniz.." OnSelectedIndexChanged="RC_Kur_SelectedIndexChanged">
                </telerik:RadComboBox>
            </div>
           <telerik:RadGrid ID="GridOgrenci" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="EDS_Ogrenciler" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
               </ClientSettings>
                <MasterTableView DataSourceID="EDS_Ogrenciler" AutoGenerateColumns="False" CommandItemSettings-AddNewRecordText="Yeni Öğrenci Ekle" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" DataKeyNames="KUL_ID" NoMasterRecordsText="Kayıt Yok">
    
<CommandItemSettings AddNewRecordText="Yeni Öğrenci Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        
                        <telerik:GridBoundColumn DataField="KUL_ID" HeaderText="ID"  UniqueName="KUL_ID" DataType="System.Int32" ReadOnly="True">
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="KUL_AKTIF" Visible="false" DataType="System.Boolean" HeaderText="AKTİF" UniqueName="KUL_AKTIF">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="KUL_NO"  DataType="System.Int32" HeaderText="NUMARA" UniqueName="KUL_NO">
                            <HeaderStyle Width="60px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_ISIM"  HeaderText="İSİM" UniqueName="KUL_ISIM">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_SOYISIM"  HeaderText="SOYİSİM"  UniqueName="KUL_SOYISIM">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_TCNO" Visible="false" HeaderText="TC. NO"  UniqueName="KUL_TCNO">
                        </telerik:GridBoundColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="KUL_CINSIYET" DataSourceID="EDS_Cinsiyet" HeaderText="CİNSİYET" ListTextField="CNS_AD" ListValueField="CNS_DEGER" UniqueName="KUL_CINSIYET" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>
                        <telerik:GridBoundColumn DataField="KUL_VISIM" Visible="false" HeaderText="VELİ İSİM" UniqueName="KUL_VISIM">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="KUL_VSOYISIM" Visible="false" HeaderText="VELİ SOYİSİM" UniqueName="KUL_VSOYISIM">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="KUL_AD" Visible="false" HeaderText="KUL. ADI" UniqueName="KUL_AD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_SIFRE" Visible="false"  HeaderText="ŞİFRE" UniqueName="KUL_SIFRE">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_TEL1" Visible="false" HeaderText="VELİ TEL."  UniqueName="KUL_TEL1">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="KUL_TEL2" FilterControlAltText="Filter KUL_TEL2 column" HeaderText="KUL_TEL2" SortExpression="KUL_TEL2" UniqueName="KUL_TEL2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_TEL3" FilterControlAltText="Filter KUL_TEL3 column" HeaderText="KUL_TEL3" SortExpression="KUL_TEL3" UniqueName="KUL_TEL3">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="KUL_OLSTAR" DataType="System.DateTime" FilterControlAltText="Filter KUL_OLSTAR column" HeaderText="KUL_OLSTAR" SortExpression="KUL_OLSTAR" UniqueName="KUL_OLSTAR">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_GRSTAR" DataType="System.DateTime" FilterControlAltText="Filter KUL_GRSTAR column" HeaderText="KUL_GRSTAR" SortExpression="KUL_GRSTAR" UniqueName="KUL_GRSTAR">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_EXPTAR" DataType="System.DateTime" FilterControlAltText="Filter KUL_EXPTAR column" HeaderText="KUL_EXPTAR" SortExpression="KUL_EXPTAR" UniqueName="KUL_EXPTAR">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridDropDownColumn DropDownControlType="DropDownList" ReadOnly="true" DefaultInsertValue="3" DataField="YTK_ID" DataSourceID="EDS_Yetki" HeaderText="YETKİ" ListTextField="YTK_AD" ListValueField="YTK_ID" UniqueName="YTK_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="YTK_ID" ReadOnly="true" HeaderText="KUL_ID" UniqueName="YTK_ID" DataType="System.Int32" DefaultInsertValue="3">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="OKL_ID" DataType="System.Int32" FilterControlAltText="Filter OKL_ID column" HeaderText="OKL_ID" SortExpression="OKL_ID" UniqueName="OKL_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="SNF_ID" DataType="System.Int32" FilterControlAltText="Filter SNF_ID column" HeaderText="SNF_ID" SortExpression="SNF_ID" UniqueName="SNF_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="SNF_ID" DataSourceID="EDS_Siniflar" HeaderText="SINIF" ListTextField="SNF_AD" ListValueField="SNF_ID" UniqueName="SNF_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>--%>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" FilterControlWidth="60" DataField="SUB_ID" DataSourceID="EDS_Subeler" HeaderText="SINIF" ListTextField="SUB_AD" ListValueField="SUB_ID" UniqueName="SUB_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="KUR_ID" DataSourceID="EDS_Kurlar" HeaderText="KUR SINIFI" ListTextField="KUR_AD" ListValueField="KUR_ID" UniqueName="KUR_ID" Visible="false" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>
                        <%--<telerik:GridBoundColumn DataField="SUB_ID" DataType="System.Int32" FilterControlAltText="Filter SUB_ID column" HeaderText="SUB_ID" SortExpression="SUB_ID" UniqueName="SUB_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUR_ID" DataType="System.Int32" FilterControlAltText="Filter KUR_ID column" HeaderText="KUR_ID" SortExpression="KUR_ID" UniqueName="KUR_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="RE1_ID" DataSourceID="EDS_Siniflar" HeaderText="REHBERLİK 1" ListTextField="SNF_AD" ListValueField="SNF_ID" UniqueName="RE1_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>--%>
                        <%--<telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="RE2_ID" DataSourceID="EDS_Siniflar" HeaderText="REHBERLİK 2" ListTextField="SNF_AD" ListValueField="SNF_ID" UniqueName="RE2_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="RE3_ID" DataSourceID="EDS_Siniflar" HeaderText="REHBERLİK 3" ListTextField="SNF_AD" ListValueField="SNF_ID" UniqueName="RE3_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="RE1_ID" DataType="System.Int32" FilterControlAltText="Filter RE1_ID column" HeaderText="RE1_ID" SortExpression="RE1_ID" UniqueName="RE1_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RE2_ID" DataType="System.Int32" FilterControlAltText="Filter RE2_ID column" HeaderText="RE2_ID" SortExpression="RE2_ID" UniqueName="RE2_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RE3_ID" DataType="System.Int32" FilterControlAltText="Filter RE3_ID column" HeaderText="RE3_ID" SortExpression="RE3_ID" UniqueName="RE3_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="BRS_ID" DataSourceID="EDS_Branslar" HeaderText="BRANŞ" ListTextField="BRS_AD" ListValueField="BRS_ID" UniqueName="BRS_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
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
        </telerik:RadGrid>    
                
                <asp:EntityDataSource ID="EDS_Ogrenciler" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="KULLANICILAR" Where="" EntityTypeFilter="KULLANICILAR" OnInserting="EDS_Ogrenciler_Inserting" OnUpdating="EDS_Ogrenciler_Updating">
                    <WhereParameters>
                        <asp:SessionParameter DbType="Int32" Direction="InputOutput" Name="OKL_ID" SessionField="AktifOkulId" />
                        <asp:Parameter DbType="Int32" DefaultValue="3" Direction="InputOutput" Name="YTK_ID" />
                    </WhereParameters>
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Siniflar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SINIFLAR" Select="it.[SNF_ID], it.[SNF_AD]" AutoGenerateWhereClause="True" Where="">
                    <WhereParameters>
                       <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                    </WhereParameters>
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Branslar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="BRANSLAR" EntityTypeFilter="BRANSLAR" Select="it.[BRS_ID], it.[BRS_AD]">
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Cinsiyet" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="CINSIYET" EntityTypeFilter="CINSIYET" Select="it.[CNS_AD], it.[CNS_DEGER]">
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Yetki" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="YETKILER" EntityTypeFilter="YETKILER" Select="it.[YTK_AD], it.[YTK_ID]">
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Subeler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="SUBELER" EntityTypeFilter="SUBELER" Where="" AutoGenerateWhereClause="True" Select="">
                     <WhereParameters>
                         <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                     </WhereParameters>
                 </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Kurlar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="KURLAR" EntityTypeFilter="KURLAR" Where="" AutoGenerateWhereClause="True">
                     <WhereParameters>
                         <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                     </WhereParameters>
                 </asp:EntityDataSource>
            </div>
		</div>
	</div>
</asp:Content>
