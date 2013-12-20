<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OGR_SinavDetay.aspx.cs" Inherits="EOBS_001.OGR_SinavDetay" %>
<asp:Content ID="ContentSinavDetay" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">SINAVLAR DETAYLARI<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_SnvDrsSnc" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT DRSSNVSNC.DSN_SS, DRSSNVSNC.DSN_DS, DRSSNVSNC.DSN_YS, DRSSNVSNC.DSN_BS, DRSSNVSNC.DSN_NS, DRSSNVSNC.DSN_PUAN, DRSSNVSNC.DSN_ORTSUB, DRSSNVSNC.DSN_SRASUB, DRSSNVSNC.DSN_TOPSUB, DRSSNVSNC.DSN_ORTSNF, DRSSNVSNC.DSN_SRASNF, DRSSNVSNC.DSN_TOPSNF, DRSSNVSNC.DSN_ORTOKL, DRSSNVSNC.DSN_SRAOKL, DRSSNVSNC.DSN_TOPOKL, DRSSNVSNC.DSN_ORTKRM, DRSSNVSNC.DSN_SRAKRM, DRSSNVSNC.DSN_TOPKRM, DRSSNVSNC.DSN_BSRYZD, DRSSNVSNC.DSN_BSRYRM, DERSLER.DRS_AD FROM DRSSNVSNC INNER JOIN DERSLER ON DRSSNVSNC.DRS_ID = DERSLER.DRS_ID WHERE (DRSSNVSNC.SNV_ID = @SNV_ID) AND (DRSSNVSNC.KUL_ID = @KUL_ID)">
                    <SelectParameters>
                        <asp:Parameter Name="SNV_ID" />
                        <asp:Parameter Name="KUL_ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            
                <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="Grid2">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Grid2" LoadingPanelID="RadAjaxLoadingPanel1">
                            </telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
                </telerik:RadAjaxManager>
           
            <telerik:RadGrid ID="Grid2" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_SnvDrsSnc" >
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_SnvDrsSnc" AutoGenerateColumns="False" NoMasterRecordsText="Kayıt Yok.">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <telerik:GridBoundColumn DataField="DRS_AD" HeaderText="DERS ADI" UniqueName="DRS_AD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_SS" DataType="System.Int16" HeaderText="SS" HeaderTooltip="Soru Sayısı" UniqueName="DSN_SS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_DS" DataType="System.Int16" HeaderText="DS" UniqueName="DSN_DS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_YS" DataType="System.Int16" HeaderText="YS"  UniqueName="DSN_YS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_BS" DataType="System.Int16" HeaderText="BS" UniqueName="DSN_BS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_NS" DataType="System.Decimal" HeaderText="NS" UniqueName="DSN_NS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_PUAN" DataType="System.Decimal" HeaderText="PUAN" UniqueName="DSN_PUAN">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="DSN_ORTSUB" DataType="System.Decimal" FilterControlAltText="Filter DSN_ORTSUB column" HeaderText="DSN_ORTSUB" SortExpression="DSN_ORTSUB" UniqueName="DSN_ORTSUB">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="DSN_SRASUB" DataType="System.Int16" HeaderText="SUB" UniqueName="DSN_SRASUB">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="DSN_TOPSUB" DataType="System.Int16" FilterControlAltText="Filter DSN_TOPSUB column" HeaderText="DSN_TOPSUB" SortExpression="DSN_TOPSUB" UniqueName="DSN_TOPSUB">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_ORTSNF" DataType="System.Decimal" FilterControlAltText="Filter DSN_ORTSNF column" HeaderText="DSN_ORTSNF" SortExpression="DSN_ORTSNF" UniqueName="DSN_ORTSNF">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="DSN_SRASNF" DataType="System.Int16" HeaderText="SNF" UniqueName="DSN_SRASNF">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="DSN_TOPSNF" DataType="System.Int16" FilterControlAltText="Filter DSN_TOPSNF column" HeaderText="DSN_TOPSNF" SortExpression="DSN_TOPSNF" UniqueName="DSN_TOPSNF">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_ORTOKL" DataType="System.Decimal" FilterControlAltText="Filter DSN_ORTOKL column" HeaderText="DSN_ORTOKL" SortExpression="DSN_ORTOKL" UniqueName="DSN_ORTOKL">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="DSN_SRAOKL" DataType="System.Int16" HeaderText="OKL" UniqueName="DSN_SRAOKL">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                       <%-- <telerik:GridBoundColumn DataField="DSN_TOPOKL" DataType="System.Int16" FilterControlAltText="Filter DSN_TOPOKL column" HeaderText="DSN_TOPOKL" SortExpression="DSN_TOPOKL" UniqueName="DSN_TOPOKL">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_ORTKRM" DataType="System.Decimal" FilterControlAltText="Filter DSN_ORTKRM column" HeaderText="DSN_ORTKRM" SortExpression="DSN_ORTKRM" UniqueName="DSN_ORTKRM">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="DSN_SRAKRM" DataType="System.Int16" HeaderText="KRM" UniqueName="DSN_SRAKRM">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                      <%--  <telerik:GridBoundColumn DataField="DSN_TOPKRM" DataType="System.Int16" FilterControlAltText="Filter DSN_TOPKRM column" HeaderText="DSN_TOPKRM" SortExpression="DSN_TOPKRM" UniqueName="DSN_TOPKRM">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="DSN_BSRYZD" DataType="System.Decimal" HeaderText="YZD" UniqueName="DSN_BSRYZD">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DSN_BSRYRM" HeaderText="SNC"  UniqueName="DSN_BSRYRM">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        
                       
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
