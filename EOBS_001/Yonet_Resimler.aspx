<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Yonet_Resimler.aspx.cs" Inherits="EOBS_001.Yonet_Resimler" %>
<asp:Content ID="ContentResimler" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">RESiM YUKLE<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
             
                
                <div style="margin:10px;">
                 <asp:Table runat="server">
                     <asp:TableHeaderRow>
                         <asp:TableHeaderCell>RESİM ADI</asp:TableHeaderCell>
                         <asp:TableHeaderCell>RESİM</asp:TableHeaderCell>
                         <asp:TableHeaderCell></asp:TableHeaderCell>
                     </asp:TableHeaderRow>
                     <asp:TableRow>
                         <asp:TableCell><asp:TextBox runat="server" ID="rsmAd"/></asp:TableCell><asp:TableCell><asp:FileUpload runat="server" ID="rsmFile" /></asp:TableCell>
                         <asp:TableCell><div style="float:right"><asp:Button runat="server" ID="btnYukle" Text="KAYDET" OnClick="btnYukle_Click" /></div></asp:TableCell>
                     </asp:TableRow>
                 </asp:Table>
                </div>
            </div>
		</div>
	</div>

    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">RESiMLER<span></span></h2><div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
            <asp:EntityDataSource ID="EDS_Resimler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="RESIMLER" EntityTypeFilter="RESIMLER" AutoGenerateWhereClause="True" Select="" Where=""><WhereParameters><asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" /></WhereParameters></asp:EntityDataSource>
                <telerik:RadGrid ID="Grid1" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="EDS_Resimler" AllowAutomaticDeletes="True" PageSize="10">
                    <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_Resimler" AutoGenerateColumns="False" NoMasterRecordsText="Kayıt Yok." DataKeyNames="RSM_ID"><CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                      
                        <telerik:GridBoundColumn DataField="RSM_ID" DataType="System.Int32" HeaderText="RSM_ID" ReadOnly="True" UniqueName="RSM_ID" Visible="false"></telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="RSM_AD" HeaderText="RESİM ADI" UniqueName="RSM_AD" FilterControlAltText="Filter RSM_AD column" SortExpression="RSM_AD"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RSM_TYPE" HeaderText="DOSYA TİPİ" UniqueName="RSM_TYPE" FilterControlAltText="Filter RSM_TYPE column" SortExpression="RSM_TYPE" >
                            <HeaderStyle Width="80" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RSM_YOL" HeaderText="RESİM YOLU" UniqueName="RSM_YOL"></telerik:GridBoundColumn>
                        <telerik:GridBinaryImageColumn DataField="RSM_IMG" UniqueName="RSM_IMG" HeaderText="RESİM" ResizeMode="Fit" ImageWidth="80px" ImageHeight="80px">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <HeaderStyle Width="100" />
                        </telerik:GridBinaryImageColumn>
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

            </div>
		</div>
	</div>

</asp:Content>
