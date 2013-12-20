<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HKS_OdevSnc.aspx.cs" Inherits="EOBS_001.HKS_OdevSnc" %>
<asp:Content ID="ContentOdevSnc" ContentPlaceHolderID="MainContent" runat="server">
        <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">ODEV DEGERLENDiRME<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
             <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
             <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <%--<telerik:AjaxSetting AjaxControlID="btn_kaydet">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="RadAjaxLoadingPanel1">
                            </telerik:AjaxUpdatedControl>
                        </UpdatedControls>
                    </telerik:AjaxSetting>--%>
                   
                    
                </AjaxSettings>
            </telerik:RadAjaxManager>
                <telerik:RadNotification ID="msg1" runat="server" Position="BottomRight" AutoCloseDelay="3000" Width="350" EnableRoundedCorners="true"></telerik:RadNotification>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
            <asp:Table ID="Table1" runat="server" >
                        <asp:TableRow  >
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="120" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:TextBox ID="txt_i1" runat="server" Text="Sevgili" Width="100" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="120">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:DropDownList ID="txt_i2" runat="server" Width="100">
                                        <asp:ListItem Text="Seçiniz" Value="0" Selected="True" />
                                        <asp:ListItem Text="Öğrenci Adı" Value="1" />
                                    </asp:DropDownList>
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="342" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:TextBox ID="txt_i3" runat="server" Width="310" />
                                </div>
                            </asp:TableCell><asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="70">
                                <div style="margin:-5px 10px 0px 10px;">
                                    <a href="javascript:Aktar()" >AKTAR</a>
                                    
                                </div>
                            </asp:TableCell><asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="70" >
                                <div style="margin:-5px 10px 0px 10px;">
                                    <telerik:RadButton ID="btn_kaydet" runat="server" Text="KAYDET" OnClick="btn_kaydet_Click" />
                                    <div style="position:absolute;z-index:-10;"><asp:TextBox ID="txt_baba" runat="server" Width="1" Height="1" /><asp:TextBox ID="txt_deg" runat="server" Width="1" Height="1" /></div>
                                </div>
                            </asp:TableCell></asp:TableRow></asp:Table></div></div></div>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">

                function Topla() {
                    var say = 0;
                    var txt_baba = document.getElementById('MainContent_txt_baba');
                    txt_baba.value = '';
                    var txt_deg = document.getElementById('MainContent_txt_deg');
                    txt_deg.value = '';
                    var txt_syc = document.getElementById('MainContent_hid_syc');
                    if (txt_syc != null) {
                        say = txt_syc.value;
                    }
                    for (var i = 1; i <= say; i++) {
                        nesne = 'MainContent_chk_' + i;
                        var chkx = document.getElementById(nesne);
                        if (chkx != null)
                            if (chkx.checked) {
                                var txt = document.getElementById('MainContent_txt_' + i);
                                if (txt != null) {
                                    txt_baba.value = txt_baba.value + txt.value + '|';
                                } else {
                                    txt_baba.value = txt_baba.value + '|';
                                }
                            } else {
                                txt_baba.value = txt_baba.value + '|';
                            }

                        var deger = '';
                        if (document.getElementById('MainContent_cek0_' + i).checked)
                            deger = '0';
                        if (document.getElementById('MainContent_cek1_' + i).checked)
                            deger = '1';
                        if (document.getElementById('MainContent_cek2_' + i).checked)
                            deger = '2';
                        if (document.getElementById('MainContent_cek3_' + i).checked)
                            deger = '3';
                        if (document.getElementById('MainContent_cek4_' + i).checked)
                            deger = '4';
                        txt_deg.value = txt_deg.value + deger + '|';

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
                function SecimH(toplam,grup,grup1) {
                    for (var i = 0; i < toplam; i++) {
                        document.getElementById('MainContent_cekh0_' + i).checked = false;
                        document.getElementById('MainContent_cekh1_' + i).checked = false;
                        document.getElementById('MainContent_cekh2_' + i).checked = false;
                        document.getElementById('MainContent_cekh3_' + i).checked = false;
                        document.getElementById('MainContent_cekh4_' + i).checked = false;
    
                    }
                    for (var i = 0; i < toplam; i++) {
                        document.getElementById('MainContent_' + grup + '_' + i).checked = true
                    }

                    var say = 0;
                    var txt_syc = document.getElementById('MainContent_hid_syc');
                    if (txt_syc != null) {
                        say = txt_syc.value;
                    }
                    
                    var nesne = '';
                    for (var i = 1; i <= say; i++) {
                        nesne = 'MainContent_'+grup1+'_' + i;
                        var chkx = document.getElementById(nesne);
                        if (chkx != null) {
                            Secim(chkx, i);
                        }
                    }
                    
                }
                function Secim(nesne, indexi) {
                    document.getElementById('MainContent_cek0_' + indexi).checked = false;
                    document.getElementById('MainContent_cek1_' + indexi).checked = false;
                    document.getElementById('MainContent_cek2_' + indexi).checked = false;
                    document.getElementById('MainContent_cek3_' + indexi).checked = false;
                    document.getElementById('MainContent_cek4_' + indexi).checked = false;
                    nesne.checked = true;
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
            for (int j=0;j<SUB_ADS.Length;j++)
            {
                lbl.Text = SUB_ADS[j];
                lbl.ID = "lbl" + j.ToString();
                cekh0.ID = "cekh0_" + j.ToString();
                cekh0.Attributes.Add("onclick", "javascript:SecimH(" + (SUB_ADS.Length).ToString() + ",'" + cekh0.ID.Substring(0, 5) + "','cek0')");
                cekh1.ID = "cekh1_" + j.ToString();
                cekh1.Attributes.Add("onclick", "javascript:SecimH(" + (SUB_ADS.Length).ToString() + ",'" + cekh1.ID.Substring(0, 5) + "','cek1')");
                cekh2.ID = "cekh2_" + j.ToString();
                cekh2.Attributes.Add("onclick", "javascript:SecimH(" + (SUB_ADS.Length).ToString() + ",'" + cekh2.ID.Substring(0, 5) + "','cek2')");
                cekh3.ID = "cekh3_" + j.ToString();
                cekh3.Attributes.Add("onclick", "javascript:SecimH(" + (SUB_ADS.Length).ToString() + ",'" + cekh3.ID.Substring(0, 5) + "','cek3')");
                cekh4.ID = "cekh4_" + j.ToString();
                cekh4.Attributes.Add("onclick", "javascript:SecimH(" + (SUB_ADS.Length).ToString() + ",'" + cekh4.ID.Substring(0, 5) + "','cek4')");
        %>
        <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head"><asp:Label ID="lbl" runat="server" /><span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:Table ID="Table2" runat="server" BackColor="LightGray" >
                        <asp:TableRow >
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="15" >
                                <div style="margin:0px 10px 0px 10px;width:15px;">
                                    <input id="chk_0" type="checkbox" class="CheckBox" name="tumu" value="ON" title ="Tümünü Seç" onclick="HepsiniSec(this);" >
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="50" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label runat="server" Text="NO" Width="50" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="Label2" runat="server" Text="AD" Width="100" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="Label3" runat="server" Text="SOYAD" Width="100" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="330" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label ID="Label4" runat="server" Text="İFADE" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="17" >
                                <asp:Label runat="server" Text="T" />
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="15" >
                                <asp:CheckBox ID="cekh0" runat="server" ToolTip="SONUCSUZ"  Text="S" />
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="15" >
                                <asp:CheckBox ID="cekh1" runat="server" ToolTip="YAPMADI"  Text="Y" />
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="15" >
                                <asp:CheckBox ID="cekh2" runat="server" ToolTip="GETİRMEDİ" Text="G"  />
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="15" >
                                <asp:CheckBox ID="cekh3" runat="server" ToolTip="EKSİK" Text="E"  />
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="15" >
                                <asp:CheckBox ID="cekh4" runat="server" ToolTip="TAM" Text="T"  />
                            </asp:TableCell>
                            <%--<asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="Label5" runat="server" Text="TEMİZLE" />
                                </div>
                            </asp:TableCell>--%>
                            <asp:TableCell Width="0">
                                <asp:HiddenField ID="hid_syc" runat="server" />
                            </asp:TableCell></asp:TableRow></asp:Table><%
                    for (int i=0;i<GrupList[j].Count ;i++)
                  {
                        syc++;
                       
                        
                        txt.Text = GrupList[j][i].ODE_NOT;
                        txt.Attributes.Add("onchange", "javascript:Topla();");
                        txt.ID = "txt_" + syc.ToString();
                        btn.ID = "btn_" + syc.ToString();
                        chk.ID = "chk_" + syc.ToString();
                        chk.Attributes.Add("onclick", "javascript:Topla();");
                        if (GrupList[j][i].ODE_AKTIF)
                            chk.Checked = true;
                        else
                            chk.Checked = false;
                        num.ID = "num_" + syc.ToString();
                        num.Text = GrupList[j][i].KULLANICILAR.KUL_NO.ToString();
                        lad.ID = "lad_" + syc.ToString();
                        lad.Text = GrupList[j][i].KULLANICILAR.KUL_ISIM;
                        lsad.ID = "lsad_" + syc.ToString();
                        lsad.Text = GrupList[j][i].KULLANICILAR.KUL_SOYISIM;
                        btn.NavigateUrl = "javascript:Temizle("+syc.ToString()+")";
                        
                        cek0_0.ID = "cek0_" + syc.ToString();
                        cek0_0.Attributes.Add("onclick", "javascript:Secim(this,"+syc.ToString()+")");
                        cek0_0.Checked = GrupList[j][i].ODE_DURUM1;
                        cek1_0.ID = "cek1_" + syc.ToString();
                        cek1_0.Attributes.Add("onclick", "javascript:Secim(this," + syc.ToString() + ")");
                        cek1_0.Checked = GrupList[j][i].ODE_DURUM2;
                        cek2_0.ID = "cek2_" + syc.ToString();
                        cek2_0.Attributes.Add("onclick", "javascript:Secim(this," + syc.ToString() + ")");
                        cek2_0.Checked = GrupList[j][i].ODE_DURUM3;
                        cek3_0.ID = "cek3_" + syc.ToString();
                        cek3_0.Attributes.Add("onclick", "javascript:Secim(this," + syc.ToString() + ")");
                        cek3_0.Checked = GrupList[j][i].ODE_DURUM4;
                        cek4_0.ID = "cek4_" + syc.ToString();
                        cek4_0.Attributes.Add("onclick", "javascript:Secim(this," + syc.ToString() + ")");
                        cek4_0.Checked = GrupList[j][i].ODE_DURUM5;
                        //rad0_0.GroupName = "grup_" + syc.ToString();
                        //rad0_0.Attributes.Add("name", "grup_" + syc.ToString());
                        //rad1_0.GroupName = "grup_" + syc.ToString();
                        //rad1_0.Attributes.Add("name", "grup_" + syc.ToString());
                        //rad2_0.GroupName = "grup_" + syc.ToString();
                        //rad2_0.Attributes.Add("name", "grup_" + syc.ToString());
                        //rad3_0.GroupName = "grup_" + syc.ToString();
                        //rad3_0.Attributes.Add("name", "grup_" + syc.ToString());
                        //rad4_0.GroupName = "grup_" + syc.ToString();
                        //rad4_0.Attributes.Add("name", "grup_" + syc.ToString());
                        
                        
                        
                %><asp:Table ID="Table3" runat="server" >
                        
                        <asp:TableRow  >
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="15" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:CheckBox ID="chk" runat="server"  Width="15" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="50">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="num" runat="server" Text="000" Width="50"  />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="100">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="lad" runat="server" Text="ENDER" Width="100" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="100">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="lsad" runat="server" Text="MERT" Width="100" />
                                </div>
                            </asp:TableCell>
                            <asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="330" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:TextBox ID="txt" runat="server" Width="290" />
                                </div>
                            </asp:TableCell>
                            
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="17" >
                                <asp:HyperLink ID="btn" runat="server" Text="X" NavigateUrl="javascript:alert('Hello')" />
                            </asp:TableCell>
                             <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="15" >
                                <%--<asp:RadioButton ID="rad0_0" runat="server" ToolTip="SONUCSUZ"  />--%>
                                 <asp:CheckBox ID="cek0_0" runat="server" ToolTip="SONUCSUZ"    />
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="15" >
                                <%--<asp:RadioButton ID="rad1_0" runat="server" ToolTip="YAPMADI"  />--%>
                                <asp:CheckBox ID="cek1_0" runat="server" ToolTip="YAPMADI"/>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="15" >
                                <%--<asp:RadioButton ID="rad2_0" runat="server" ToolTip="GETİRMEDİ" />--%>
                                <asp:CheckBox ID="cek2_0" runat="server" ToolTip="GETİRMEDİ"/>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="15" >
                                <%--<asp:RadioButton ID="rad3_0" runat="server" ToolTip="EKSİK"  />--%>
                                <asp:CheckBox ID="cek3_0" runat="server" ToolTip="EKSİK"/>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="15" >
                                <%--<asp:RadioButton ID="rad4_0" runat="server" ToolTip="TAM"/>--%>
                                <asp:CheckBox ID="cek4_0" runat="server" ToolTip="TAM"/>
                            </asp:TableCell>
                        </asp:TableRow></asp:Table><%
                      
                  }
                %></div></div></div><%
        
            }
            //}
          %></telerik:RadCodeBlock>

</asp:Content>
