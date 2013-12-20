<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OGR_Sinavlar.aspx.cs" Inherits="EOBS_001.OGR_Sinavlar" %>
<asp:Content ID="ContentSinavlar" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">SINAVLAR<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:SqlDataSource ID="SDS_SinavSnc" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT SINAVSNC.SNS_ID, SINAVLAR.SNV_AD, SINAVSNC.SNS_SS, SINAVSNC.SNS_DS, SINAVSNC.SNS_YS, SINAVSNC.SNS_BS, SINAVSNC.SNS_NS, SINAVSNC.SNS_PUAN, SINAVSNC.SNS_ORTSUB, SINAVSNC.SNS_SRASUB, SINAVSNC.SNS_TOPSUB, SINAVSNC.SNS_ORTSNF, SINAVSNC.SNS_SRASNF, SINAVSNC.SNS_TOPSNF, SINAVSNC.SNS_ORTOKL, SINAVSNC.SNS_SRAOKL, SINAVSNC.SNS_TOPOKL, SINAVSNC.SNS_ORTKRM, SINAVSNC.SNS_SRAKRM, SINAVSNC.SNS_TOPKRM, SINAVSNC.SNS_BSRYZD, SINAVSNC.SNS_BSRYRM, SINAVLAR.SNV_EKLTAR, SINAVTIP.STP_AD FROM SINAVSNC INNER JOIN SINAVLAR ON SINAVSNC.SNV_ID = SINAVLAR.SNV_ID INNER JOIN SINAVDETAY ON SINAVLAR.SDT_ID = SINAVDETAY.SDT_ID INNER JOIN SINAVTIP ON SINAVDETAY.STP_ID = SINAVTIP.STP_ID WHERE (SINAVSNC.KUL_ID = @KUL_ID) ORDER BY SINAVLAR.SNV_EKLTAR DESC">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Int32" Name="KUL_ID" SessionField="KulId" />
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
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
           <telerik:RadGrid ID="Grid1" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="SDS_SinavSnc" OnSelectedIndexChanged="Grid1_SelectedIndexChanged" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_SinavSnc" AutoGenerateColumns="False" NoMasterRecordsText="Henüz Sınav Girilmemiş." DataKeyNames="SNS_ID">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
    
                    <Columns>
                        <%--<telerik:GridBoundColumn DataField="SNS_ID" HeaderText="SNS_ID" UniqueName="SNS_ID" DataType="System.Int32" FilterControlAltText="Filter SNS_ID column" ReadOnly="True" SortExpression="SNS_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="STP_AD" HeaderText="TÜR" UniqueName="SNV_AD"  >
                            <HeaderStyle Width="60"/>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNV_AD" HeaderText="SINAV ADI" UniqueName="SNV_AD">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_SS" DataType="System.Int16" HeaderText="SS" HeaderTooltip="Soru Sayısı" UniqueName="SNS_SS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_DS" DataType="System.Int16" HeaderText="DS"  UniqueName="SNS_DS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_YS" DataType="System.Int16" HeaderText="YS"  UniqueName="SNS_YS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_BS" DataType="System.Int16" HeaderText="BS" UniqueName="SNS_BS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_NS" DataType="System.Decimal" HeaderText="NS" UniqueName="SNS_NS">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_PUAN" DataType="System.Decimal" HeaderText="PUAN" UniqueName="SNS_PUAN">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="SNS_ORTSUB" DataType="System.Decimal" FilterControlAltText="Filter SNS_ORTSUB column" HeaderText="SNS_ORTSUB" SortExpression="SNS_ORTSUB" UniqueName="SNS_ORTSUB">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="SNS_SRASUB" DataType="System.Int16" HeaderText="ŞUB" UniqueName="SNS_SRASUB">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="SNS_TOPSUB" DataType="System.Int16" FilterControlAltText="Filter SNS_TOPSUB column" HeaderText="SNS_TOPSUB" SortExpression="SNS_TOPSUB" UniqueName="SNS_TOPSUB">
                        </telerik:GridBoundColumn>--%>
                        <%--<telerik:GridBoundColumn DataField="SNS_ORTSNF" DataType="System.Decimal" FilterControlAltText="Filter SNS_ORTSNF column" HeaderText="SNS_ORTSNF" SortExpression="SNS_ORTSNF" UniqueName="SNS_ORTSNF">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="SNS_SRASNF" DataType="System.Int16" HeaderText="SNF" UniqueName="SNS_SRASNF">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="SNS_TOPSNF" DataType="System.Int16" FilterControlAltText="Filter SNS_TOPSNF column" HeaderText="SNS_TOPSNF" SortExpression="SNS_TOPSNF" UniqueName="SNS_TOPSNF">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_ORTOKL" DataType="System.Decimal" FilterControlAltText="Filter SNS_ORTOKL column" HeaderText="SNS_ORTOKL" SortExpression="SNS_ORTOKL" UniqueName="SNS_ORTOKL">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="SNS_SRAOKL" DataType="System.Int16" HeaderText="OKL" UniqueName="SNS_SRAOKL">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="SNS_TOPOKL" DataType="System.Int16" FilterControlAltText="Filter SNS_TOPOKL column" HeaderText="SNS_TOPOKL" SortExpression="SNS_TOPOKL" UniqueName="SNS_TOPOKL">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_ORTKRM" DataType="System.Decimal" FilterControlAltText="Filter SNS_ORTKRM column" HeaderText="SNS_ORTKRM" SortExpression="SNS_ORTKRM" UniqueName="SNS_ORTKRM">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="SNS_SRAKRM" DataType="System.Int16" HeaderText="KRM" UniqueName="SNS_SRAKRM">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="SNS_TOPKRM" DataType="System.Int16" FilterControlAltText="Filter SNS_TOPKRM column" HeaderText="SNS_TOPKRM" SortExpression="SNS_TOPKRM" UniqueName="SNS_TOPKRM">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="SNS_BSRYZD" DataType="System.Decimal" HeaderText="YZD"  UniqueName="SNS_BSRYZD">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SNS_BSRYRM" HeaderText="SNC" UniqueName="SNS_BSRYRM">
                            <HeaderStyle Width="40" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                         <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" Text="DETAY" >
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
