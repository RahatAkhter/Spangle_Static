<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Contact_us.aspx.cs" Inherits="Spangle_Static.Contact_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
    <link href="css/BootSideMenu.css" rel="stylesheet" />
    <script src="js/BootSideMenu.js"></script>

<link href="css/contctus.css" rel="stylesheet" />

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <script type="text/javascript">

         $(document).ready(function () {
         $("#sidemenu").BootSideMenu({

             side: 'left'
         });
             
        });
    </script>
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="sidemenu" style=" margin-top:63px; width:300px;">
        <img style="max-width:80px; height:80px; margin-left:50px; margin-top:20px;"
             src="Images/logo company.JPG">
      <div class="list-group" style=" margin-top:20px;">
  <a href="Index.aspx" class="list-group-item">Home</a>
  <a href="Contact_us.aspx" class="list-group-item">Contact Us</a>
  <a href="#" class="list-group-item">About Us</a>
          
  <a href="#" class="list-group-item">Services</a>
  <a href="Products.aspx" class="list-group-item">Products</a>
</div>
        </div>
    
    <div class="contact-pageheader">
        <div class="container">


            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="contact-caption">
                        <h1 class="contact-title">Don’t Be Shy, Talk to Us.</h1>
                        <p class="contact-text">Get in touch and we'll get back to you as soon as we can.  We look forward to hearing from you!</strong>
                        </p>
                    </div>
                </div>
                <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12">
                    <div class="contact-form">
                        <h3 class="contact-info-title">Contact Us</h3>
                        <div class="row">
                            <form>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label sr-only " for="Name"></label>
                                        <input id="name" type="text" placeholder="Name" class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label sr-only " for="email"></label>
                                        <input id="email" type="text" placeholder="Email" class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label sr-only " for="Phone"></label>
                                        <input id="phone" type="text" placeholder="Phone" class="form-control" required>
                                    </div>
                                </div>
                                
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb20">
                                    <div class="form-group">
                                        <label class="control-label sr-only" for="textarea"></label>
                                        <textarea class="form-control pdt20" id="textarea" name="textarea" rows="4" placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                                    <button class="btn btn-primary btn-lg ">Send message</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb60">
                    <hr>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
                    <div id="contact-map"></div>
                </div>
                <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-6 col-xs-12">
                    <div class="">
                        <h3 class="title-bold">Contact Info</h3>
                        <p>Please help us serve you better by sharing the following information.
                        </p>
                    </div>
                    <div class="contact-section">
                        <div class="contact-icon"><i class="fa fa-map-marker"></i></div>
                        <div class="contact-info">
                            <p>108 First floor Fortune Centre, Shahra e Faisal, Karachi, Pakistan</p>
                        </div>
                    </div>
                     <div class="contact-section">
                        <div class="contact-icon"><i class="fa fa-phone"></i></div>
                        <div class="contact-info">
                            <p>+923431012068</p>
                        </div>
                    </div>
                     <div class="contact-section">
                        <div class="contact-icon"><i class="fa fa-envelope"></i></div>
                        <div class="contact-info">
                            <p>info@spanglepk.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
     <script>
    function initMap() {
        var uluru = {
            lat: 24.861711,
            lng: 67.065385
        };
        var map = new google.maps.Map(document.getElementById('contact-map'), {
            zoom: 14,
            center: uluru,
            scrollwheel: false
        });
        var marker = new google.maps.Marker({
            position: uluru,
            map: map,
            icon: 'https://easetemplate.com/free-website-templates/life-coach/images/map_marker.png'

        });
    }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZib4Lvp0g1L8eskVBFJ0SEbnENB6cJ-g&callback=initMap">
    </script>

</asp:Content>
