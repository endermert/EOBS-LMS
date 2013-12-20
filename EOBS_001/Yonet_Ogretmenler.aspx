<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yonet_Ogretmenler.aspx.cs" Inherits="EOBS_001.Yonet_OgretmenTanim" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="ContentOgretmenler" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Ogretmen Yönetimi <span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
         <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="GridOgretmen">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridOgretmen" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
           <telerik:RadGrid ID="GridOgretmen" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="EDS_Ogretmenler" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Ogretmenler" AutoGenerateColumns="False" CommandItemSettings-AddNewRecordText="Yeni Öğretmen Ekle" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" DataKeyNames="KUL_ID" NoMasterRecordsText="Kayıt Yok">
    
<CommandItemSettings AddNewRecordText="Yeni Öğretmen Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <%--<telerik:GridBoundColumn DataField="OKL_ID" DataType="System.Int32" FilterControlAltText="Filter OKL_ID column" HeaderText="OKL_ID" ReadOnly="True" SortExpression="OKL_ID" UniqueName="OKL_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="KUL_ID" Visible="false" HeaderText="KUL_ID" SortExpression="KUL_ID" UniqueName="KUL_ID" DataType="System.Int32" FilterControlAltText="Filter KUL_ID column" ReadOnly="True">
                        </telerik:GridBoundColumn>
                       
                        <%--<telerik:GridBoundColumn DataField="OKL_SIRA" DataType="System.Int32" FilterControlAltText="Filter OKL_SIRA column" HeaderText="OKL_SIRA" SortExpression="OKL_SIRA" UniqueName="OKL_SIRA">
                        </telerik:GridBoundColumn>--%>
                        
                        <telerik:GridCheckBoxColumn DataField="KUL_AKTIF" Visible="false" DataType="System.Boolean" HeaderText="AKTİF" UniqueName="KUL_AKTIF">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="KUL_ISIM" FilterControlAltText="Filter KUL_ISIM column" HeaderText="İSİM" SortExpression="KUL_ISIM" UniqueName="KUL_ISIM">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_SOYISIM"  FilterControlAltText="Filter KUL_SOYISIM column" HeaderText="SOYİSİM" SortExpression="KUL_SOYISIM" UniqueName="KUL_SOYISIM">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_AD" FilterControlAltText="Filter KUL_AD column" HeaderText="KUL. ADI" SortExpression="KUL_AD" UniqueName="KUL_AD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_SIFRE"  HeaderText="ŞİFRE" SortExpression="KUL_SIFRE" UniqueName="KUL_SIFRE">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_TCNO" Visible="false" HeaderText="TC. NO"  UniqueName="KUL_TCNO">
                        </telerik:GridBoundColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="KUL_CINSIYET" DataSourceID="EDS_Cinsiyet" HeaderText="CİNSİYET" ListTextField="CNS_AD" ListValueField="CNS_DEGER" UniqueName="KUL_CINSIYET" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>
                        <%--<telerik:GridBoundColumn DataField="KUL_NO" DataType="System.Int32" FilterControlAltText="Filter KUL_NO column" HeaderText="KUL_NO" SortExpression="KUL_NO" UniqueName="KUL_NO">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_VISIM" FilterControlAltText="Filter KUL_VISIM column" HeaderText="KUL_VISIM" SortExpression="KUL_VISIM" UniqueName="KUL_VISIM">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUL_VSOYISIM" FilterControlAltText="Filter KUL_VSOYISIM column" HeaderText="KUL_VSOYISIM" SortExpression="KUL_VSOYISIM" UniqueName="KUL_VSOYISIM">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="KUL_TEL1" Visible="false" FilterControlAltText="Filter KUL_TEL1 column" HeaderText="TEL"  UniqueName="KUL_TEL1">
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
                        <%--<telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="YTK_ID" DataSourceID="EDS_Yetki" HeaderText="YETKİ" ListTextField="YTK_AD" ListValueField="YTK_ID" UniqueName="YTK_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="OKL_ID" DataType="System.Int32" FilterControlAltText="Filter OKL_ID column" HeaderText="OKL_ID" SortExpression="OKL_ID" UniqueName="OKL_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNF_ID" DataType="System.Int32" FilterControlAltText="Filter SNF_ID column" HeaderText="SNF_ID" SortExpression="SNF_ID" UniqueName="SNF_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="SUB_ID" DataType="System.Int32" FilterControlAltText="Filter SUB_ID column" HeaderText="SUB_ID" SortExpression="SUB_ID" UniqueName="SUB_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KUR_ID" DataType="System.Int32" FilterControlAltText="Filter KUR_ID column" HeaderText="KUR_ID" SortExpression="KUR_ID" UniqueName="KUR_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridTemplateColumn Visible="false" HeaderText="OKUL" DataField="KUL_TEMP" UniqueName="KUL_TEMP">
                            <InsertItemTemplate>
                                <telerik:RadComboBox ID="Temp1" Text='<% #Bind("KUL_TEMP") %>' CheckedItemsTexts="DisplayAllInInput" EmptyMessage="Seçiniz.." Runat="server" Skin="WebBlue" DataSourceID="EDS_Okullar" DataTextField="OKL_ADI" DataValueField="OKL_ID" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" Localization-AllItemsCheckedString="Tüm Okullar" Localization-CheckAllString="Tüm Okullar" Localization-ItemsCheckedString="" Localization-NoMatches="Kayıt Yok" Width="220px"></telerik:RadComboBox>
                            </InsertItemTemplate>
                            <EditItemTemplate>        
                                <asp:Label ID="Temp3" runat="server" Text='<% #Bind("KUL_TEMP") %>' Width="220" />
                                <br />   
                                <telerik:RadComboBox ID="Temp2" Text='<% #Bind("KUL_TEMP") %>' CheckedItemsTexts="DisplayAllInInput" EmptyMessage="Seçiniz.." Runat="server" Skin="WebBlue" DataSourceID="EDS_Okullar" DataTextField="OKL_ADI" DataValueField="OKL_ID" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" Localization-AllItemsCheckedString="Tüm Okullar" Localization-CheckAllString="Tüm Okullar" Localization-ItemsCheckedString="" Localization-NoMatches="Kayıt Yok" Width="220px" ></telerik:RadComboBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp4" runat="server" Text='<% #Bind("KUL_TEMP") %>' Width="220" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="RE1_ID" DataSourceID="EDS_Siniflar" HeaderText="REHBERLİK 1" ListTextField="SUB_AD" ListValueField="SUB_ID" UniqueName="RE1_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="RE2_ID" DataSourceID="EDS_Siniflar" HeaderText="REHBERLİK 2" ListTextField="SUB_AD" ListValueField="SUB_ID" UniqueName="RE2_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" Visible="false" DataField="RE3_ID" DataSourceID="EDS_Siniflar" HeaderText="REHBERLİK 3" ListTextField="SUB_AD" ListValueField="SUB_ID" UniqueName="RE3_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <%--<telerik:GridBoundColumn DataField="RE1_ID" DataType="System.Int32" FilterControlAltText="Filter RE1_ID column" HeaderText="RE1_ID" SortExpression="RE1_ID" UniqueName="RE1_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RE2_ID" DataType="System.Int32" FilterControlAltText="Filter RE2_ID column" HeaderText="RE2_ID" SortExpression="RE2_ID" UniqueName="RE2_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RE3_ID" DataType="System.Int32" FilterControlAltText="Filter RE3_ID column" HeaderText="RE3_ID" SortExpression="RE3_ID" UniqueName="RE3_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="BRS_ID" DataSourceID="EDS_Branslar" HeaderText="BRANŞ" ListTextField="BRS_AD" ListValueField="BRS_ID" UniqueName="BRS_ID" EnableEmptyListItem="true" EmptyListItemText="Seçiniz">
                        </telerik:GridDropDownColumn>
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
                <asp:EntityDataSource ID="EDS_Ogretmenler" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="KULLANICILAR" EntityTypeFilter="KULLANICILAR" Where="" OnInserted="EDS_Ogretmenler_Inserted" OnUpdated="EDS_Ogretmenler_Updated" OnDeleted="EDS_Ogretmenler_Deleted" OnInserting="EDS_Ogretmenler_Inserting" OnUpdating="EDS_Ogretmenler_Updating">
                    <WhereParameters>
                        <asp:SessionParameter DbType="Int32" Direction="InputOutput" Name="OKL_ID" SessionField="AktifOkulId" />
                        <asp:Parameter DbType="Int32" DefaultValue="2" Direction="InputOutput" Name="YTK_ID" />
                    </WhereParameters>
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Siniflar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SUBELER" Select="it.[SUB_AD], it.[SUB_ID]" AutoGenerateWhereClause="True" Where="">
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
                <asp:EntityDataSource ID="EDS_Okullar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="OKULLAR" EntityTypeFilter="OKULLAR" Select="it.[OKL_ID], it.[OKL_ADI]">
                </asp:EntityDataSource>
                <asp:SqlDataSource ID="SDS_Ara" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" DeleteCommand="DELETE FROM [ARA_TBL2] WHERE [ARA_ID] = @ARA_ID" InsertCommand="INSERT INTO [ARA_TBL2] ([KUL_ID], [OKL_ID]) VALUES (@KUL_ID, @OKL_ID)" SelectCommand="SELECT * FROM [ARA_TBL2]" UpdateCommand="UPDATE [ARA_TBL2] SET [KUL_ID] = @KUL_ID, [OKL_ID] = @OKL_ID WHERE [ARA_ID] = @ARA_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ARA_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="KUL_ID" Type="Int32" />
                        <asp:Parameter Name="OKL_ID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="KUL_ID" Type="Int32" />
                        <asp:Parameter Name="OKL_ID" Type="Int32" />
                        <asp:Parameter Name="ARA_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
		</div>
	</div>
</asp:Content>
