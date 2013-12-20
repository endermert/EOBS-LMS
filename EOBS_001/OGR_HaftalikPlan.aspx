<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OGR_HaftalikPlan.aspx.cs" Inherits="EOBS_001.OGR_HaftalikPlan" %>
<asp:Content ID="ContentOgrPlan" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <telerik:RadCodeBlock ID="Block1" runat="server">

      <%--<div class="main_container container_16 clearfix full_size">--%>
      <div id="main_container" class="main_container container_16 clearfix">
		<div class="box grid_8">
			<h2 class="box_head">PAZARTESi<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
                <div style="margin:10px;"><%=Plan.HPL_PTESI %></div>
            </div>
		</div>

        <div class="box grid_8">
			<h2 class="box_head">MONDAY<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               
               <div style="margin:10px;"><%=Plan.HPL_IPTESI %></div>
            </div>
		</div>
	

    
		<div class="box grid_8">
			<h2 class="box_head">SALI<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               <div style="margin:10px;"><%=Plan.HPL_SALI %></div>
            </div>
		</div>
	    
          <div class="box grid_8">
			<h2 class="box_head">TUESDAY<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               <div style="margin:10px;"><%=Plan.HPL_ISALI %></div>
            </div>
		</div>

    
		<div class="box grid_8">
			<h2 class="box_head">CARSAMBA<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               <div style="margin:10px;"><%=Plan.HPL_CARS %></div>
            </div>
		</div>

        <div class="box grid_8">
			<h2 class="box_head">WEDNESDAY<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               <div style="margin:10px;"><%=Plan.HPL_ICARS %></div>
            </div>
		</div>

        <div class="box grid_8">
			<h2 class="box_head">PERSEMBE<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               <div style="margin:10px;"><%=Plan.HPL_PERS %></div>
            </div>
		</div>

        <div class="box grid_8">
			<h2 class="box_head">THURSDAY<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               <div style="margin:10px;"><%=Plan.HPL_IPERS %></div>
            </div>
		</div>

          <div class="box grid_8">
			<h2 class="box_head">CUMA<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               <div style="margin:10px;"><%=Plan.HPL_CUMA %></div>
            </div>
		</div>
        <div class="box grid_8">
			<h2 class="box_head">FRIDAY<span></span></h2>
			<div class="controls">
				<a href="#" class="grabber"></a>
				<a href="#" class="toggle"></a>
			</div>
			<div class="toggle_container">
               <div style="margin:10px;"><%=Plan.HPL_ICUMA %></div>
            </div>
		</div>
	</div>

    </telerik:RadCodeBlock>
</asp:Content>
