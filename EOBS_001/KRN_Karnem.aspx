<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KRN_Karnem.aspx.cs" Inherits="EOBS_001.KRN_Karnem" %>
<asp:Content ID="ContentKarnem" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">KARNEM<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
            <asp:EntityDataSource ID="EDS_KarneDersNot" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="KARNEDERSNOT" Where="">
             <WhereParameters>
                 <asp:SessionParameter DbType="Int32" DefaultValue="0" Name="KUL_ID" SessionField="KulId" />
             </WhereParameters>
            </asp:EntityDataSource>
            <asp:EntityDataSource ID="EDS_Dersler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="DERSLER" Select="it.[DRS_ID], it.[DRS_AD]"></asp:EntityDataSource>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
           <telerik:RadGrid ID="Grid1" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue" DataSourceID="EDS_KarneDersNot" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="EDS_KarneDersNot" AutoGenerateColumns="False" NoMasterRecordsText="Bu Hafta İçin Duyurunuz Yok." DataKeyNames="KDN_ID">
    
<CommandItemSettings RefreshText="Yenile" ExportToExcelText="Excell" ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column"></RowIndicatorColumn>

<ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column"></ExpandCollapseColumn>
                    <Columns>
                        
                        <%--<telerik:GridBoundColumn DataField="DRS_ID" HeaderText="DRS_ID" UniqueName="DRS_ID" DataType="System.Int32" FilterControlAltText="Filter DRS_ID column" SortExpression="DRS_ID" >
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridDropDownColumn DropDownControlType="DropDownList" DataField="DRS_ID" DataSourceID="EDS_Dersler" HeaderText="DERS ADI" ListTextField="DRS_AD" ListValueField="DRS_ID" UniqueName="DRS_ID">
                        </telerik:GridDropDownColumn>
                        <telerik:GridBoundColumn DataField="KDN_S1" DataType="System.Int16" HeaderText="S1" HeaderTooltip="1.SINAV"  UniqueName="KDN_S1">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_S2" DataType="System.Int16" HeaderText="S2" HeaderTooltip="2.SINAV" UniqueName="KDN_S2">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_S3" DataType="System.Int16"  HeaderText="S3" HeaderTooltip="3.SINAV" UniqueName="KDN_S3">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_S4" DataType="System.Int16"  HeaderText="S4" HeaderTooltip="4.SINAV" UniqueName="KDN_S4">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PRO1" DataType="System.Int16" HeaderText="PR1" HeaderTooltip="1.PROJE" UniqueName="KDN_PRO1">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PRO2" DataType="System.Int16" HeaderText="PR2" HeaderTooltip="2.PROJE" UniqueName="KDN_PRO2">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PROORT" DataType="System.Decimal" HeaderText="PRO" HeaderTooltip="PROJE ORT." UniqueName="KDN_PROORT">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="KDN_PEK1" DataType="System.Int16" FilterControlAltText="Filter KDN_PEK1 column" HeaderText="KDN_PEK1" SortExpression="KDN_PEK1" UniqueName="KDN_PEK1">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PEK2" DataType="System.Int16" FilterControlAltText="Filter KDN_PEK2 column" HeaderText="KDN_PEK2" SortExpression="KDN_PEK2" UniqueName="KDN_PEK2">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PEK3" DataType="System.Int16" FilterControlAltText="Filter KDN_PEK3 column" HeaderText="KDN_PEK3" SortExpression="KDN_PEK3" UniqueName="KDN_PEK3">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="KDN_PEKORT" DataType="System.Decimal" HeaderText="PO1" HeaderTooltip="1.PERFORMANS ORT." UniqueName="KDN_PEKORT">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="KDN_PG1" DataType="System.Int16" FilterControlAltText="Filter KDN_PG1 column" HeaderText="KDN_PG1" SortExpression="KDN_PG1" UniqueName="KDN_PG1">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PG2" DataType="System.Int16" FilterControlAltText="Filter KDN_PG2 column" HeaderText="KDN_PG2" SortExpression="KDN_PG2" UniqueName="KDN_PG2">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PG3" DataType="System.Int16" FilterControlAltText="Filter KDN_PG3 column" HeaderText="KDN_PG3" SortExpression="KDN_PG3" UniqueName="KDN_PG3">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PG4" DataType="System.Int16" FilterControlAltText="Filter KDN_PG4 column" HeaderText="KDN_PG4" SortExpression="KDN_PG4" UniqueName="KDN_PG4">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PG5" DataType="System.Int16" FilterControlAltText="Filter KDN_PG5 column" HeaderText="KDN_PG5" SortExpression="KDN_PG5" UniqueName="KDN_PG5">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="KDN_PGORT" DataType="System.Decimal" HeaderText="PO2" HeaderTooltip="2.PERFORMANS ORT." UniqueName="KDN_PGORT">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PERORT" DataType="System.Decimal" HeaderText="PO" HeaderTooltip="GENEL PERFORMANS ORT." UniqueName="KDN_PERORT">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_NOT" DataType="System.Int16" HeaderText="NOT" UniqueName="KDN_NOT">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KDN_PUAN" DataType="System.Decimal" HeaderText="PUAN" UniqueName="KDN_PUAN">
                            <HeaderStyle Width="30" HorizontalAlign="Center" />
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
