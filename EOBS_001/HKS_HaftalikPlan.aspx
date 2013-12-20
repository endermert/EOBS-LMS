<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HKS_HaftalikPlan.aspx.cs" Inherits="EOBS_001.HKS_HaftalikPlan" %>
<asp:Content ID="ContentHaftalikPlan" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">HAFTALIK PLAN<span></span></h2>
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
            <telerik:RadGrid ID="GridDamla" PageSize="20" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="EDS_Planlar" >
                
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Planlar" AutoGenerateColumns="False" CommandItemSettings-AddNewRecordText="YENİ" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" DataKeyNames="HPL_ID" NoMasterRecordsText="Kayıt Yok">
    
<CommandItemSettings AddNewRecordText="Yeni Metin Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="HPL_ID" DataType="System.Int32" HeaderText="HPL_ID" ReadOnly="True" UniqueName="HPL_ID" Visible="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="HFT_ID" DataSourceID="EDS_Haftalar" HeaderText="HAFTA" ListTextField="HFT_AD" ListValueField="HFT_ID" UniqueName="HFT_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ">
                            <HeaderStyle Width="60" />
                        </telerik:GridDropDownColumn>
                        <%--<telerik:GridBoundColumn DataField="HFT_ID" HeaderText="HFT_ID" UniqueName="HFT_ID" DataType="System.Int32"  >
                        </telerik:GridBoundColumn>--%>
                          <telerik:GridTemplateColumn DataField="SUB_ADS" HeaderText="SINIF" UniqueName="SUB_ADS">
                            <ItemTemplate>
                                <asp:Label ID="Temp4"  runat="server" Text='<% #Bind("SUB_ADS") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <telerik:RadComboBox ID="Temp5" Text='<% #Bind("SUB_ADS") %>' EmptyMessage="Seçiniz.." Runat="server" Skin="WebBlue" DataSourceID="EDS_Subeler" DataTextField="SUB_AD" DataValueField="SUB_ID" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" Localization-AllItemsCheckedString="Tüm Sınıflar" Localization-CheckAllString="Tüm Sınıflar" Localization-ItemsCheckedString="" Localization-NoMatches="Kayıt Yok" Width="600px" CheckedItemsTexts="DisplayAllInInput"></telerik:RadComboBox>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadComboBox ID="Temp6" Text='<% #Bind("SUB_ADS") %>' EmptyMessage="Seçiniz.."  Runat="server" Skin="WebBlue" DataSourceID="EDS_Subeler" DataTextField="SUB_AD" DataValueField="SUB_ID" CheckBoxes="true" EnableCheckAllItemsCheckBox="true" Localization-AllItemsCheckedString="Tüm Sınıflar" Localization-CheckAllString="Tüm Sınıflar" Localization-ItemsCheckedString="" Localization-NoMatches="Kayıt Yok" Width="600px" CheckedItemsTexts="DisplayAllInInput"></telerik:RadComboBox>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="HPL_PTESI" HeaderText="PAZARTESİ" UniqueName="HPL_PTESI" Visible="false" >
                            <ItemTemplate>
                                <asp:Label ID="tx11"  runat="server" Text='<% #Bind("HPL_PTESI") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx12" runat="server"  Text='<% #Bind("HPL_PTESI") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx13" runat="server"  Text='<% #Bind("HPL_PTESI") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="HPL_SALI" HeaderText="SALI" UniqueName="HPL_SALI" Visible="false" >
                            <ItemTemplate>
                                <asp:Label ID="tx21"  runat="server" Text='<% #Bind("HPL_SALI") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx22" runat="server"  Text='<% #Bind("HPL_SALI") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx23" runat="server"  Text='<% #Bind("HPL_SALI") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        

                        <telerik:GridTemplateColumn DataField="HPL_CARS" HeaderText="ÇARŞAMBA" UniqueName="HPL_CARS" Visible="false" >
                            <ItemTemplate>
                                <asp:Label ID="tx31"  runat="server" Text='<% #Bind("HPL_CARS") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx32" runat="server"  Text='<% #Bind("HPL_CARS") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx33" runat="server"  Text='<% #Bind("HPL_CARS") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="HPL_PERS" HeaderText="PERŞEMBE" UniqueName="HPL_PERS" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="tx41"  runat="server" Text='<% #Bind("HPL_PERS") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx42" runat="server"  Text='<% #Bind("HPL_PERS") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx43" runat="server"  Text='<% #Bind("HPL_PERS") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="HPL_CUMA" HeaderText="CUMA" UniqueName="HPL_CUMA" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="tx51"  runat="server" Text='<% #Bind("HPL_CUMA") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx52" runat="server"  Text='<% #Bind("HPL_CUMA") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx53" runat="server"  Text='<% #Bind("HPL_CUMA") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="HPL_IPTESI" HeaderText="MONDAY" UniqueName="HPL_IPTESI" Visible="false" >
                            <ItemTemplate>
                                <asp:Label ID="tx211"  runat="server" Text='<% #Bind("HPL_IPTESI") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx212" runat="server"  Text='<% #Bind("HPL_IPTESI") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx213" runat="server"  Text='<% #Bind("HPL_IPTESI") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="HPL_ISALI" HeaderText="TUESDAY" UniqueName="HPL_ISALI" Visible="false" >
                            <ItemTemplate>
                                <asp:Label ID="tx221"  runat="server" Text='<% #Bind("HPL_ISALI") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx222" runat="server"  Text='<% #Bind("HPL_ISALI") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx223" runat="server"  Text='<% #Bind("HPL_ISALI") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        

                        <telerik:GridTemplateColumn DataField="HPL_ICARS" HeaderText="WEDNESDAY" UniqueName="HPL_ICARS" Visible="false" >
                            <ItemTemplate>
                                <asp:Label ID="tx331"  runat="server" Text='<% #Bind("HPL_ICARS") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx332" runat="server"  Text='<% #Bind("HPL_ICARS") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx333" runat="server"  Text='<% #Bind("HPL_ICARS") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="HPL_IPERS" HeaderText="THURSDAY" UniqueName="HPL_IPERS" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="tx441"  runat="server" Text='<% #Bind("HPL_IPERS") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx442" runat="server"  Text='<% #Bind("HPL_IPERS") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx443" runat="server"  Text='<% #Bind("HPL_IPERS") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="HPL_ICUMA" HeaderText="FRIDAY" UniqueName="HPL_ICUMA" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="tx551"  runat="server" Text='<% #Bind("HPL_ICUMA") %>' />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="tx552" runat="server"  Text='<% #Bind("HPL_ICUMA") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="tx553" runat="server"  Text='<% #Bind("HPL_ICUMA") %>' TextMode="MultiLine" Width="400" Height="40" />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                        
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
                    <EditItemStyle BackColor="Yellow" />
                    
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
                <asp:EntityDataSource ID="EDS_Planlar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="AOPLANLAR" EntityTypeFilter="AOPLANLAR" AutoGenerateWhereClause="True" Where="">
                    <WhereParameters>
                        <asp:SessionParameter Name="OKL_ID" SessionField="AktifOkulId" DbType="Int32" />
                        <asp:SessionParameter Name="HFT_ID" SessionField="AktifHaftaId" DbType="Int32" />
                    </WhereParameters>
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EDS_Subeler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="SUBELER" EntityTypeFilter="SUBELER" Where="" AutoGenerateWhereClause="True" Select="">
                     <WhereParameters>
                         <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                     </WhereParameters>
                 </asp:EntityDataSource>
		
		
                <asp:EntityDataSource ID="EDS_Haftalar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="HAFTALAR" Select="it.[HFT_ID], it.[HFT_AD]">
                </asp:EntityDataSource>
		
		
                <%-- <asp:SqlDataSource ID="SDS_Ara" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" DeleteCommand="DELETE FROM [ARA_TBL1] WHERE [ARA_ID] = @ARA_ID" InsertCommand="INSERT INTO [ARA_TBL1] ([SUB_ID], [DML_ID], [DYR_ID], [ODV_ID], [HFT_ID]) VALUES (@SUB_ID, @DML_ID, @DYR_ID, @ODV_ID, @HFT_ID)" SelectCommand="SELECT * FROM [ARA_TBL1]" UpdateCommand="UPDATE [ARA_TBL1] SET [SUB_ID] = @SUB_ID, [DML_ID] = @DML_ID, [DYR_ID] = @DYR_ID, [ODV_ID] = @ODV_ID, [HFT_ID] = @HFT_ID WHERE [ARA_ID] = @ARA_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ARA_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SUB_ID" Type="Int32" />
                        <asp:Parameter Name="DML_ID" Type="Int32" />
                        <asp:Parameter Name="DYR_ID" Type="Int32" />
                        <asp:Parameter Name="ODV_ID" Type="Int32" />
                        <asp:Parameter Name="HFT_ID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SUB_ID" Type="Int32" />
                        <asp:Parameter Name="DML_ID" Type="Int32" />
                        <asp:Parameter Name="DYR_ID" Type="Int32" />
                        <asp:Parameter Name="ODV_ID" Type="Int32" />
                        <asp:Parameter Name="HFT_ID" Type="Int32" />
                        <asp:Parameter Name="ARA_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>--%>
		
		
            </div>
		</div>
	</div>
</asp:Content>
