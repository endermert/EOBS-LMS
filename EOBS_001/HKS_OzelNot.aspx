<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="HKS_OzelNot.aspx.cs" Inherits="EOBS_001.HKS_OzelNot" %>
<asp:Content ID="ContentOzelNot" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head">OZEL NOTLAR<span></span></h2>
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
                                    <div style="position:absolute;z-index:-10;"><asp:TextBox ID="txt_baba" runat="server" Width="1" Height="1" /></div>
                                </div>
                            </asp:TableCell></asp:TableRow></asp:Table></div></div></div>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                
                function Topla() {
                    var say = 0;
                    var txt_baba = document.getElementById('MainContent_txt_baba');
                    txt_baba.value = '';
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
                    }

                }
                function Temizle(nesne) {
                    nesne = 'MainContent_txt_' + nesne;
                    document.getElementById(nesne).value = '';
                    Topla();
                }
                function HepsiniSec(kaynak)
                {
                    var say = 0;
                    var txt_syc = document.getElementById('MainContent_hid_syc');
                    if (txt_syc != null)
                    {
                        say = txt_syc.value;
                    }
                    var chk = document.getElementById('chk_0');
                    if (chk != null)
                    {
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
                function Aktar()
                {
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
                                        if (txt_i1 != null) ifade = txt_i1.value+' ';
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

        %>
        <div class="main_container container_16 clearfix full_size">
		<div class="box grid_16">
			<h2 class="box_head"><asp:Label ID="lbl" runat="server" /><span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <asp:Table runat="server" BackColor="LightGray" >
                        <asp:TableRow  >
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="15" >
                                <div style="margin:0px 10px 0px 10px; width:15px;">
                                    <input id="chk_0" type="checkbox" class="CheckBox" name="tumu" value="ON" title ="Tümünü Seç" onclick="HepsiniSec(this);">
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="70" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label runat="server" Text="NUMARA" Width="70" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="Label1" runat="server" Text="AD" Width="100" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="100" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label runat="server" Text="SOYAD" Width="100" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="342" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:Label runat="server" Text="İFADE" />
                                </div>
                            </asp:TableCell><asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="DarkBlue" BorderWidth="1" Width="70" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label runat="server" Text="TEMİZLE" />
                                </div>
                            </asp:TableCell><asp:TableCell>
                                <asp:HiddenField ID="hid_syc" runat="server" />
                            </asp:TableCell></asp:TableRow></asp:Table><%
                    for (int i=0;i<GrupList[j].Count ;i++)
                  {
                        syc++;
                        txt.Text = GrupList[j][i].OZN_NOT;
                        txt.Attributes.Add("onchange", "javascript:Topla();");
                        txt.ID = "txt_" + syc.ToString();
                        btn.ID = "btn_" + syc.ToString();
                        chk.ID = "chk_" + syc.ToString();
                        chk.Attributes.Add("onclick", "javascript:Topla();");
                        if (GrupList[j][i].OZN_AKTIF)
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
                %><asp:Table runat="server" >
                        
                        <asp:TableRow  >
                            <asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="15" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:CheckBox ID="chk" runat="server" Width="15" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="70">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="num" runat="server" Text="000" Width="70"  />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="100">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="lad" runat="server" Text="ENDER"  Width="100" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="100">
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:Label ID="lsad" runat="server" Text="MERT" Width="100" />
                                </div>
                            </asp:TableCell><asp:TableCell BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="342" >
                                <div style="margin:5px 10px 0px 10px;">
                                    <asp:TextBox ID="txt" runat="server" Width="310" />
                                </div>
                            </asp:TableCell><asp:TableCell HorizontalAlign="Center" BorderStyle="Solid" BorderColor="LightBlue" BorderWidth="1" Width="70" >
                                <div style="margin:0px 10px 0px 10px;">
                                    <asp:HyperLink ID="btn" runat="server" Text="Temizle" NavigateUrl="javascript:alert('Hello')" />
                                </div>
                            </asp:TableCell></asp:TableRow></asp:Table><%
                      
                  }
                %></div></div></div><%
        
            }
            //}
          %></telerik:RadCodeBlock></asp:Content>