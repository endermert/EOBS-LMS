<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HEP_VeriGiris.aspx.cs" Inherits="EOBS_001.HEP_VeriGiris" %>
<asp:Content ID="Content_HEP_VeriGiris" ContentPlaceHolderID="MainContent" runat="server">
<div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">HEP VERi GiRiSi <span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
         <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RC_Sinif">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RC_Sube" LoadingPanelID="RadAjaxLoadingPanel1">
                        </telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
            <div style="margin:10px;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lbl_sinif" Text="SINIF :"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadComboBox ID="RC_Sinif" Runat="server" AutoPostBack="true" Skin="WebBlue" DataSourceID="EDS_Siniflar" DataTextField="SNF_AD" DataValueField="SNF_ID" EmptyMessage="Seçiniz.." OnSelectedIndexChanged="RC_Sinif_SelectedIndexChanged" >
                                </telerik:RadComboBox>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbl_sube" Text="ŞUBE :"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadComboBox ID="RC_Sube" Runat="server" AutoPostBack="true" Skin="WebBlue" DataSourceID="EDS_Subeler" DataTextField="SUB_AD" DataValueField="SUB_ID" EmptyMessage="Seçiniz.." >
                                </telerik:RadComboBox>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbl_ders" Text="HEP :"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadComboBox ID="RC_Ders" Runat="server" Skin="WebBlue" EmptyMessage="Seçiniz.." >
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="1.HEP" Value="1" />
                                        <telerik:RadComboBoxItem runat="server" Text="2.HEP" Value="2" />
                                        <telerik:RadComboBoxItem runat="server" Text="3.HEP" Value="3" />
                                        <telerik:RadComboBoxItem runat="server" Text="4.HEP" Value="4" />
                                    </Items>
                                </telerik:RadComboBox>
                            </td>
                            <td>
                                <asp:Button ID="btnListe" runat="server" Text="Listele" OnClick="btnListe_Click" />
                            </td>
                            <td>
                                <asp:Button ID="btnKayit" runat="server" Text="Kaydet" OnClick="btnKayit_Click" />
                            </td>
                        </tr>
                    </table>
            </div>
                
                <asp:EntityDataSource ID="EDS_Siniflar" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SINIFLAR" Select="it.[SNF_ID], it.[SNF_AD]" AutoGenerateWhereClause="True" Where="">
                    <WhereParameters>
                       <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                    </WhereParameters>
                </asp:EntityDataSource>
                 <asp:EntityDataSource ID="EDS_Subeler" runat="server" ConnectionString="name=EOBSEntities" DefaultContainerName="EOBSEntities" EnableFlattening="False" EntitySetName="SUBELER" Select="it.[SUB_ID], it.[SUB_AD], it.[SNF_ID]" AutoGenerateWhereClause="True" Where="">
                    <WhereParameters>
                       <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                       <asp:ControlParameter ControlID="RC_Sinif" DbType="Int32" Name="SNF_ID" PropertyName="SelectedValue" />
                    </WhereParameters>
                </asp:EntityDataSource>
                 
            </div>
		</div>
	</div>
      <asp:Panel ID="Panel1" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">

                
                String.prototype.trim = function () {
                    return this.replace(/^\s+|\s+$/g, '');
                };
                function Topla() {
                    var say = 0;
                    var txt_baba = document.getElementById('MainContent_txt_baba');
                    txt_baba.value = '';
                    var txt_syc = document.getElementById('MainContent_hid_syc');
                    if (txt_syc != null) {
                        say = txt_syc.value;
                    }
                    for (var i = 1; i <= say; i++) {
                        var str1 = '';
                        var h1 = document.getElementById('MainContent_h1_' + i);
                        var h2 = document.getElementById('MainContent_h2_' + i);
                        var h3 = document.getElementById('MainContent_h3_' + i);
                        var h4 = document.getElementById('MainContent_h4_' + i);
                        //var h5 = document.getElementById('MainContent_h5_' + i);
                        //var h6 = document.getElementById('MainContent_h6_' + i);
                        //var h7 = document.getElementById('MainContent_h7_' + i);
                        //var h8 = document.getElementById('MainContent_h8_' + i);
                        var g1 = document.getElementById('MainContent_g1_' + i);
                        var g2 = document.getElementById('MainContent_g2_' + i);
                        var g3 = document.getElementById('MainContent_g3_' + i);
                        var g4 = document.getElementById('MainContent_g4_' + i);
                        //var g5 = document.getElementById('MainContent_g5_' + i);
                        //var g6 = document.getElementById('MainContent_g6_' + i);
                        //var g7 = document.getElementById('MainContent_g7_' + i);
                        //var g8 = document.getElementById('MainContent_g8_' + i);
                        
                        //str1 = h1.value + '!' + g1.value + '!' + h2.value + '!' + g2.value + '!' + h3.value + '!' + g3.value + '!' + h4.value + '!' + g4.value + '!' + h5.value + '!' + g5.value + '!' + h6.value + '!' + g6.value + '!' + h7.value + '!' + g7.value + '!' + h8.value + '!' + g8.value;
                        str1 = h1.value + '!' + g1.value + '!' + h2.value + '!' + g2.value + '!' + h3.value + '!' + g3.value + '!' + h4.value + '!' + g4.value ;
                        txt_baba.value = txt_baba.value + str1 + '|';
                    }

                }
            </script>
         <%
             
             //if(!Page.IsPostBack)
             //{
             int syc = 0;
             //hid_syc.Value = "18";
            for (int j=0;j<1;j++)
            {
                //lbl.Text = "OGRENCi LiSTESi";
                //lbl.ID = "lbl" + j.ToString();

        %>
        <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">OGRENCi LiSTESi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <div style="position:absolute;z-index:-10;"><asp:TextBox ID="txt_baba" runat="server" Width="1" Height="1" TextMode="MultiLine" /></div>
                <asp:Table ID="Table1" runat="server" BackColor="LightGray" >
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="70" >
                                <div style=" margin:0px 10px 0px 10px;">
                                    <asp:Label ID="Label21" runat="server" Text="NUMARA" Width="70" />
                                </div>
                            </asp:TableHeaderCell><asp:TableHeaderCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="Label22" runat="server" Text="AD" Width="100" />
                                </div>
                            </asp:TableHeaderCell><asp:TableHeaderCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="Label23" runat="server" Text="SOYAD" Width="100" />
                                </div>
                            </asp:TableHeaderCell><asp:TableHeaderCell ColumnSpan="2" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label24" runat="server" Font-Size="XX-Small" Text="DERS ÇALIŞMA SÜRESİ" />
                                </div>
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="2" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label2" runat="server" Font-Size="XX-Small" Text="ÇÖZDÜĞÜ SORU SAYISI" />
                                </div>
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="2" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label25" runat="server" Font-Size="XX-Small" Text="OKUD. KİTAP SAYFASI" />
                                </div>
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="2" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label26" runat="server" Font-Size="XX-Small" Text="OKUD. İNG. KTP SAYFASI" />
                                </div>
                            </asp:TableHeaderCell>
                           <%-- <asp:TableHeaderCell ColumnSpan="2" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label3" runat="server" Text="O. KİTAP SAY." />
                                </div>
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="2" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label27" runat="server" Text="İNG. KİTAP" />
                                </div>
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="2" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label31" runat="server" Text="KİTAP S. NET" />
                                </div>
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="2" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label32" runat="server" Text="KZNM DAV." />
                                </div>
                            </asp:TableHeaderCell>--%>
                            

                        </asp:TableHeaderRow><asp:TableRow  >
                           <%-- <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="50" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <input id="chk_0" type="checkbox" class="CheckBox" name="tumu" value="ON" title ="Tümünü Seç" onclick="HepsiniSec(this);">
                                </div>
                            </asp:TableCell>--%>
                            <asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="70" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <%--<asp:Label ID="Label1" runat="server" Text="NUMARA" />--%>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <%--<asp:Label ID="Label2" runat="server" Text="AD" />--%>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <%--<asp:Label ID="Label3" runat="server" Text="SOYAD" />--%>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label4" runat="server" Text="H" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label6" runat="server" Text="G" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label7" runat="server" Text="H" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label8" runat="server" Text="G" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label5" runat="server" Text="H" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label9" runat="server" Text="G" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label10" runat="server" Text="H" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label11" runat="server" Text="G" />
                                </div>
                            </asp:TableCell>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label12" runat="server" Text="H" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label13" runat="server" Text="G" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label14" runat="server" Text="H" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label15" runat="server" Text="G" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label16" runat="server" Text="H" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label17" runat="server" Text="G" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label18" runat="server" Text="H" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label19" runat="server" Text="G" />
                                </div>
                            </asp:TableCell>--%>
                            
                           <asp:TableCell>
                                <asp:HiddenField ID="hid_syc" runat="server" />
                            </asp:TableCell></asp:TableRow></asp:Table><%
                    if (GrupList.Count>0)                                                       
                    for (int i=0;i<GrupList[j].Count ;i++)
                  {
                        syc++;
                        h1.Text = GrupList[j][i].HEP_H1.ToString();
                        h1.Attributes.Add("onchange", "javascript:Topla();");
                        h1.ID = "h1_" + syc.ToString();

                        g1.Text = GrupList[j][i].HEP_G1.ToString();
                        g1.Attributes.Add("onchange", "javascript:Topla();");
                        g1.ID = "g1_" + syc.ToString();

                        h2.Text = GrupList[j][i].HEP_H2.ToString();
                        h2.Attributes.Add("onchange", "javascript:Topla();");
                        h2.ID = "h2_" + syc.ToString();

                        g2.Text = GrupList[j][i].HEP_G2.ToString();
                        g2.Attributes.Add("onchange", "javascript:Topla();");
                        g2.ID = "g2_" + syc.ToString();

                        h3.Text = GrupList[j][i].HEP_H3.ToString();
                        h3.Attributes.Add("onchange", "javascript:Topla();");
                        h3.ID = "h3_" + syc.ToString();

                        g3.Text = GrupList[j][i].HEP_G3.ToString();
                        g3.Attributes.Add("onchange", "javascript:Topla();");
                        g3.ID = "g3_" + syc.ToString();

                        h4.Text = GrupList[j][i].HEP_H4.ToString();
                        h4.Attributes.Add("onchange", "javascript:Topla();");
                        h4.ID = "h4_" + syc.ToString();

                        g4.Text = GrupList[j][i].HEP_G4.ToString();
                        g4.Attributes.Add("onchange", "javascript:Topla();");
                        g4.ID = "g4_" + syc.ToString();

                        //h5.Text = GrupList[j][i].HEP_H5.ToString();
                        //h5.Attributes.Add("onchange", "javascript:Topla();");
                        //h5.ID = "h5_" + syc.ToString();

                        //g5.Text = GrupList[j][i].HEP_G5.ToString();
                        //g5.Attributes.Add("onchange", "javascript:Topla();");
                        //g5.ID = "g5_" + syc.ToString();

                        //h6.Text = GrupList[j][i].HEP_H6.ToString();
                        //h6.Attributes.Add("onchange", "javascript:Topla();");
                        //h6.ID = "h6_" + syc.ToString();

                        //g6.Text = GrupList[j][i].HEP_G6.ToString();
                        //g6.Attributes.Add("onchange", "javascript:Topla();");
                        //g6.ID = "g6_" + syc.ToString();

                        //h7.Text = GrupList[j][i].HEP_H7.ToString();
                        //h7.Attributes.Add("onchange", "javascript:Topla();");
                        //h7.ID = "h7_" + syc.ToString();

                        //g7.Text = GrupList[j][i].HEP_G7.ToString();
                        //g7.Attributes.Add("onchange", "javascript:Topla();");
                        //g7.ID = "g7_" + syc.ToString();

                        //h8.Text = GrupList[j][i].HEP_H8.ToString();
                        //h8.Attributes.Add("onchange", "javascript:Topla();");
                        //h8.ID = "h8_" + syc.ToString();

                        //g8.Text = GrupList[j][i].HEP_G8.ToString();
                        //g8.Attributes.Add("onchange", "javascript:Topla();");
                        //g8.ID = "g8_" + syc.ToString();

                        
                        num.ID = "num_" + syc.ToString();
                        num.Text = GrupList[j][i].KULLANICILAR.KUL_NO.ToString();
                        lad.ID = "lad_" + syc.ToString();
                        lad.Text = GrupList[j][i].KULLANICILAR.KUL_ISIM;
                        lsad.ID = "lsad_" + syc.ToString();
                        lsad.Text = GrupList[j][i].KULLANICILAR.KUL_SOYISIM;
                        //btn.NavigateUrl = "javascript:Temizle("+syc.ToString()+")";
                %><asp:Table ID="Table2" runat="server" >
                        
                        <asp:TableRow  >
                         <%--   <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="50" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:CheckBox ID="chk" runat="server"  />
                                </div>
                            </asp:TableCell>--%>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="70">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="num" runat="server" Text="000" Width="70" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="100">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="lad" runat="server" Text="ENDER" Width="100" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="100">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="lsad" runat="server" Text="MERT" Width="100"  />
                                </div>
                            </asp:TableCell><%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="342" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:TextBox ID="txt" runat="server" Width="310" />
                                </div>
                            </asp:TableCell>--%>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>--%>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="h1" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="g1" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="h2" runat="server" Width="18"  MaxLength="3" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="g2" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell>

                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>--%>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="h3" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="g3" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="h4" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>--%>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="g4" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell>
                           <%-- <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="h5" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="g5" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="h6" runat="server" Width="18" MaxLength="3"/>
                                </div>
                            </asp:TableCell>--%>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>--%>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="g6" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell  BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="h7" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="g7" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="h8" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="g8" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell>--%>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpgo" runat="server" Width="18" MaxLength="3" Font-Size="XX-Small" ReadOnly="true"/>
                                </div>
                            </asp:TableCell>--%>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tperort" runat="server" Width="18" MaxLength="3" Font-Size="XX-Small" ReadOnly="true"/>
                                </div>
                            </asp:TableCell>--%>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>--%>

                      <%--      <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tnot" runat="server" Width="18" MaxLength="3" ReadOnly="true" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpuan" runat="server" Width="18" MaxLength="3" Font-Size="XX-Small" ReadOnly="true" />
                                </div>
                            </asp:TableCell>--%>

                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>--%>
                            <%-- <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="70" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:HyperLink ID="btn" runat="server" Text="Temizle" NavigateUrl="javascript:alert('Hello')" />
                                </div>
                            </asp:TableCell>--%></asp:TableRow></asp:Table><%
                      
                  }
                %></div></div></div><%
        
            }
            //}
          %></telerik:RadCodeBlock>
    </asp:Panel>    
</asp:Content>
