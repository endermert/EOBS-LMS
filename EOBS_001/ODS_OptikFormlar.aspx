<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ODS_OptikFormlar.aspx.cs" Inherits="EOBS_001.ODS_OptikFormlar" %>
<asp:Content ID="ContentOptikForm" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">Optik Form Detayları<span></span></h2>
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
               <telerik:RadGrid ID="GridDamla" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="EDS_Optik" OnSelectedIndexChanged="GridDamla_SelectedIndexChanged" >
                
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Optik" AutoGenerateColumns="False" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="Top" DataKeyNames="OPT_ID" NoMasterRecordsText="Kayıt Yok">
    
<CommandItemSettings AddNewRecordText="Yeni Optik Ekle" RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>
<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>
<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                    
                    <Columns>

                        <telerik:GridBoundColumn DataField="OPT_ID" DataType="System.Int32" ReadOnly="True" UniqueName="OPT_ID" HeaderText="OPT_ID" Visible="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn DataField="OPT_AD" HeaderText="OPTİK ADI"  UniqueName="OPT_AD">
                            <InsertItemTemplate>
                                <asp:TextBox ID="Tad1" runat="server" Text='<% #Bind("OPT_AD") %>' Width="60" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Tad2" runat="server" Text='<% #Bind("OPT_AD") %>' Width="60" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Tad3" runat="server" Text='<% #Bind("OPT_AD") %>'/>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        
                        <telerik:GridTemplateColumn EditFormColumnIndex="1" DataField="OPT_AD_BAS" HeaderText="AD - BAŞLANGIÇ" UniqueName="OPT_AD_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="A1Temp1" runat="server" Text='<% #Bind("OPT_AD_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="A1Temp2" runat="server" Text='<% #Bind("OPT_AD_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="A1Temp3" runat="server" Text='<% #Bind("OPT_AD_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="OPT_AD_UZN" HeaderText="UZUNLUK" UniqueName="OPT_AD_UZN" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="A1Temp41" runat="server" Text='<% #Bind("OPT_AD_UZN") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="A1Temp51" runat="server" Text='<% #Bind("OPT_AD_UZN") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="A1Temp61" runat="server" Text='<% #Bind("OPT_AD_UZN") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="1" DataField="OPT_SOY_BAS" HeaderText="SOYAD - BAŞLANGIÇ" UniqueName="OPT_SOY_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="A2Temp1" runat="server" Text='<% #Bind("OPT_SOY_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="A2Temp2" runat="server" Text='<% #Bind("OPT_SOY_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="A2Temp3" runat="server" Text='<% #Bind("OPT_SOY_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="OPT_SOY_UZN" HeaderText="UZUNLUK" UniqueName="OPT_SOY_UZN" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="A2Temp41" runat="server" Text='<% #Bind("OPT_SOY_UZN") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="A2Temp51" runat="server" Text='<% #Bind("OPT_SOY_UZN") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="A2Temp61" runat="server" Text='<% #Bind("OPT_SOY_UZN") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn EditFormColumnIndex="1" DataField="OPT_OK_BAS" HeaderText="OKUL KODU - BAŞLANGIÇ" UniqueName="OPT_OK_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp1" runat="server" Text='<% #Bind("OPT_OK_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp2" runat="server" Text='<% #Bind("OPT_OK_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp3" runat="server" Text='<% #Bind("OPT_OK_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="OPT_OK_UZN" HeaderText="UZUNLUK" UniqueName="OPT_OK_UZN" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp41" runat="server" Text='<% #Bind("OPT_OK_UZN") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp51" runat="server" Text='<% #Bind("OPT_OK_UZN") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp61" runat="server" Text='<% #Bind("OPT_OK_UZN") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn EditFormColumnIndex="1" DataField="OPT_TC_BAS" HeaderText="TC KİMLİK - BAŞLANGIÇ" UniqueName="OPT_TC_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp12" runat="server" Text='<% #Bind("OPT_TC_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp22" runat="server" Text='<% #Bind("OPT_TC_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp32" runat="server" Text='<% #Bind("OPT_TC_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="OPT_TC_UZN" HeaderText="UZUNLUK" UniqueName="OPT_TC_UZN" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp42" runat="server" Text='<% #Bind("OPT_TC_UZN") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp52" runat="server" Text='<% #Bind("OPT_TC_UZN") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp62" runat="server" Text='<% #Bind("OPT_TC_UZN") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn EditFormColumnIndex="1" DataField="OPT_NO_BAS" HeaderText="NUMARA - BAŞLANGIÇ" UniqueName="OPT_NO_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp121" runat="server" Text='<% #Bind("OPT_NO_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp221" runat="server" Text='<% #Bind("OPT_NO_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp321" runat="server" Text='<% #Bind("OPT_NO_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn EditFormColumnIndex="2" DataField="OPT_NO_UZN" HeaderText="UZUNLUK" UniqueName="OPT_NO_UZN" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp421" runat="server" Text='<% #Bind("OPT_NO_UZN") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp521" runat="server" Text='<% #Bind("OPT_NO_UZN") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp621" runat="server" Text='<% #Bind("OPT_NO_UZN") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn DataField="OPT_KT_BAS" HeaderText="KİTAPÇIK-BAŞLANGIÇ" UniqueName="OPT_KT_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp121x" runat="server" Text='<% #Bind("OPT_KT_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp221x" runat="server" Text='<% #Bind("OPT_KT_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp321x" runat="server" Text='<% #Bind("OPT_KT_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="OPT_D0_BAS" HeaderText="DERS 1 - BAŞLANGIÇ " UniqueName="OPT_D0_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp121x1" runat="server" Text='<% #Bind("OPT_D0_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp221x1" runat="server" Text='<% #Bind("OPT_D0_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp321x1" runat="server" Text='<% #Bind("OPT_D0_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="OPT_D1_BAS" HeaderText="DERS 2 - BAŞLANGIÇ" UniqueName="OPT_D1_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp121x11" runat="server" Text='<% #Bind("OPT_D1_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp221x11" runat="server" Text='<% #Bind("OPT_D1_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp321x11" runat="server" Text='<% #Bind("OPT_D1_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="OPT_D2_BAS" HeaderText="DERS 3 - BAŞLANGIÇ" UniqueName="OPT_D2_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp121x111" runat="server" Text='<% #Bind("OPT_D2_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp221x111" runat="server" Text='<% #Bind("OPT_D2_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp321x111" runat="server" Text='<% #Bind("OPT_D2_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridTemplateColumn DataField="OPT_D3_BAS" HeaderText="DERS 4 - BAŞLANGIÇ" UniqueName="OPT_D3_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp121x1111" runat="server" Text='<% #Bind("OPT_D3_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp221x1111" runat="server" Text='<% #Bind("OPT_D3_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp321x1111" runat="server" Text='<% #Bind("OPT_D3_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D4_BAS" HeaderText="DERS 5 - BAŞLANGIÇ" UniqueName="OPT_D4_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp121x1111x1" runat="server" Text='<% #Bind("OPT_D4_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp221x1111x1" runat="server" Text='<% #Bind("OPT_D4_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp321x1111x1" runat="server" Text='<% #Bind("OPT_D4_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D5_BAS" HeaderText="DERS 6 - BAŞLANGIÇ" UniqueName="OPT_D5_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp1121x1111x1" runat="server" Text='<% #Bind("OPT_D5_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp1221x1111x1" runat="server" Text='<% #Bind("OPT_D5_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp1321x1111x1" runat="server" Text='<% #Bind("OPT_D5_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D6_BAS" HeaderText="DERS 7 - BAŞLANGIÇ" UniqueName="OPT_D6_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp11121x1111x1" runat="server" Text='<% #Bind("OPT_D6_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp11221x1111x1" runat="server" Text='<% #Bind("OPT_D6_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp11321x1111x1" runat="server" Text='<% #Bind("OPT_D6_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D7_BAS" HeaderText="DERS 8 - BAŞLANGIÇ" UniqueName="OPT_D7_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111121x1111x1" runat="server" Text='<% #Bind("OPT_D7_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp111221x1111x1" runat="server" Text='<% #Bind("OPT_D7_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp111321x1111x1" runat="server" Text='<% #Bind("OPT_D7_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D8_BAS" HeaderText="DERS 9 - BAŞLANGIÇ" UniqueName="OPT_D8_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp1111121x1111x1" runat="server" Text='<% #Bind("OPT_D8_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp1111221x1111x1" runat="server" Text='<% #Bind("OPT_D8_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp1111321x1111x1" runat="server" Text='<% #Bind("OPT_D8_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D9_BAS" EditFormColumnIndex="1" HeaderText="DERS 10 - BAŞLANGIÇ" UniqueName="OPT_D9_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp11111121x1111x1" runat="server" Text='<% #Bind("OPT_D9_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp11111221x1111x1" runat="server" Text='<% #Bind("OPT_D9_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp11111321x1111x1" runat="server" Text='<% #Bind("OPT_D9_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D10_BAS" EditFormColumnIndex="1" HeaderText="DERS 11 - BAŞLANGIÇ" UniqueName="OPT_D10_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111111121x1111x1" runat="server" Text='<% #Bind("OPT_D10_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp111111221x1111x1" runat="server" Text='<% #Bind("OPT_D10_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp111111321x1111x1" runat="server" Text='<% #Bind("OPT_D10_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D11_BAS" EditFormColumnIndex="1" HeaderText="DERS 12 - BAŞLANGIÇ" UniqueName="OPT_D11_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111111121x1111x11" runat="server" Text='<% #Bind("OPT_D11_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp111111221x1111x11" runat="server" Text='<% #Bind("OPT_D11_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp111111321x1111x11" runat="server" Text='<% #Bind("OPT_D11_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D12_BAS" EditFormColumnIndex="1" HeaderText="DERS 13 - BAŞLANGIÇ" UniqueName="OPT_D12_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111111121x1111x111" runat="server" Text='<% #Bind("OPT_D12_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp111111221x1111x111" runat="server" Text='<% #Bind("OPT_D12_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp111111321x1111x111" runat="server" Text='<% #Bind("OPT_D12_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D13_BAS" EditFormColumnIndex="1" HeaderText="DERS 14 - BAŞLANGIÇ" UniqueName="OPT_D13_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111111121x1111x1111" runat="server" Text='<% #Bind("OPT_D13_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp111111221x1111x1111" runat="server" Text='<% #Bind("OPT_D13_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp111111321x1111x1111" runat="server" Text='<% #Bind("OPT_D13_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn DataField="OPT_D14_BAS" EditFormColumnIndex="1" HeaderText="DERS 15 - BAŞLANGIÇ" UniqueName="OPT_D14_BAS" Visible="false" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="Temp111111121x1111x11111" runat="server" Text='<% #Bind("OPT_D14_BAS") %>' Width="20" />
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Temp111111221x1111x11111" runat="server" Text='<% #Bind("OPT_D14_BAS") %>' Width="20" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Temp111111321x1111x11111" runat="server" Text='<% #Bind("OPT_D14_BAS") %>' Width="20" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>

                        <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" Text="Kullan" >
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
                    
                    <EditFormSettings ColumnNumber="3"  >
                        <EditColumn ButtonType="PushButton" CancelText="İptal" InsertText="Kaydet" UpdateText="Güncelle" />
                     </EditFormSettings>
                    <EditItemStyle BackColor="Yellow" />
                    
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
                
                <asp:EntityDataSource ID="EDS_Optik" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="OPTIK" EntityTypeFilter="OPTIK" OnInserting="EDS_Optik_Inserting" OnUpdating="EDS_Optik_Updating" >
                </asp:EntityDataSource>
		
		
            </div>
		</div>
	</div>
</asp:Content>
