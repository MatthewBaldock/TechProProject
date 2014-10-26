<%@ Page Title="Interactive Physics Simulator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="COMP4952Medium._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
  <link rel="stylesheet" href="Content/jquery-ui.css">
  <script src="Scripts/external/jquery/jquery.js"></script>
  <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
    <style>
  .draggable { width: 30px; height: 30px;  }
  #containment-wrapper { width: 530px; height:530px;  }
        #lineCanvas {border:1px solid ; }
  </style>
        <div id="containment-wrapper">
     
     <canvas id="lineCanvas" height="500" width="500"></canvas>
     <div id="draggable" ondrag="mydraw()"class="draggable ui-widget-content">
        <img src="images/crosshair.png" height="30" width="30" />
              </div>
       
              </div>
    <ul style="width:200px;" id="menu" class="ui-menu ui-widget ui-widget-content" role="menu" tabindex="0" aria-activedescendant="ui-id-13">
	<li class="ui-menu-item" id="ui-id-12" tabindex="-1" role="menuitem"><span class="ui-menu-icon ui-icon ui-icon-carat-1-e"></span>Faction 1
         <ul class="ui-menu ui-widget ui-widget-content ui-front" role="menu" aria-expanded="false" style="width:100px;display: none; top: -1px; left: 100px;" aria-hidden="true">
			<li class="ui-menu-item" id="Li4" tabindex="-1" role="menuitem">F2 Gun 1</li>
			<li class="ui-menu-item" id="Li5" tabindex="-1" role="menuitem">F2 Gun 2</li>
			<li class="ui-menu-item" id="Li6" tabindex="-1" role="menuitem">F2 Gun 3</li>
		</ul>
	</li>
	<li class="ui-menu-item" id="ui-id-13" tabindex="-1" role="menuitem"><span class="ui-menu-icon ui-icon ui-icon-carat-1-e"></span>Faction 2
      <ul class="ui-menu ui-widget ui-widget-content ui-front" role="menu" aria-expanded="false" style="width:100px;display: none; top: -1px; left: 100px;" aria-hidden="true">
			<li class="ui-menu-item" id="Li1" tabindex="-1" role="menuitem">F2 Gun 1</li>
			<li class="ui-menu-item" id="Li2" tabindex="-1" role="menuitem">F2 Gun 2</li>
			<li class="ui-menu-item" id="Li3" tabindex="-1" role="menuitem">F2 Gun 3</li>
		</ul>
	</li>
	<li aria-haspopup="true" class="ui-menu-item" id="ui-id-14" tabindex="-1" role="menuitem"><span class="ui-menu-icon ui-icon ui-icon-carat-1-e"></span>Faction 3
		<ul class="ui-menu ui-widget ui-widget-content ui-front" role="menu" aria-expanded="false" style="width:100px;display: none; top: -1px; left: 100px;" aria-hidden="true">
			<li class="ui-menu-item" id="ui-id-15" tabindex="-1" role="menuitem">F3 Gun 1</li>
			<li class="ui-menu-item" id="ui-id-16" tabindex="-1" role="menuitem">F3 Gun 2</li>
			<li class="ui-menu-item" id="ui-id-17" tabindex="-1" role="menuitem">F3 Gun 3</li>
		</ul>
	</li>
</ul>
      <script>
          var height;
          var c = document.getElementById("lineCanvas");
          var ctx = c.getContext("2d");
          $(function drawline() {
              $("#draggable").draggable({ containment: "#containment-wrapper", scroll: false });
          });
          function mydraw() {
              height = $("#draggable").position();
              ctx.clearRect(0, 0, c.width, c.height);
              ctx.beginPath();
              ctx.moveTo(0,c.height);
              ctx.lineTo((height.left-200), (height.top-40));
              ctx.stroke();

          }
          $("#menu").menu();
  </script>
    

</asp:Content>
