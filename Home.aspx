﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Future Egg</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <layer id="placeholderlayer"></layer>
    
        <div class ="container">
            <div id="slides">
                <a href="Product.aspx?id=1"><img src="Images/Banner/1.png" /></a>
                <a href="Product.aspx?id=2"><img src="Images/Banner/2.png" /></a>
                <a href="Product.aspx?id=9"><img src="Images/Banner/9.png" /></a>
            </div>
        </div>
        <script src="/Scripts/jquery-1.10.2.min.js"></script>

        <script src="/Scripts/jquery.slides.min.js"></script>
    <%-- Rotating banner --%>
        <script>
            $(function()
            {
                $('#slides').slidesjs(
                    {
                        width: 300,
                        height: 300,
                        play: {
                            active: true,
                            auto: true,
                            interval: 4000,
                            swap: true
                        }
                    });
            })
        </script>
    
</asp:Content>

