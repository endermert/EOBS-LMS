<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GNL_Mesajlar.aspx.cs" Inherits="EOBS_001.GNL_Mesajlar" %>
<asp:Content ID="ContentGnlMesajlar" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="Grid1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Grid1" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="pCvp" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                 <telerik:AjaxSetting AjaxControlID="Grid2">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Grid2" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="pGoster" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                        
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="cKategori">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="p2" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="p3" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="cb_Sinif">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="cb_Sube" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="cb_Kul" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="cb_Sube">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="cb_Kul" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
<asp:Panel ID="pGelen" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">GELEN KUTUSU <span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
          <telerik:RadGrid ID="Grid1" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_GelenMesaj" OnSelectedIndexChanged="Grid1_SelectedIndexChanged">
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_GelenMesaj" AutoGenerateColumns="False" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="None" DataKeyNames="MSJ_ID" NoMasterRecordsText="Mesaj Yok">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        
                        <telerik:GridBoundColumn DataField="MSJ_KIM" HeaderText="KİMDEN" UniqueName="MSJ_KIM">
                            <HeaderStyle Width="160" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign ="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="MSJ_ID" FilterControlAltText="Filter MSJ_ID column" HeaderText="MSJ_ID" SortExpression="MSJ_ID" UniqueName="MSJ_ID" DataType="System.Int32" ReadOnly="True">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="MSJ_KONU" HeaderText="KONU" UniqueName="MSJ_KONU">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="MSJ_METNI" HeaderText="MESAJ" UniqueName="MSJ_METNI">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="MSJ_KIM_ID" DataType="System.Int32" FilterControlAltText="Filter MSJ_KIM_ID column" HeaderText="MSJ_KIM_ID" SortExpression="MSJ_KIM_ID" UniqueName="MSJ_KIM_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="MSJ_TAR" DataType="System.DateTime" HeaderText="TARİH"  UniqueName="MSJ_TAR">
                            <HeaderStyle Width="110" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign ="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="MSJ_OKUNDU" DataType="System.Boolean" HeaderText="OKUNDU"  UniqueName="MSJ_OKUNDU" ReadOnly="true">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign ="Center" />
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" Text="OKU" >
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                        <%--<telerik:GridButtonColumn ButtonType="PushButton" CommandName="Delete" Text="OKU" UniqueName="DeleteColumn">
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridButtonColumn>--%>
                    </Columns>
                    <EditFormSettings >
                        <EditColumn ButtonType="PushButton" CancelText="İptal" InsertText="Kaydet" UpdateText="Güncelle" />
                    </EditFormSettings>
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
		
                <asp:SqlDataSource ID="SDS_GelenMesaj" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT MSJ_ID, MSJ_KONU, MSJ_METNI, MSJ_KIM_ID, MSJ_KIM, MSJ_TAR, MSJ_OKUNDU FROM MESAJLAR WHERE (MSJ_KIME_ID = @KUL_ID) ORDER BY MSJ_ID DESC">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Int32" Name="KUL_ID" SessionField="KulId" />
                    </SelectParameters>
                </asp:SqlDataSource>
		
        </div>
		</div>
	</div>
