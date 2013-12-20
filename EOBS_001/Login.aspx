<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EOBS_001.Login" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html public "✰">
<html lang="en-us" class="no-js"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">

		<title>E-Karnem - Eğitim Öğretim Bilgi Sistemi </title>

  		<meta name="description" content="">
  		<meta name="author" content="Ender MERT">

	<!-- iPhone, iPad and Android specific settings -->

		<meta name="viewport" content="width=device-width; initial-scale=1; maximum-scale=1;">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

		<link href="images/interface/iOS_icon.png" rel="apple-touch-icon">

	<!-- Styles -->

		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,700">

		<link rel="stylesheet" href="styles/adminica/main.css">
		<link rel="stylesheet" href="styles/adminica/grid.css">
		<link rel="stylesheet" href="styles/adminica/mobile.css">

		<link rel="stylesheet" href="styles/plugins/bootstrap/bootstrap.css">



		<link rel="stylesheet" href="styles/themes/layout_fixed.css" >
		<link rel="stylesheet" href="styles/themes/skin_dark.css" >
		<link rel="stylesheet" href="styles/themes/theme_blue.css" >

		<link rel="stylesheet" href="styles/themes/switcher.css"> <!-- Styles for the styleswitcher bar  -->
		<link rel="stylesheet" href="styles/adminica/colours.css"> <!-- this file overrides the theme's default colour scheme, allowing more colour combinations (see layout example page) -->


		<script src="scripts/jquery/jquery.js"></script>
		<script src="scripts/prefixfree/prefixfree.js"></script>
		<script src="scripts/bootstrap/bootstrap.js"></script>

		<script src="scripts/adminica/adminica_ui.js"></script>
		<script src="scripts/adminica/adminica_mobile.js"></script>
		<script src="scripts/adminica/adminica_load.js"></script>

		</head>
	<body>	<div id="pjax">
		<div style="margin-left:auto; margin-right:auto; width:302px;">
			<div class="isolate" style="width:302px" >
				<div class="center narrow" style="margin-top:100px;width:300px;">
					<div class="main_container full_size container_16 clearfix">
						<div class="box">
							<div class="block">

								<form id="frmGiris" runat="server" class="form-horizontal" style="margin: 0px 0 0; padding-top:20px;">
					                <fieldset>
					                  <div class="control-group">
                                        <div style="margin-left:25px;">
                                            <asp:Table ID="Table1" runat="server">
                                                <asp:TableRow Width="150">
                                                    <asp:TableCell ColumnSpan="3" HorizontalAlign="Center">
                                                        <B>EĞİTİM ÖĞRETİM BİLGİ SİSTEMİ | E-KARNEM</B>
                                                        <BR /><BR />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow Width="150">
                                                    <asp:TableCell><b>KULLANICI ADI</b></asp:TableCell>
                                                    <asp:TableCell><b>:</b></asp:TableCell>
                                                    <asp:TableCell><asp:TextBox ID="txtKulad" Runat="server" Width="160"></asp:TextBox></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><b>ŞİFRE</b></asp:TableCell>
                                                    <asp:TableCell><b>:</b></asp:TableCell>
                                                    <asp:TableCell><asp:TextBox ID="txtSifre" Runat="server" Width="160" TextMode="Password" /></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell><b>DEMO ADMİN</b></asp:TableCell>
                                                    <asp:TableCell><b>:</b></asp:TableCell>
                                                    <asp:TableCell>ender - 123</asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow Height="10">
                                                    <asp:TableCell></asp:TableCell>
                                                    <asp:TableCell></asp:TableCell>
                                                    <asp:TableCell></asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell></asp:TableCell>
                                                    <asp:TableCell></asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Button runat="server" CssClass="btn-inverse" ID="btnUnuttum" Text="ŞİFRE AL!" OnClick="btnUnuttum_Click" />
                                                        <div style="float:right;">
                                                            <asp:Button runat="server"  CssClass="btn-success" ID="btnLogin" Text="GİRİŞ" OnClick="btnLogin_Click" />
                                                        </div>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            </div>
					                    <%--<b><label class="control-label" for="txtKulad">KULLANICI ADI :</label></b>--%>
					                   <%-- <div class="controls">
                                            <asp:TextBox ID="txtKulad" Runat="server"></asp:TextBox>
					                    </div>--%>
					                  </div>
					                  <%--<div class="control-group">
					                    <b><label class="control-label" for="txtSifre">ŞİFRE :</label></b>
					                    <div class="controls">
                                            
					                    </div>
					                  </div>--%>

					                  <%--<div class="control-group">
					          	        <div class="controls">
                                              <div style="float:right;margin-right:20px;">--%>
                                                <%--<asp:Button runat="server" CssClass="btn-success" ID="btnLogin" Text="GİRİŞ" OnClick="btnLogin_Click" />--%>
                                              <%--</div>
                                              <div style="float:left;">--%>
                                                <%--<asp:Button runat="server" CssClass="btn-inverse" ID="btnUnuttum" Text="ŞİFREMİ UNUTTUM !" OnClick="btnUnuttum_Click" />--%>
                                                  
                                              <%--</div>
					          	        </div>
					                  </div>--%>
					                </fieldset>
                                    
                                    
				                    <br />
                                    
                                   
					                
				                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div id="loading_overlay">
			<div class="loading_message round_bottom">
				<img src="images/interface/loading.gif" alt="loading" />
			</div>
		</div>
</div>
        </div>

	</body>
</html>
