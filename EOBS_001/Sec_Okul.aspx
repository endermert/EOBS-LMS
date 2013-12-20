<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sec_Okul.aspx.cs" Inherits="EOBS_001.Sec_Okul" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="ContentOkulSec" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">AKTiF OKUL SEC<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">

          <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
         <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="GridOkullar">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="GridOkullar" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
           <telerik:RadGrid ID="GridOkullar" runat="server" CellSpacing="0"  GridLines="None" AllowPaging="True" Skin="WebBlue"  DataSourceID="SDS_Okullar" OnSelectedIndexChanged="GridOkullar_SelectedIndexChanged" >
            
            <PagerStyle Mode="NextPrev" FirstPageToolTip="İlk Sayfa" LastPageToolTip="Son Sayfa" NextPagesToolTip="Sonraki Sayfalar" NextPageToolTip="Sonraki Sayfa" PagerTextFormat="{4}Gösterilen: <strong>{2}</strong>-<strong>{3}</strong> Toplam: <strong>{5}</strong>" PageSizeLabelText="Satır Sayısı:" PrevPagesToolTip="Önceki Sayfalar" PrevPageToolTip="Önceki Sayfa"  />
                <MasterTableView DataSourceID="SDS_Okullar" AutoGenerateColumns="False" DataKeyNames="OKL_ID" NoMasterRecordsText="Kayıt Yok">
    
                    <Columns>
                        <%--<telerik:GridBoundColumn DataField="OKL_ID" DataType="System.Int32" FilterControlAltText="Filter OKL_ID column" HeaderText="OKL_ID" ReadOnly="True" SortExpression="OKL_ID" UniqueName="OKL_ID">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="OKL_KODU" HeaderText="OKUL KODU" SortExpression="OKL_KODU" UniqueName="OKL_KODU">
                            <HeaderStyle Width="100px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OKL_ADI" FilterControlAltText="Filter OKL_ADI column" HeaderText="OKUL ADI" SortExpression="OKL_ADI" UniqueName="OKL_ADI">
                        </telerik:GridBoundColumn>
                        <%--<telerik:GridBoundColumn DataField="OKL_SIRA" DataType="System.Int32" FilterControlAltText="Filter OKL_SIRA column" HeaderText="OKL_SIRA" SortExpression="OKL_SIRA" UniqueName="OKL_SIRA">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridButtonColumn ButtonType="PushButton" CommandName="Select" Text="Seç" >
                            <HeaderStyle Width="40px"></HeaderStyle>
                        </telerik:GridButtonColumn>
                    </Columns>
                    <EditFormSettings >
                        <EditColumn ButtonType="PushButton" CancelText="İptal" UpdateText="Güncelle" />
                    </EditFormSettings>
                </MasterTableView>
            <StatusBarSettings LoadingText="Yükleniyor..." ReadyText="Hazır" />

<FilterMenu EnableImageSprites="False"></FilterMenu>
        </telerik:RadGrid>
		
		
         <asp:EntityDataSource ID="EDS_Okullar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="OKULLAR" EntityTypeFilter="OKULLAR">
         </asp:EntityDataSource>
		


                <asp:SqlDataSource ID="SDS_Okullar" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT     dbo.OKULLAR.*
FROM         dbo.ARA_TBL2 INNER JOIN
                      dbo.OKULLAR ON dbo.ARA_TBL2.OKL_ID = dbo.OKULLAR.OKL_ID WHERE dbo.ARA_TBL2.KUL_ID=@KUL_ID">
                    <SelectParameters>
                        <asp:Parameter DbType="Int32" Name="KUL_ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
		


            </div>
		</div>
	</div>
</asp:Content>