</asp:Panel>
    <asp:Panel ID="pCvp" runat="server">
    <div class="main_container container_16 clearfix">
		<div class="box grid_8">
			<h2 class="box_head">GELEN MESAJ <span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
              <div style="margin:10px;">
                 <asp:Table runat="server" ID="tbl1">
                  <asp:TableRow>
                      <asp:TableCell><b>KONU</b></asp:TableCell>
                      <asp:TableCell>:</asp:TableCell>
                      <asp:TableCell><asp:Label runat="server" ID="lKonu"/></asp:TableCell></asp:TableRow><asp:TableRow>
                      <asp:TableCell><b>KİMDEN</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="lKimden"/></asp:TableCell></asp:TableRow><asp:TableRow>
                      <asp:TableCell><b>TARİH</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="lTarih"/></asp:TableCell></asp:TableRow><asp:TableRow>
                      <asp:TableCell><b>MESAJ</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="lMesaj"/></asp:TableCell></asp:TableRow></asp:Table></div></div></div><div class="box grid_8">
			<h2 class="box_head">YANITLA <span></span></h2><div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
              <div style="margin:10px;">
                 <asp:Table runat="server" ID="Table1">
                  <asp:TableRow><asp:TableCell><b>KONU</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" ID="tKonu" /></asp:TableCell></asp:TableRow><%--<asp:TableRow><asp:TableCell><b>KİMDEN</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="Label2"/></asp:TableCell></asp:TableRow>--%><%--<asp:TableRow><asp:TableCell><b>TARİH</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="Label3"/></asp:TableCell></asp:TableRow>--%><asp:TableRow><asp:TableCell><b>MESAJ</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" ID="tMesaj" Width="300" Height="200" TextMode="MultiLine" /></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell><asp:HiddenField runat="server" ID="tMsg_ID" /></asp:TableCell><asp:TableCell></asp:TableCell><asp:TableCell><asp:Button runat="server" ID="btnTanitla" Text="TANITLA" OnClick="btnTanitla_Click" /></asp:TableCell></asp:TableRow>
                 </asp:Table></div></div></div>

    </div></asp:Panel>


    <asp:Panel ID="pGiden" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">GiDEN KUTUSU <span></span></h2><div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
          <telerik:RadGrid ID="Grid2" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_GidenMesaj" OnSelectedIndexChanged="Grid2_SelectedIndexChanged">
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_GidenMesaj" AutoGenerateColumns="False" CommandItemSettings-RefreshText="Yenile" CommandItemSettings-ExportToExcelText="Excell" CommandItemDisplay="None" DataKeyNames="MSJ_ID" NoMasterRecordsText="Mesaj Yok"><CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        
                        <telerik:GridBoundColumn DataField="MSJ_KIME" FilterControlAltText="Filter MSJ_KIME column" HeaderText="KİME" SortExpression="MSJ_KIME" UniqueName="MSJ_KIME">
                            <HeaderStyle Width="160px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MSJ_KONU" FilterControlAltText="Filter MSJ_KONU column" HeaderText="KONU" SortExpression="MSJ_KONU" UniqueName="MSJ_KONU"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MSJ_TAR" DataType="System.DateTime" FilterControlAltText="Filter MSJ_TAR column" HeaderText="TARİH" SortExpression="MSJ_TAR" UniqueName="MSJ_TAR">
                            <HeaderStyle Width="110px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="MSJ_OKUNDU" DataType="System.Boolean" FilterControlAltText="Filter MSJ_OKUNDU column" HeaderText="OKUNDU" SortExpression="MSJ_OKUNDU" UniqueName="MSJ_OKUNDU">
                            <HeaderStyle Width="40px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" Text="GöSTER" >
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                    </Columns>
                        
                    
                <EditFormSettings><EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn></EditFormSettings></MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
		
                <asp:SqlDataSource ID="SDS_GidenMesaj" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT MSJ_ID, MSJ_KONU, MSJ_METNI, MSJ_KIME_ID, MSJ_KIME, MSJ_OKUNDU, MSJ_TAR FROM MESAJLAR WHERE (MSJ_KIM_ID = @KUL_ID) ORDER BY MSJ_ID DESC"><SelectParameters>
                        <asp:SessionParameter DbType="Int32" Name="KUL_ID" SessionField="KulId" />
                    </SelectParameters>
                </asp:SqlDataSource>
		
        </div>
		</div>
	</div>
