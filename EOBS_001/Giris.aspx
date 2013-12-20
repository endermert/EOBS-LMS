<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="EOBS_001.Giris" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html public "✰">
<!--[if lt IE 7]> <html lang="en-us" class="no-js ie6"> <![endif]-->
<!--[if IE 7]>    <html lang="en-us" class="no-js ie7"> <![endif]-->
<!--[if IE 8]>    <html lang="en-us" class="no-js ie8"> <![endif]-->
<!--[if IE 9]>    <html lang="en-us" class="no-js ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en-us" class="no-js"> <!--<![endif]-->
	<head>
		<meta charset="utf-8">

		<title>Eğitim Öğretim Bilgi Sistemi | Işık Eğitim Kurumları</title>

  		<meta name="description" content="http://themeforest.net/item/adminica-the-professional-admin-template/160638">
  		<meta name="author" content="Oisin Lavery - Tricycle Labs">

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


		<!-- Style Switcher

		The following stylesheet links are used by the styleswitcher to allow for dynamically changing the Adminica layout, nav, skin, theme and background.
		Styleswitcher documentation: http://style-switcher.webfactoryltd.com/documentation/

		layout_switcher.php	: layout - fluid by default.								(eg. styles/themes/layout_switcher.php?default=layout_fixed.css)
		nav_switcher.php	: header and sidebar nav  positioning - sidebar by default.	(eg. styles/themes/nav_switcher.php?default=header_top.css)
		skin_switcher.php 	: Adminica skin - dark by default.							(eg. styles/themes/skin_switcher.php?default=theme_light.css)
		theme_switcher.php 	: colour theme - black/grey by default.						(eg. styles/themes/theme_switcher.php?default=theme_red.css)
		bg_switcher.php 	: background image - dark boxes by default.					(eg. styles/themes/bg_switcher.php?default=bg_honeycomb.css)	-->

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
		<div id="wrapper">
			<div class="isolate">
				<div class="center narrow" style="margin-top:100px;">
					<div class="main_container full_size container_16 clearfix">
						<div class="box">
							<div class="block">

								<form id="frmGiris" runat="server" class="form-horizontal" style="margin: 0px 0 0; padding-top:20px;">
                                    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                                        <Scripts>
                                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                                            </asp:ScriptReference>
                                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                                            </asp:ScriptReference>
                                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                                            </asp:ScriptReference>
                                        </Scripts>
                                    </telerik:RadScriptManager>
					                <fieldset>
					                  <div class="control-group">
					                    <label class="control-label" for="txtKulad">Kullanıcı Adı :</label>
					                    <div class="controls">
					                        <telerik:RadTextBox ID="txtKulad" Runat="server"></telerik:RadTextBox>
					                    </div>
					                  </div>
					                  <div class="control-group">
					                    <label class="control-label" for="txtSifre">Şifre :</label>
					                    <div class="controls">
                                            <telerik:RadTextBox ID="txtSifre" Runat="server" TextMode="Password"></telerik:RadTextBox>
					                    </div>
					                  </div>

					                  <div class="control-group">
					          	        <div class="controls">
                                            <telerik:RadButton ID="btnGiris" runat="server" Text="Giris" OnClick="btnGiris_Click"></telerik:RadButton>
					          	        </div>
					                  </div>
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
