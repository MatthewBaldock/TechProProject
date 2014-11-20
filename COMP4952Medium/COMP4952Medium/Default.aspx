﻿<%@ Page Title="Interactive Physics Simulator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="COMP4952Medium._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <link rel="stylesheet" href="Content/jquery-ui.css">
    <script src="Scripts/external/jquery/jquery.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="widget/lib/jquery.ui.rcarousel.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link type="text/css" rel="stylesheet" href="widget/css/rcarousel.css" />
    <style>
       .draggable { width: 30px; height: 30px;  }
       #containment-wrapper { width: 530px; height:530px;  }
       #lineCanvas {border:1px solid ; }

    </style>
    <style type="text/css">
        .imgWrap {
          position: relative;
          height: 200px;
          width: 257px;
        }

        .imgDescription {
          position: absolute;
          top: 0;
          bottom: 0;
          left: 0;
          right: 0;
          background: rgba(29, 106, 154, 0.72);
          color: #fff;


          visibility: hidden;
          opacity: 0;

          -webkit-transition: visibility opacity 0.2s;
          
        }


        .imgWrap:hover .imgDescription {
          visibility: visible;
          opacity: 1;
        }
    </style>                   
    <p>
        <asp:LoginName runat="server" FormatString="{0}"/>
    </p>         
    <div class="maincontainer">
        <div id="objectList">
            <div class="bs-example bs-example-tabs">
                <ul id="myTab" class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#tr" role="tab" id="tr-tab" class="faction-tab" data-toggle="tab" aria-controls="tr" aria-expanded="true">
                        <img src="/images/Empires_TR.png" class="overwrite-tabs-css"/></a></li>
                    <li role="presentation"><a href="#nc" role="tab" id="nc-tab" class="faction-tab" data-toggle="tab" aria-controls="nc">
                        <img src="/images/Empires_NC.png" class="overwrite-tabs-css"/></a></li>
                    <li role="presentation"><a href="#vs" role="tab" id="vs-tab" class="faction-tab" data-toggle="tab" aria-controls="vs">
                        <img src="/images/Empires_VS.png" class="overwrite-tabs-css"/></a></li>
                    <li role="presentation"><a href="#ns" role="tab" id="ns-tab" class="faction-tab" data-toggle="tab" aria-controls="ns">
                        <img src="/images/Empires_NS.png" class="overwrite-tabs-css"/></a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <asp:ListView ID="listFactions" runat="server" 
                        DataKeyNames="CategoryID" GroupItemCount="1"
                        ItemType="COMP4952Medium.Models.Category" SelectMethod="GetCategories">
                        <ItemTemplate>
                            <asp:HiddenField runat="server" ID="CategoryID" Value="<%#: Item.CategoryID %>" />
                            <div role="tabpanel" class="tab-pane fade <%#: GetActive() %>" id="<%#: Item.CategoryAltName %>" aria-labelledby="<%#: Item.CategoryAltName %>-tab">
                                <a href="#" onclick="<%#: Item.CategoryAltName %>Prev()"><img class="upArrow" src="/images/grey-up.png" onmouseover="blueUpArrow(this)" onmouseout="greyUpArrow(this)"/></a>
                                <div id="carousel<%#: Item.CategoryID %>" style="margin: auto;">
                                    <div class="object-img-size"></div>
                                    <div class="object-img-size"></div>
                                    <asp:ListView ID="listFactionItem" runat="server"
                                    DataKeyNames="ItemID" GroupItemCount="1"
                                    ItemType="COMP4952Medium.Models.Item" SelectMethod="GetItems">
                                    <ItemTemplate>
                                        <div class="object-img-size imgWrap" onclick="set_velocity(<%#: Item.ItemVelocity %>)"><img class="object-img-size" src="/images/<%#:Item.ItemImage %>" alt="<%#:Item.ItemName %>" /><p class="imgDescription"><%#:Item.ItemName %></p></div>
                                    </ItemTemplate>    
                                    </asp:ListView>
                                    <div class="object-img-size"></div>
                                    <div class="object-img-size"></div>
                                </div>
                                <a href="#" onclick="<%#: Item.CategoryAltName %>Next()"><img src="/images/grey-down.png" onmouseover="blueDownArrow(this)" onmouseout="greyDownArrow(this)"/></a>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <!--
                    <div role="tabpanel" class="tab-pane fade in active" id="nc" aria-labelledBy="nc-tab">
                        <a href="#" onclick="ncPrev()"><img class="upArrow" src="/images/grey-up.png" onmouseover="blueUpArrow(this)" onmouseout="greyUpArrow(this)"/></a>
                        <div id="carousel3" style="margin: auto;">
                            <div class="object-img-size"></div>
                            <div class="object-img-size"></div>
                            <asp:ListView ID="ListView1" runat="server" 
                                DataKeyNames="ItemID" GroupItemCount="1"
                                ItemType="COMP4952Medium.Models.Item" SelectMethod="GetItemNC">
                                <ItemTemplate>
                                    <div class="object-img-size imgWrap"><img src="/images/<%#:Item.ItemImage %>" alt="<%#:Item.ItemName %>" /><p class="imgDescription"><%#:Item.ItemName %></p></div>
                                </ItemTemplate>
                            </asp:ListView>
                            <div class="object-img-size"></div>
                            <div class="object-img-size"></div>
                        </div>
                        <a href="#" onclick="ncNext()"><img src="/images/grey-down.png" onmouseover="blueDownArrow(this)" onmouseout="greyDownArrow(this)"/></a>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="tr" aria-labelledBy="tr-tab">
                        <a href="#" onclick="trPrev()"><img class="upArrow" src="/images/grey-up.png" onmouseover="blueUpArrow(this)" onmouseout="greyUpArrow(this)"/></a>
                        <div id="carousel" style="margin: auto;">
                            <div class="object-img-size"></div>
                            <div class="object-img-size"></div>
                            <asp:ListView ID="itemList" runat="server" 
                                DataKeyNames="ItemID" GroupItemCount="1"
                                ItemType="COMP4952Medium.Models.Item" SelectMethod="GetItemTR">
                                <ItemTemplate>
                                    <div class="object-img-size imgWrap"><img src="/images/<%#:Item.ItemImage %>" alt="<%#:Item.ItemName %>" /><p class="imgDescription"><%#:Item.ItemName %></p></div>
                                </ItemTemplate>
                            </asp:ListView>
                            <div class="object-img-size"></div>
                            <div class="object-img-size"></div>
                        </div>
                        <a href="#" onclick="trNext()"><img src="/images/grey-down.png" onmouseover="blueDownArrow(this)" onmouseout="greyDownArrow(this)"/></a>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="vs" aria-labelledBy="vs">
                        <a class="upArrow" href="#" onclick="vsPrev()"><img class="upArrow" src="/images/grey-up.png" onmouseover="blueUpArrow(this)" onmouseout="greyUpArrow(this)"/></a>
                        <div id="carousel2" style="margin: auto;">
                            <div class="object-img-size"></div>
                            <div class="object-img-size"></div>
                                <asp:ListView ID="ListView2" runat="server" 
                                    DataKeyNames="ItemID" GroupItemCount="1"
                                    ItemType="COMP4952Medium.Models.Item" SelectMethod="GetItemVS">
                                    <ItemTemplate>
                                        <div class="object-img-size imgWrap"><img src="/images/<%#:Item.ItemImage %>" alt="<%#:Item.ItemName %>" /><p class="imgDescription"><%#:Item.ItemName %></p></div>
                                    </ItemTemplate>
                                </asp:ListView>
                            <div class="object-img-size"></div>
                            <div class="object-img-size"></div>
                        </div>
                        <a href="#" onclick="vsNext()"><img src="/images/grey-down.png" onmouseover="blueDownArrow(this)" onmouseout="greyDownArrow(this)"/></a>
                    </div> -->
                 </div><!-- End of Tab Content -->
            </div><!-- /example -->
        <div id="graphAndSettings">
            <div id="graph">
                <div id="containment-wrapper">
                    <canvas id="lineCanvas" height="500" width="500"></canvas>
                    <div style="background-color: #132930;"id="draggable" ondrag="mydraw()"class="draggable ui-widget-content">
                        <img src="images/crosshair.png" height="30" width="30" />
                    </div>
                </div>
            </div>
            <div id="settings">
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            $("#carousel1").rcarousel({
                width: 100,
                height: 90,
                margin: 5,
                orientation: "vertical",
                step: 1,
                visible: 5,
                speed: 100
            });
            $("#carousel2").rcarousel({
                width: 100,
                height: 90,
                margin: 5,
                orientation: "vertical",
                step: 1,
                visible: 5,
                speed: 100
            });
            $("#carousel3").rcarousel({
                width: 100,
                height: 90,
                margin: 5,
                orientation: "vertical",
                step: 1,
                visible: 5,
                speed: 100
            });
            $("#carousel4").rcarousel({
                width: 100,
                height: 90,
                margin: 5,
                orientation: "vertical",
                step: 1,
                visible: 5,
                speed: 100
            });
        });
        function vsNext() {
            $("#carousel3").rcarousel("next");
        }
        function vsPrev() {
            $("#carousel3").rcarousel("prev");
        }
        function trNext() {
            $("#carousel1").rcarousel("next");
        }
        function trPrev() {
            $("#carousel1").rcarousel("prev");
        }
        function ncNext() {
            $("#carousel2").rcarousel("next");
        }
        function ncPrev() {
            $("#carousel2").rcarousel("prev");
        }
        function nsNext() {
            $("#carousel4").rcarousel("next");
        }
        function nsPrev() {
            $("#carousel4").rcarousel("prev");
        }
        function greyUpArrow(img) {
            img.src = "/images/grey-up.png";
        }
        function blueUpArrow(img) {
            img.src = '/images/blue-up.png';
        }
        function greyDownArrow(img) {
            img.src = "/images/grey-down.png";
        }
        function blueDownArrow(img) {
            img.src = '/images/blue-down.png';
        }
    </script>
    <script>
        var height;
        var c = document.getElementById("lineCanvas");
        var ctx = c.getContext("2d");
        $(function drawline() {
            $("#draggable").draggable({ containment: "#containment-wrapper", scroll: false });
        });
        function mydraw() {
            height = $("#draggable").position();
            canvasHeight = $("#lineCanvas").position();
            ctx.clearRect(0, 0, c.width, c.height);
            ctx.beginPath();
            ctx.moveTo(0, c.height);
            ctx.lineTo((height.left - canvasHeight.left + 15), (height.top - canvasHeight.top + 15));
            ctx.stroke();
        }
        $("#menu").menu();
    </script>
</asp:Content>
