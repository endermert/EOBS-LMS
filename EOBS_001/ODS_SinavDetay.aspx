<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ODS_SinavDetay.aspx.cs" Inherits="EOBS_001.ODS_SinavDetay" %>
<asp:Content ID="ContentSinavDetay" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Sınav Detayları<span></span></h2>
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
               <telerik:RadGrid ID="GridDamla" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="EDS_SinavDetay" OnSelectedIndexChanged="GridDamla_SelectedIndexChanged" >
                
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_SinavDetay" AutoGenerateColumns="False" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" DataKeyNames="SDT_ID" NoMasterRecordsText="Kayıt Yok">
    
<CommandItemSettings AddNewRecordText="Yeni Detay Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                    
                    <Columns >
                        <telerik:GridBoundColumn DataField="SDT_ID" DataType="System.Int32" ReadOnly="True" UniqueName="SDT_ID" Visible="false" >
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="STP_ID" HeaderText="SINAV TiPi" UniqueName="STP_ID" DataType="System.Int16" Visible="false" >
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDropDownColumn  DropDownControlType="DropDownList" DataField="STP_ID" DataSourceID="EDS_SinavTip" HeaderText="SINAV TiPi" ListTextField="STP_AD" ListValueField="STP_ID" UniqueName="STP_ID" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ.." >
                            <HeaderStyle Width="65" />
                        </telerik:GridDropDownColumn>
                        <telerik:GridBoundColumn DataField="SDT_AD" HeaderText="DETAY ADI"  UniqueName="SDT_AD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_NOT" HeaderText="DETAY NOT" UniqueName="SDT_NOT" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_TOPSORU" DataType="System.Int16" HeaderText="TOPLAM SORU SAYISI" UniqueName="SDT_TOPSORU" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_TABPUAN" DataType="System.Int16" HeaderText="TABAN PUAN" UniqueName="SDT_TABPUAN" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DERSLER" HeaderText="DERSLER" UniqueName="SDT_DERSLER">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="OPT_ID" DataType="System.Int32" FilterControlAltText="Filter OPT_ID column" HeaderText="OPT_ID" SortExpression="OPT_ID" UniqueName="OPT_ID">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="OKL_ID" DataType="System.Int32" FilterControlAltText="Filter OKL_ID column" HeaderText="OKL_ID" SortExpression="OKL_ID" UniqueName="OKL_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDropDownColumn EditFormColumnIndex="1" DropDownControlType="DropDownList" DataField="SDT_DRS0" DataSourceID="EDS_Dersler" HeaderText="DERS 1" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="SDT_DRS0" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                         <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS0SS" HeaderText="SS" UniqueName="SDT_DRS0SS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp13" runat="server" Text='<% #Bind("SDT_DRS0SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp14" runat="server" Text='<% #Bind("SDT_DRS0SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp15" runat="server" Text='<% #Bind("SDT_DRS0SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS0KS" HeaderText="KS" UniqueName="SDT_DRS0KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp16" runat="server" Text='<% #Bind("SDT_DRS0KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp17" runat="server" Text='<% #Bind("SDT_DRS0KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp18" runat="server" Text='<% #Bind("SDT_DRS0KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%--<telerik:GridBoundColumn DataField="SDT_DRS0" DataType="System.Int32" HeaderText="DERS 1" UniqueName="SDT_DRS0" Visible="false">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="SDT_DRS0SS" DataType="System.Int16" HeaderText="SORU SAYISI" UniqueName="SDT_DRS0SS" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS0KS" DataType="System.Int16" HeaderText="KAT SAYI"  UniqueName="SDT_DRS0KS" Visible="false">
                        </telerik:GridBoundColumn>--%>


                        <telerik:GridDropDownColumn EditFormColumnIndex="1" DropDownControlType="DropDownList" DataField="SDT_DRS1" DataSourceID="EDS_Dersler" HeaderText="DERS 2" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="SDT_DRS1" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS1SS" HeaderText="SS" UniqueName="SDT_DRS1SS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp1" runat="server" Text='<% #Bind("SDT_DRS1SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp2" runat="server" Text='<% #Bind("SDT_DRS1SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp3" runat="server" Text='<% #Bind("SDT_DRS1SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS1KS" HeaderText="KS" UniqueName="SDT_DRS1KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp4" runat="server" Text='<% #Bind("SDT_DRS1KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp5" runat="server" Text='<% #Bind("SDT_DRS1KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp6" runat="server" Text='<% #Bind("SDT_DRS1KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" DropDownControlType="DropDownList" DataField="SDT_DRS2" DataSourceID="EDS_Dersler" HeaderText="DERS 3" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="SDT_DRS2" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS2SS" HeaderText="SS" UniqueName="SDT_DRS2SS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp7" runat="server" Text='<% #Bind("SDT_DRS2SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp8" runat="server" Text='<% #Bind("SDT_DRS2SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp9" runat="server" Text='<% #Bind("SDT_DRS2SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS2KS" HeaderText="KS" UniqueName="SDT_DRS2KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp10" runat="server" Text='<% #Bind("SDT_DRS2KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp11" runat="server" Text='<% #Bind("SDT_DRS2KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp12" runat="server" Text='<% #Bind("SDT_DRS2KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" DropDownControlType="DropDownList" DataField="SDT_DRS3" DataSourceID="EDS_Dersler" HeaderText="DERS 4" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="SDT_DRS3" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS3SS" HeaderText="SS" UniqueName="SDT_DRS3SS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp162" runat="server" Text='<% #Bind("SDT_DRS3SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp172" runat="server" Text='<% #Bind("SDT_DRS3SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp182" runat="server" Text='<% #Bind("SDT_DRS3SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS3KS" HeaderText="KS" UniqueName="SDT_DRS3KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp192" runat="server" Text='<% #Bind("SDT_DRS3KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp202" runat="server" Text='<% #Bind("SDT_DRS3KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp212" runat="server" Text='<% #Bind("SDT_DRS3KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" DropDownControlType="DropDownList" DataField="SDT_DRS4" DataSourceID="EDS_Dersler" HeaderText="DERS 5" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="SDT_DRS4" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS4SS" HeaderText="SS" UniqueName="SDT_DRS4SS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp161" runat="server" Text='<% #Bind("SDT_DRS4SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp171" runat="server" Text='<% #Bind("SDT_DRS4SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp181" runat="server" Text='<% #Bind("SDT_DRS4SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS4KS" HeaderText="KS" UniqueName="SDT_DRS4KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp191" runat="server" Text='<% #Bind("SDT_DRS4KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp201" runat="server" Text='<% #Bind("SDT_DRS4KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp211" runat="server" Text='<% #Bind("SDT_DRS4KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" DropDownControlType="DropDownList" DataField="SDT_DRS5" DataSourceID="EDS_Dersler" HeaderText="DERS 6" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="SDT_DRS5" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS5SS" HeaderText="SS" UniqueName="SDT_DRS5SS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp11" runat="server" Text='<% #Bind("SDT_DRS5SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp21" runat="server" Text='<% #Bind("SDT_DRS5SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp31" runat="server" Text='<% #Bind("SDT_DRS5SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS5KS" HeaderText="KS" UniqueName="SDT_DRS5KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp41" runat="server" Text='<% #Bind("SDT_DRS5KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp51" runat="server" Text='<% #Bind("SDT_DRS5KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp61" runat="server" Text='<% #Bind("SDT_DRS5KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" DropDownControlType="DropDownList" DataField="SDT_DRS6" DataSourceID="EDS_Dersler" HeaderText="DERS 7" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="SDT_DRS6" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS6SS" HeaderText="SS" UniqueName="SDT_DRS6SS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111" runat="server" Text='<% #Bind("SDT_DRS6SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp211" runat="server" Text='<% #Bind("SDT_DRS6SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp311" runat="server" Text='<% #Bind("SDT_DRS6SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS6KS" HeaderText="KS" UniqueName="SDT_DRS6KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp411" runat="server" Text='<% #Bind("SDT_DRS6KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp511" runat="server" Text='<% #Bind("SDT_DRS6KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp611" runat="server" Text='<% #Bind("SDT_DRS6KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" DropDownControlType="DropDownList" DataField="SDT_DRS7" DataSourceID="EDS_Dersler" HeaderText="DERS 8" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="SDT_DRS7" Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS7SS" HeaderText="SS" UniqueName="SDT_DRS7SS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp1111" runat="server" Text='<% #Bind("SDT_DRS7SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp2111" runat="server" Text='<% #Bind("SDT_DRS7SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp3111" runat="server" Text='<% #Bind("SDT_DRS7SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS7KS" HeaderText="KS" UniqueName="SDT_DRS7KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp4111" runat="server" Text='<% #Bind("SDT_DRS7KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp5111" runat="server" Text='<% #Bind("SDT_DRS7KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp6111" runat="server" Text='<% #Bind("SDT_DRS7KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" HeaderText="DERS 9" DataField="SDT_DRS8" UniqueName="SDT_DRS8" DropDownControlType="DropDownList" DataSourceID="EDS_Dersler" ListTextField="DRS_AD" ListValueField="DRS_ID"  Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS8SS" UniqueName="SDT_DRS8SS" HeaderText="SS"  Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp11111" runat="server" Text='<% #Bind("SDT_DRS8SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp21111" runat="server" Text='<% #Bind("SDT_DRS8SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp31111" runat="server" Text='<% #Bind("SDT_DRS8SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS8KS" UniqueName="SDT_DRS8KS" HeaderText="KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp41111" runat="server" Text='<% #Bind("SDT_DRS8KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp51111" runat="server" Text='<% #Bind("SDT_DRS8KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp61111" runat="server" Text='<% #Bind("SDT_DRS8KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" HeaderText="DERS 10" DataField="SDT_DRS9" UniqueName="SDT_DRS9" DropDownControlType="DropDownList" DataSourceID="EDS_Dersler" ListTextField="DRS_AD" ListValueField="DRS_ID"  Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS9SS" UniqueName="SDT_DRS9SS" HeaderText="SS"  Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111111" runat="server" Text='<% #Bind("SDT_DRS9SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp211111" runat="server" Text='<% #Bind("SDT_DRS9SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp311111" runat="server" Text='<% #Bind("SDT_DRS9SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS9KS" UniqueName="SDT_DRS9KS" HeaderText="KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp411111" runat="server" Text='<% #Bind("SDT_DRS9KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp511111" runat="server" Text='<% #Bind("SDT_DRS9KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp611111" runat="server" Text='<% #Bind("SDT_DRS9KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" HeaderText="DERS 11" DataField="SDT_DRS10" UniqueName="SDT_DRS10" DropDownControlType="DropDownList" DataSourceID="EDS_Dersler" ListTextField="DRS_AD" ListValueField="DRS_ID"  Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS10SS" UniqueName="SDT_DRS10SS" HeaderText="SS"  Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp1111111" runat="server" Text='<% #Bind("SDT_DRS10SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp2111111" runat="server" Text='<% #Bind("SDT_DRS10SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp3111111" runat="server" Text='<% #Bind("SDT_DRS10SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS10KS" UniqueName="SDT_DRS10KS" HeaderText="KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp4111111" runat="server" Text='<% #Bind("SDT_DRS10KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp5111111" runat="server" Text='<% #Bind("SDT_DRS10KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp6111111" runat="server" Text='<% #Bind("SDT_DRS10KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" HeaderText="DERS 12" DataField="SDT_DRS11" UniqueName="SDT_DRS11" DropDownControlType="DropDownList" DataSourceID="EDS_Dersler" ListTextField="DRS_AD" ListValueField="DRS_ID"  Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS11SS" UniqueName="SDT_DRS11SS" HeaderText="SS"  Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp11111113" runat="server" Text='<% #Bind("SDT_DRS11SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp21111113" runat="server" Text='<% #Bind("SDT_DRS11SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp31111113" runat="server" Text='<% #Bind("SDT_DRS11SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS11KS" UniqueName="SDT_DRS11KS" HeaderText="KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp41111113" runat="server" Text='<% #Bind("SDT_DRS11KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp51111113" runat="server" Text='<% #Bind("SDT_DRS11KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp61111113" runat="server" Text='<% #Bind("SDT_DRS11KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" HeaderText="DERS 13" DataField="SDT_DRS12" UniqueName="SDT_DRS12" DropDownControlType="DropDownList" DataSourceID="EDS_Dersler" ListTextField="DRS_AD" ListValueField="DRS_ID"  Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS12SS" UniqueName="SDT_DRS12SS" HeaderText="SS"  Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp11111111" runat="server" Text='<% #Bind("SDT_DRS12SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp21111111" runat="server" Text='<% #Bind("SDT_DRS12SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp31111111" runat="server" Text='<% #Bind("SDT_DRS12SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS12KS" UniqueName="SDT_DRS12KS" HeaderText="KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp41111111" runat="server" Text='<% #Bind("SDT_DRS12KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp51111111" runat="server" Text='<% #Bind("SDT_DRS12KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp61111111" runat="server" Text='<% #Bind("SDT_DRS12KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" HeaderText="DERS 14" DataField="SDT_DRS13" UniqueName="SDT_DRS13" DropDownControlType="DropDownList" DataSourceID="EDS_Dersler" ListTextField="DRS_AD" ListValueField="DRS_ID"  Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS13SS" UniqueName="SDT_DRS13SS" HeaderText="SS"  Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111111111" runat="server" Text='<% #Bind("SDT_DRS13SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp211111111" runat="server" Text='<% #Bind("SDT_DRS13SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp311111111" runat="server" Text='<% #Bind("SDT_DRS13SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS13KS" UniqueName="SDT_DRS13KS" HeaderText="KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp411111111" runat="server" Text='<% #Bind("SDT_DRS13KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp511111111" runat="server" Text='<% #Bind("SDT_DRS13KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp611111111" runat="server" Text='<% #Bind("SDT_DRS13KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridDropDownColumn EditFormColumnIndex="1" HeaderText="DERS 15" DataField="SDT_DRS14" UniqueName="SDT_DRS14" DropDownControlType="DropDownList" DataSourceID="EDS_Dersler" ListTextField="DRS_AD" ListValueField="DRS_ID"  Visible="false" EnableEmptyListItem="true" EmptyListItemText="SEÇİNİZ..">
                        </telerik:GridDropDownColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="SDT_DRS14SS" UniqueName="SDT_DRS14SS" HeaderText="SS"  Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp1111111114" runat="server" Text='<% #Bind("SDT_DRS14SS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp2111111114" runat="server" Text='<% #Bind("SDT_DRS14SS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp3111111114" runat="server" Text='<% #Bind("SDT_DRS14SS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="3" DataField="SDT_DRS14KS" UniqueName="SDT_DRS14KS" HeaderText="KS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp4111111114" runat="server" Text='<% #Bind("SDT_DRS14KS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp5111111114" runat="server" Text='<% #Bind("SDT_DRS14KS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp6111111114" runat="server" Text='<% #Bind("SDT_DRS14KS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <%-- <telerik:GridTemplateColumn  DataField="SDT_DRS1" HeaderText="DERS 2" UniqueName="SDT_DRS1" Visible="false" >
                            <InsertItemTemplate>
                                <telerik:RadTextBox ID="Temp2"  runat="server" Text='<% #Bind("SNC_METIN") %>' TextMode="MultiLine" Width="600" Height="100" />
                                <br />
                                <asp:Label ID="Temp31" runat="server" Text="*Bu metin karnede çıkmaz, size hatırlatma amaçlıdır." />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp1" runat="server" Text='<% #Bind("SNC_METIN") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <telerik:RadTextBox ID="Temp3"  runat="server" Text='<% #Bind("SNC_METIN") %>' TextMode="MultiLine" Width="600" Height="100" />
                                <br />
                                <asp:Label ID="Temp31" runat="server" Text="*Bu metin karnede çıkmaz, size hatırlatma amaçlıdır." />
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="SDT_DRS1" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS1 column" HeaderText="SDT_DRS1" SortExpression="SDT_DRS1" UniqueName="SDT_DRS1">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS1SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS1SS column" HeaderText="SDT_DRS1SS" SortExpression="SDT_DRS1SS" UniqueName="SDT_DRS1SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS1KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS1KS column" HeaderText="SDT_DRS1KS" SortExpression="SDT_DRS1KS" UniqueName="SDT_DRS1KS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS2" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS2 column" HeaderText="SDT_DRS2" SortExpression="SDT_DRS2" UniqueName="SDT_DRS2">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS2SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS2SS column" HeaderText="SDT_DRS2SS" SortExpression="SDT_DRS2SS" UniqueName="SDT_DRS2SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS2KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS2KS column" HeaderText="SDT_DRS2KS" SortExpression="SDT_DRS2KS" UniqueName="SDT_DRS2KS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS3" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS3 column" HeaderText="SDT_DRS3" SortExpression="SDT_DRS3" UniqueName="SDT_DRS3">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS3SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS3SS column" HeaderText="SDT_DRS3SS" SortExpression="SDT_DRS3SS" UniqueName="SDT_DRS3SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS3KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS3KS column" HeaderText="SDT_DRS3KS" SortExpression="SDT_DRS3KS" UniqueName="SDT_DRS3KS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS4" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS4 column" HeaderText="SDT_DRS4" SortExpression="SDT_DRS4" UniqueName="SDT_DRS4">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS4SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS4SS column" HeaderText="SDT_DRS4SS" SortExpression="SDT_DRS4SS" UniqueName="SDT_DRS4SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS4KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS4KS column" HeaderText="SDT_DRS4KS" SortExpression="SDT_DRS4KS" UniqueName="SDT_DRS4KS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS5" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS5 column" HeaderText="SDT_DRS5" SortExpression="SDT_DRS5" UniqueName="SDT_DRS5">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS5SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS5SS column" HeaderText="SDT_DRS5SS" SortExpression="SDT_DRS5SS" UniqueName="SDT_DRS5SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS5KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS5KS column" HeaderText="SDT_DRS5KS" SortExpression="SDT_DRS5KS" UniqueName="SDT_DRS5KS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS6" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS6 column" HeaderText="SDT_DRS6" SortExpression="SDT_DRS6" UniqueName="SDT_DRS6">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS6SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS6SS column" HeaderText="SDT_DRS6SS" SortExpression="SDT_DRS6SS" UniqueName="SDT_DRS6SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS6KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS6KS column" HeaderText="SDT_DRS6KS" SortExpression="SDT_DRS6KS" UniqueName="SDT_DRS6KS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS7" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS7 column" HeaderText="SDT_DRS7" SortExpression="SDT_DRS7" UniqueName="SDT_DRS7">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS7SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS7SS column" HeaderText="SDT_DRS7SS" SortExpression="SDT_DRS7SS" UniqueName="SDT_DRS7SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS7KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS7KS column" HeaderText="SDT_DRS7KS" SortExpression="SDT_DRS7KS" UniqueName="SDT_DRS7KS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS8" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS8 column" HeaderText="SDT_DRS8" SortExpression="SDT_DRS8" UniqueName="SDT_DRS8">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS8SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS8SS column" HeaderText="SDT_DRS8SS" SortExpression="SDT_DRS8SS" UniqueName="SDT_DRS8SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS8KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS8KS column" HeaderText="SDT_DRS8KS" SortExpression="SDT_DRS8KS" UniqueName="SDT_DRS8KS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS9" DataType="System.Int32" FilterControlAltText="Filter SDT_DRS9 column" HeaderText="SDT_DRS9" SortExpression="SDT_DRS9" UniqueName="SDT_DRS9">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS9SS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS9SS column" HeaderText="SDT_DRS9SS" SortExpression="SDT_DRS9SS" UniqueName="SDT_DRS9SS">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SDT_DRS9KS" DataType="System.Int16" FilterControlAltText="Filter SDT_DRS9KS column" HeaderText="SDT_DRS9KS" SortExpression="SDT_DRS9KS" UniqueName="SDT_DRS9KS">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" Text="Optik" >
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                         <telerik:GridEditCommandColumn ButtonType="PushButton" EditText="Düzenle" UniqueName="EditCommandColumn">
                            <HeaderStyle Width="60px"></HeaderStyle>
                        </telerik:GridEditCommandColumn>
                        <telerik:GridButtonColumn  ConfirmText="Siliniyor..Onaylıyor musunuz?" ConfirmDialogType="RadWindow"
                            ConfirmTitle="Siliniyor.." ButtonType="PushButton" CommandName="Delete" Text="Sil" UniqueName="DeleteColumn">
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridButtonColumn> 
                    </Columns>
                    
                    <EditFormSettings ColumnNumber="4"  >
                        <EditColumn ButtonType="PushButton" CancelText="İptal" InsertText="Kaydet" UpdateText="Güncelle" />
                     </EditFormSettings>
                    <EditItemStyle BackColor="Yellow" />
                    
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
                
                <asp:EntityDataSource ID="EDS_SinavDetay" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="SINAVDETAY" EntityTypeFilter="SINAVDETAY" OnInserting="EDS_SinavDetay_Inserting" OnUpdating="EDS_SinavDetay_Updating" >
                </asp:EntityDataSource>
		
		
                <asp:EntityDataSource ID="EDS_Dersler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="DERSLER" Select="it.[DRS_ID], it.[DRS_AD]">
                </asp:EntityDataSource>
		
		
                <asp:EntityDataSource ID="EDS_SinavTip" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SINAVTIP">
                </asp:EntityDataSource>
		
		
            </div>
		</div>
	</div>
</asp:Content>
