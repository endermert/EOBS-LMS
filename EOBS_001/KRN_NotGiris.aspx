<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KRN_NotGiris.aspx.cs" Inherits="EOBS_001.KRN_NotGiris" %>
<asp:Content ID="ContentNotGiris" ContentPlaceHolderID="MainContent" runat="server">
     <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">DERS NOTU GiRiSi <span></span></h2>
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
                        <telerik:AjaxUpdatedControl ControlID="RC_Ders" LoadingPanelID="RadAjaxLoadingPanel1">
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
                                <asp:Label runat="server" ID="lbl_ders" Text="DERS :"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadComboBox ID="RC_Ders" Runat="server" Skin="WebBlue" DataSourceID="SDS_Dersler" DataTextField="DRS_AD" DataValueField="DRS_ID" EmptyMessage="Seçiniz.." >
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
                <asp:SqlDataSource ID="SDS_Dersler" runat="server" ConnectionString="<%$ ConnectionStrings:EOBS_001ConnectionString %>" SelectCommand="SELECT DERSLER.DRS_ID, DERSLER.DRS_AD FROM KARNEDERS INNER JOIN DERSLER ON KARNEDERS.DRS_ID = DERSLER.DRS_ID WHERE (KARNEDERS.OKL_ID = @OKL_ID) AND (KARNEDERS.SNF_ID = @SNF_ID)">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Int32" Name="OKL_ID" SessionField="AktifOkulId" />
                        <asp:ControlParameter ControlID="RC_Sinif" DbType="Int32" Name="SNF_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                 
            </div>
		</div>
	</div>
    <asp:Panel ID="Panel1" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">

                //function Topla1() {
                //    var say = 0;
                //    var txt_baba = document.getElementById('MainContent_txt_baba');
                //    txt_baba.value = '';
                //    var txt_syc = document.getElementById('MainContent_hid_syc');
                //    if (txt_syc != null) {
                //        say = txt_syc.value;
                //    }
                //    for (var i = 1; i <= say; i++) {
                //        nesne = 'MainContent_chk_' + i;
                //        var chkx = document.getElementById(nesne);
                //        if (chkx != null)
                //            if (chkx.checked) {
                //                var txt = document.getElementById('MainContent_txt_' + i);
                //                if (txt != null) {
                //                    txt_baba.value = txt_baba.value + txt.value + '|';
                //                } else {
                //                    txt_baba.value = txt_baba.value + '|';
                //                }
                //            } else {
                //                txt_baba.value = txt_baba.value + '|';
                //            }
                //    }

                //}
                //function Toplax(ind) {
                //    var say = 0;
                //    var txt_baba = document.getElementById('MainContent_txt_baba');
                //    //txt_baba.value = '';
                //    //var txt_syc = document.getElementById('MainContent_hid_syc');
                //    //if (txt_syc != null) {
                //    //    say = txt_syc.value;
                //    //}
                //    //for (var i = 1; i <= 1; i++) {
                //        var str1 = '';
                //        var ts1 = document.getElementById('MainContent_ts1_' + ind);
                //        var ts2 = document.getElementById('MainContent_ts2_' + ind);
                //        var ts3 = document.getElementById('MainContent_ts3_' + ind);
                //        var ts4 = document.getElementById('MainContent_ts4_' + ind);

                //        try
                //        {
                //            str1 = ts1.value + '!' + ts2.value + '!' + ts3.value + '!' + ts4.value;
                //        }
                //        catch (e){
                //            str1 = '!!!';
                //        }
                //        txt_baba.value = txt_baba.value + str1 + '|';
                //    //}

                //}
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
                        var ts1 = document.getElementById('MainContent_ts1_' + i);
                        var ts2 = document.getElementById('MainContent_ts2_' + i);
                        var ts3 = document.getElementById('MainContent_ts3_' + i);
                        var ts4 = document.getElementById('MainContent_ts4_' + i);
                        var tpro1 = document.getElementById('MainContent_tpro1_' + i);
                        var tpro2 = document.getElementById('MainContent_tpro2_' + i);
                        var tprort = document.getElementById('MainContent_tprort_' + i);
                        var tpek1 = document.getElementById('MainContent_tpek1_' + i);
                        var tpek2 = document.getElementById('MainContent_tpek2_' + i);
                        var tpek3 = document.getElementById('MainContent_tpek3_' + i);
                        var tpeko = document.getElementById('MainContent_tpeko_' + i);
                        var tpg1 = document.getElementById('MainContent_tpg1_' + i);
                        var tpg2 = document.getElementById('MainContent_tpg2_' + i);
                        var tpg3 = document.getElementById('MainContent_tpg3_' + i);
                        var tpg4 = document.getElementById('MainContent_tpg4_' + i);
                        var tpg5 = document.getElementById('MainContent_tpg5_' + i);
                        var tpgo = document.getElementById('MainContent_tpgo_' + i);
                        var tperort = document.getElementById('MainContent_tperort_' + i);
                        var tnot = document.getElementById('MainContent_tnot_' + i);
                        var tpuan = document.getElementById('MainContent_tpuan_' + i);

                        try {
                            if (tpro1.value.trim() != '' && tpro2.value.trim() != '')
                                tprort.value = (Number(tpro1.value) + Number(tpro2.value)) / 2;
                            else {
                                tprort.value = '';
                                if (tpro1.value.trim() != '') {
                                    tprort.value = tpro1.value;
                                }
                                if (tpro2.value.trim() != '') {
                                    tprort.value = tpro2.value;
                                }
                            }

                            var peko = 0;
                            var peki = 0;
                            if (tpek1.value.trim() != '') {
                                peko = peko + Number(tpek1.value);
                                peki++;
                            }
                            if (tpek2.value.trim() != '' ) {
                                peko = peko + Number(tpek2.value);
                                peki++;
                            }
                            if (tpek3.value.trim() != '') {
                                peko = peko + Number(tpek3.value);
                                peki++;
                            }
                            if (peki != 0)
                                tpeko.value = peko / peki;
                            else
                                tpeko.value = '';

                            var peko = 0;
                            var peki = 0;
                            if (tpg1.value.trim() != '') {
                                peko = peko + Number(tpg1.value);
                                peki++;
                            }
                            if (tpg2.value.trim() != '') {
                                peko = peko + Number(tpg2.value);
                                peki++;
                            }
                            if (tpg3.value.trim() != '') {
                                peko = peko + Number(tpg3.value);
                                peki++;
                            }
                            if (tpg4.value.trim() != '') {
                                peko = peko + Number(tpg4.value);
                                peki++;
                            }
                            if (tpg5.value.trim() != '') {
                                peko = peko + Number(tpg5.value);
                                peki++;
                            }
                            if (peki != 0)
                                tpgo.value = peko / peki;
                            else
                                tpgo.value = '';

                            if (tpeko.value.trim() != '' && tpgo.value.trim() != '')
                                tperort.value = (Number(tpeko.value) + Number(tpgo.value)) / 2;
                            else {
                                tperort.value = '';
                                if (tpeko.value.trim() != '') {
                                    tperort.value = tpeko.value;
                                }
                                if (tpgo.value.trim() != '') {
                                    tperort.value = tpgo.value;
                                }
                            }

                            var peko = 0;
                            var peki = 0;

                            if (ts1.value.trim() != '') {
                                peko = peko + Number(ts1.value);
                                peki++;
                            }
                            if (ts2.value.trim() != '') {
                                peko = peko + Number(ts2.value);
                                peki++;
                            }
                            if (ts3.value.trim() != '') {
                                peko = peko + Number(ts3.value);
                                peki++;
                            }
                            if (ts4.value.trim() != '') {
                                peko = peko + Number(ts4.value);
                                peki++;
                            }
                            if (tprort.value.trim() != '') {
                                peko = peko + Number(tprort.value);
                                peki++;
                            }

                            if (tperort.value.trim() != '') {
                                peko = peko + Number(tperort.value);
                                peki++;
                            }

                            if (peki != 0)
                                tpuan.value = peko / peki;
                            else
                                tpuan.value = '';
                            
                            if (tpuan.value.trim() != '') {
                                var pu = Number(tpuan.value);
                                if (pu >= 0 && pu < 45)
                                    tnot.value = '1';
                                if (pu >= 45 && pu < 55)
                                    tnot.value = '2';
                                if (pu >= 55 && pu < 70)
                                    tnot.value = '3';
                                if (pu >= 70 && pu < 85)
                                    tnot.value = '4';
                                if (pu >= 85 && pu <= 100)
                                    tnot.value = '5';
                            }
                            else {
                                tnot.value = '';
                            }

                            str1 = ts1.value + '!' + ts2.value + '!' + ts3.value + '!' + ts4.value + '!' + tpro1.value + '!' + tpro2.value + '!' + tprort.value + '!' + tpek1.value + '!' + tpek2.value + '!' + tpek3.value + '!' + tpeko.value + '!' + tpg1.value + '!' + tpg2.value + '!' + tpg3.value + '!' + tpg4.value + '!' + tpg5.value + '!' + tpgo.value + '!' + tperort.value + '!' + tnot.value + '!' + tpuan.value;
                        }
                        catch (e) {
                            str1 = '!!!!!!!!!!!!!!!';
                        }
                        txt_baba.value = txt_baba.value + str1 + '|';
                    }

                }
                function Temizle(nesne) {
                    nesne = 'MainContent_txt_' + nesne;
                    document.getElementById(nesne).value = '';
                    Topla();
                }
                function HepsiniSec(kaynak) {
                    var say = 0;
                    var txt_syc = document.getElementById('MainContent_hid_syc');
                    if (txt_syc != null) {
                        say = txt_syc.value;
                    }
                    var chk = document.getElementById('chk_0');
                    if (chk != null) {
                        var nesne = '';
                        for (var i = 1; i <= say; i++) {
                            nesne = 'MainContent_chk_' + i;
                            var chkx = document.getElementById(nesne);
                            if (chkx != null)
                                chkx.checked = kaynak.checked;

                        }
                    }
                    Topla();
                }
                function Aktar() {
                    var ifade = ' ';
                    var txt_i1 = document.getElementById('MainContent_txt_i1');
                    var txt_i2 = document.getElementById('MainContent_txt_i2');
                    var txt_i3 = document.getElementById('MainContent_txt_i3');
                    if (ifade != null) {
                        var say = 0;
                        var txt_syc = document.getElementById('MainContent_hid_syc');
                        if (txt_syc != null) {
                            say = txt_syc.value;

                            for (var i = 1; i <= say; i++) {
                                var chk = document.getElementById('MainContent_chk_' + i);
                                if (chk != null) {
                                    if (chk.checked) {
                                        if (txt_i1 != null) ifade = txt_i1.value + ' ';
                                        if (txt_i2 != null) {
                                            if (txt_i2.value == '1') {
                                                var lad = document.getElementById('MainContent_lad_' + i);
                                                if (lad != null)
                                                    ifade = ifade + lad.innerHTML + ', ';
                                            }
                                        }
                                        if (txt_i3 != null) ifade = ifade + txt_i3.value;

                                        var txt = document.getElementById('MainContent_txt_' + i);
                                        if (txt != null) {
                                            txt.value = ifade;
                                        }

                                    }
                                }
                            }
                        }
                    }
                    Topla();
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
                            </asp:TableHeaderCell><asp:TableHeaderCell ColumnSpan="4" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label24" runat="server" Text="SINAVLAR" />
                                </div>
                            </asp:TableHeaderCell><asp:TableHeaderCell ColumnSpan="3" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label25" runat="server" Text="PROJELER" />
                                </div>
                            </asp:TableHeaderCell><asp:TableHeaderCell ColumnSpan="11" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label26" runat="server" Text="PERFORMANS" />
                                </div>
                            </asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="3" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1">
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label28" runat="server" Text="NOT" />
                                </div>
                            </asp:TableHeaderCell>

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
                                    <asp:Label ID="Label4" runat="server" Text="1." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label6" runat="server" Text="2." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label7" runat="server" Text="3." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label8" runat="server" Text="4." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label5" runat="server" Text="1." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label9" runat="server" Text="2." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label10" runat="server" Text="Or" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label11" runat="server" Text="1." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label12" runat="server" Text="2." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label13" runat="server" Text="3." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label14" runat="server" Text="Or" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label15" runat="server" Text="1." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label16" runat="server" Text="2." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label17" runat="server" Text="3." />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label18" runat="server" Text="4." />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label19" runat="server" Text="5." />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label20" runat="server" Text="Or" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label1" runat="server" Text="PO" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label29" runat="server" Text="N" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="31" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label30" runat="server" Text="P" />
                                </div>
                            </asp:TableCell>
                            <%--<asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="342" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label4" runat="server" Text="İFADE" />
                                </div>
                            </asp:TableCell>--%><%--  <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="70" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="Label5" runat="server" Text="TEMİZLE" />
                                </div>
                            </asp:TableCell>--%><asp:TableCell>
                                <asp:HiddenField ID="hid_syc" runat="server" />
                            </asp:TableCell></asp:TableRow></asp:Table><%
                    if (GrupList.Count>0)                                                       
                    for (int i=0;i<GrupList[j].Count ;i++)
                  {
                        syc++;
                        ts1.Text = GrupList[j][i].KDN_S1.ToString();
                        ts1.Attributes.Add("onchange", "javascript:Topla();");
                        ts1.ID = "ts1_" + syc.ToString();

                        ts2.Text = GrupList[j][i].KDN_S2.ToString();
                        ts2.Attributes.Add("onchange", "javascript:Topla();");
                        ts2.ID = "ts2_" + syc.ToString();

                        ts3.Text = GrupList[j][i].KDN_S3.ToString();
                        ts3.Attributes.Add("onchange", "javascript:Topla();");
                        ts3.ID = "ts3_" + syc.ToString();

                        ts4.Text = GrupList[j][i].KDN_S4.ToString();
                        ts4.Attributes.Add("onchange", "javascript:Topla();");
                        ts4.ID = "ts4_" + syc.ToString();

                        tpro1.Text = GrupList[j][i].KDN_PRO1.ToString();
                        tpro1.Attributes.Add("onchange", "javascript:Topla();");
                        tpro1.ID = "tpro1_" + syc.ToString();

                        tpro2.Text = GrupList[j][i].KDN_PRO2.ToString();
                        tpro2.Attributes.Add("onchange", "javascript:Topla();");
                        tpro2.ID = "tpro2_" + syc.ToString();

                        tprort.Text = GrupList[j][i].KDN_PROORT.ToString();
                        tprort.Attributes.Add("onchange", "javascript:Topla();");
                        tprort.ID = "tprort_" + syc.ToString();

                        tpek1.Text = GrupList[j][i].KDN_PEK1.ToString();
                        tpek1.Attributes.Add("onchange", "javascript:Topla();");
                        tpek1.ID = "tpek1_" + syc.ToString();

                        tpek2.Text = GrupList[j][i].KDN_PEK2.ToString();
                        tpek2.Attributes.Add("onchange", "javascript:Topla();");
                        tpek2.ID = "tpek2_" + syc.ToString();

                        tpek3.Text = GrupList[j][i].KDN_PEK3.ToString();
                        tpek3.Attributes.Add("onchange", "javascript:Topla();");
                        tpek3.ID = "tpek3_" + syc.ToString();

                        tpeko.Text = GrupList[j][i].KDN_PEKORT.ToString();
                        tpeko.Attributes.Add("onchange", "javascript:Topla();");
                        tpeko.ID = "tpeko_" + syc.ToString();

                        tpg1.Text = GrupList[j][i].KDN_PG1.ToString();
                        tpg1.Attributes.Add("onchange", "javascript:Topla();");
                        tpg1.ID = "tpg1_" + syc.ToString();

                        tpg2.Text = GrupList[j][i].KDN_PG2.ToString();
                        tpg2.Attributes.Add("onchange", "javascript:Topla();");
                        tpg2.ID = "tpg2_" + syc.ToString();

                        tpg3.Text = GrupList[j][i].KDN_PG3.ToString();
                        tpg3.Attributes.Add("onchange", "javascript:Topla();");
                        tpg3.ID = "tpg3_" + syc.ToString();

                        tpg4.Text = GrupList[j][i].KDN_PG4.ToString();
                        tpg4.Attributes.Add("onchange", "javascript:Topla();");
                        tpg4.ID = "tpg4_" + syc.ToString();

                        tpg5.Text = GrupList[j][i].KDN_PG5.ToString();
                        tpg5.Attributes.Add("onchange", "javascript:Topla();");
                        tpg5.ID = "tpg5_" + syc.ToString();

                        tpgo.Text = GrupList[j][i].KDN_PGORT.ToString();
                        tpgo.Attributes.Add("onchange", "javascript:Topla();");
                        tpgo.ID = "tpgo_" + syc.ToString();

                        tperort.Text = GrupList[j][i].KDN_PERORT.ToString();
                        tperort.Attributes.Add("onchange", "javascript:Topla();");
                        tperort.ID = "tperort_" + syc.ToString();

                        tnot.Text = GrupList[j][i].KDN_NOT.ToString();
                        tnot.Attributes.Add("onchange", "javascript:Topla();");
                        tnot.ID = "tnot_" + syc.ToString();

                        tpuan.Text = GrupList[j][i].KDN_PUAN.ToString();
                        tpuan.Attributes.Add("onchange", "javascript:Topla();");
                        tpuan.ID = "tpuan_" + syc.ToString();
                        
                        
                        
                        //btn.ID = "btn_" + syc.ToString();
                        //chk.ID = "chk_" + syc.ToString();
                        //chk.Attributes.Add("onclick", "javascript:Topla();");
                        //if (GrupList[j][i].OZN_AKTIF)
                        //    chk.Checked = true;
                        //else
                        //    chk.Checked = false;
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
                            </asp:TableCell>--%><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="ts1" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="ts2" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="ts3" runat="server" Width="18"  MaxLength="3" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="ts4" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell>

                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpro1" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpro2" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tprort" runat="server" Width="18" Font-Size="XX-Small" ReadOnly="true" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpek1" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpek2" runat="server" Width="18" MaxLength="3" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpek3" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpeko" runat="server" Width="18" Font-Size="XX-Small" ReadOnly="true"/>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpg1" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell  BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpg2" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpg3" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpg4" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpg5" runat="server" Width="18"  MaxLength="3"/>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpgo" runat="server" Width="18" MaxLength="3" Font-Size="XX-Small" ReadOnly="true"/>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tperort" runat="server" Width="18" MaxLength="3" Font-Size="XX-Small" ReadOnly="true"/>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>

                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tnot" runat="server" Width="18" MaxLength="3" ReadOnly="true" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="20" >
                                <div style="margin:5px 1px 0px 1px;">
                                    <asp:TextBox ID="tpuan" runat="server" Width="18" MaxLength="3" Font-Size="XX-Small" ReadOnly="true" />
                                </div>
                            </asp:TableCell>

                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="1"  BackColor="LightBlue"></asp:TableCell>
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