</asp:Panel>
<asp:Panel ID="pGoster" runat="server">
    <div class="main_container container_16 clearfix full_size"">
		<div class="box grid_16">
			<h2 class="box_head">GiDEN MESAJ <span></span></h2><div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
              <div style="margin:10px;">
                 <asp:Table runat="server" ID="Table2">
                  <asp:TableRow>
                      <asp:TableCell><b>KONU</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="lKonu1"/></asp:TableCell></asp:TableRow><asp:TableRow>
                      <asp:TableCell><b>KİME</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="lKime1"/></asp:TableCell></asp:TableRow><asp:TableRow>
                      <asp:TableCell><b>TARİH</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="lTarih1"/></asp:TableCell></asp:TableRow><asp:TableRow>
                      <asp:TableCell><b>MESAJ</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:Label runat="server" ID="lMesaj1"/></asp:TableCell></asp:TableRow></asp:Table></div></div></div></div></asp:Panel><asp:Panel ID="pYeniMesaj" runat="server">
        <div class="main_container container_16 clearfix full_size"">
		<div class="box grid_16">
			<h2 class="box_head">YENi MESAJ <span></span></h2><div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
              <div style="margin:10px;">
                  <asp:SqlDataSource runat="server" ID="SDS_Ogretmenler" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT KULLANICILAR.KUL_ID, KULLANICILAR.KUL_ADSOYAD FROM ARA_TBL2 INNER JOIN KULLANICILAR ON ARA_TBL2.KUL_ID = KULLANICILAR.KUL_ID WHERE (ARA_TBL2.OKL_ID = @OKL_ID)"><SelectParameters><asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" /></SelectParameters></asp:SqlDataSource>
                  <asp:SqlDataSource ID="SDS_Siniflar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SNF_ID, SNF_AD FROM SINIFLAR WHERE (OKL_ID = @OKL_ID)">
            <SelectParameters>
                <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Subeler" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SUB_ID, SUB_AD FROM SUBELER WHERE (OKL_ID = @OKL_ID) AND (SNF_ID = @SNF_ID)">
            <SelectParameters>
                <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                <asp:ControlParameter ControlID="cb_Sinif" DbType="Int32" Name="SNF_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_Kullar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT KUL_ID, KUL_ADSOYAD FROM KULLANICILAR WHERE (SUB_ID = @SUB_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cb_Sube" DbType="Int32" Name="SUB_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
                  <asp:Table runat="server" ID="Table3">
                      <asp:TableRow>
                          <asp:TableCell><b>SAYIN</b></asp:TableCell><asp:TableCell><b>:</b></asp:TableCell><asp:TableCell>
                              <telerik:RadComboBox runat="server" ID="cKategori" AutoPostBack="true" EmptyMessage="SEÇİNİZ" Skin="WebBlue" OnSelectedIndexChanged="cKategori_SelectedIndexChanged">
                                  <Items>
                                      <telerik:RadComboBoxItem runat="server" Text="ÖĞRETMENLER" Value="2" />
                                      <telerik:RadComboBoxItem runat="server" Text="ÖĞRENCİLER" Value="3" />
                                  </Items>
                              </telerik:RadComboBox>
                          </asp:TableCell></asp:TableRow><asp:TableRow>
                          <asp:TableCell></asp:TableCell><asp:TableCell></asp:TableCell><asp:TableCell>
                              <asp:Panel runat="server" ID="p2">
                                  <telerik:RadComboBox ID="cOgrentmen" Runat="server" Skin="WebBlue" AutoPostBack="true" DataSourceID="SDS_Ogretmenler" DataTextField="KUL_ADSOYAD" DataValueField="KUL_ID" EmptyMessage="TÜMÜ" Width="200" ></telerik:RadComboBox>
                              </asp:Panel>
                              <asp:Panel runat="server" ID="p3">
                                  <telerik:RadComboBox ID="cb_Sinif" Runat="server" Skin="WebBlue" AutoPostBack="true" DataSourceID="SDS_Siniflar" DataTextField="SNF_AD" DataValueField="SNF_ID" EmptyMessage="TÜMÜ" Width="100" OnSelectedIndexChanged="cb_Sinif_SelectedIndexChanged" ></telerik:RadComboBox>
                                  <telerik:RadComboBox ID="cb_Sube" Runat="server" Skin="WebBlue" AutoPostBack="true" DataSourceID="SDS_Subeler" DataTextField="SUB_AD" DataValueField="SUB_ID" EmptyMessage="TÜMÜ" Width="100" OnSelectedIndexChanged="cb_Sube_SelectedIndexChanged" ></telerik:RadComboBox>
                                  <telerik:RadComboBox ID="cb_Kul" Runat="server" Skin="WebBlue" DataSourceID="SDS_Kullar" DataTextField="KUL_ADSOYAD" DataValueField="KUL_ID" EmptyMessage="TÜMÜ" EnableCheckAllItemsCheckBox="true" Width="250" ></telerik:RadComboBox>
                              </asp:Panel>
                              <%--<telerik:RadComboBox ID="RadComboBox1" Runat="server" Skin="WebBlue" AutoPostBack="true" DataSourceID="SDS_Siniflar" DataTextField="SNF_AD" DataValueField="SNF_ID" EmptyMessage="TÜMÜ" Width="100" ></telerik:RadComboBox>--%>
                          </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell><b>KONU</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" ID="txtKonu" /></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell><b>MESAJ</b></asp:TableCell><asp:TableCell>:</asp:TableCell><asp:TableCell><asp:TextBox runat="server" ID="txtMesaj" TextMode="MultiLine" Width="400" Height="200"/></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableCell></asp:TableCell><asp:TableCell></asp:TableCell><asp:TableCell><asp:Button runat="server" ID="btnYeniMsg" Text="GÖNDER" OnClick="btnYeniMsg_Click" /></asp:TableCell></asp:TableRow>

                 </asp:Table>

              </div>

			</div>

		</div>

        </div>

    </asp:Panel>
</asp:Content>