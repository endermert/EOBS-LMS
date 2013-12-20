<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GNL_Ayarlar.aspx.cs" Inherits="EOBS_001.GNL_Ayarlar" %>
<asp:Content ID="ContentGnlAyarlar" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <telerik:RadNotification ID="msg1" runat="server" Position="Center" AutoCloseDelay="3000" Width="350" EnableRoundedCorners="true"></telerik:RadNotification>
    <div class="main_container container_16">
    <div class="box grid_8">
		<h2 class="box_head">KULLANICI BiLGiLERi <span></span></h2>
		<div class="controls">
			<a href="#" class="grabber"></a>
			<a href="#" class="toggle"></a>
		</div>
        <div class="toggle_container">
            <div style="margin:10px;">
                <asp:Panel runat="server" ID="pOgrenci">
                <asp:Table runat="server">
                   <%-- <asp:TableRow>
                        <asp:TableCell><b></b></asp:TableCell>
                        <asp:TableCell><b></b></asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                    </asp:TableRow>--%>
                    <asp:TableRow>
                        <asp:TableCell><b>TC KİMLİK NO</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lTcKimlik"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>NUMARA</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lNO"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>SINIF</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lSinif"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>AD</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lAd"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>SOYAD</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lSoyad"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>VELİ ADI</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lVeli"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>GSM 1</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lGsm1"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>GSM 2</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lGsm2"></asp:Label></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
              </asp:Panel>
              <asp:Panel runat="server" ID="pOgretmen">
                  <asp:Table ID="Table2" runat="server">
                    <asp:TableRow>
                        <asp:TableCell><b></b></asp:TableCell>
                        <asp:TableCell><b></b></asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                    </asp:TableRow>
                      <asp:TableRow>
                        <asp:TableCell><b>BRANŞ</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lBrans" /></asp:TableCell>
                     </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>TC KİMLİK NO</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lTcKimliko" /></asp:TableCell>
                     </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell><b>AD</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lAdo" /></asp:TableCell>
                     </asp:TableRow>
                       <asp:TableRow>
                        <asp:TableCell><b>SOYAD</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lSoyado" /></asp:TableCell>
                     </asp:TableRow>
                       <asp:TableRow>
                        <asp:TableCell><b>GSM 1</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lGsmo1" /></asp:TableCell>
                     </asp:TableRow>
                       <asp:TableRow>
                        <asp:TableCell><b>GSM 2</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lGsmo2" /></asp:TableCell>
                     </asp:TableRow>
                      <asp:TableRow>
                        <asp:TableCell><b>REHBERLİK 1</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lReh1" /></asp:TableCell>
                     </asp:TableRow>
                       <asp:TableRow>
                        <asp:TableCell><b>REHBERLİK 2</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lReh2" /></asp:TableCell>
                     </asp:TableRow>
                       <asp:TableRow>
                        <asp:TableCell><b>REHBERLİK 3</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:Label runat="server" ID="lReh3" /></asp:TableCell>
                     </asp:TableRow>
                  </asp:Table>
              </asp:Panel>
            </div>
        </div>
    </div>
    
    <div class="box grid_8">
		<h2 class="box_head">SiFRE DEGiSTiR<span></span></h2>
		<div class="controls">
			<a href="#" class="grabber"></a>
			<a href="#" class="toggle"></a>
		</div>
        <div class="toggle_container">
            <div style="margin:10px;">
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell><b>MEVCUT ŞİFRE</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" TextMode="Password" ID="txtMevSifre"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>YENİ ŞİFRE</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" TextMode="Password" ID="txtYeniSifre1"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><b>(T) YENİ ŞİFRE</b></asp:TableCell>
                        <asp:TableCell><b>:</b></asp:TableCell>
                        <asp:TableCell><asp:TextBox runat="server" TextMode="Password" ID="txtYeniSifre2"></asp:TextBox></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        <asp:TableCell><asp:Button runat="server" CssClass="btn-success"  Text="DEĞİŞTİR" ID="btnDegistir" OnClick="btnDegistir_Click" /></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
