<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="About_us.aspx.cs" Inherits="Spangle_Static.About_us" %>
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
    
    <div class="contact-pageheader" style="margin-bottom:20px;">
        <div class="container">


            <div class="row" style="margin-bottom:110px;">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" style="height:400px; border-radius:15px;">
                    <div class="contact-caption">
                        <h1 class="contact-title">About Us</h1>
                        <p class="contact-text" style="margin-bottom:30px;">
                            
                           SPANGLE (Pvt.) Ltd is a fastest growing company that offers its clients and consumers new, innovative and the best quality products. It was established in 2016 and since then Spangle has been identified for its distinctive range of products including rice, salt, tea, coffee and other food and beverages etc. This wide range of products is available in Pakistan and has also gained recognition in the international export market and is fast 
                            gaining popularity in Europe, America, Africa, and many Far Eastern countries.
                        </p>
                    </div>
                </div>
                <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-12 col-xs-12" style=" margin-top:20px; height:400px;  border-radius:15px;">
                    <div class="contact-form" style=" border-radius:15px;margin-top:60px;" > 
                        <img src="Images/Product 27 copy.jpg" class=" img-responsive  img-rounded"  />
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
               
                <div class=" col-xs-12 text-center">
                        <h3 class="title-bold">Meet The team</h3>
                        <p>We have the team of best and skillful business, marketing and manufacturing professionals.
                        </p>
                    
                </div>


            </div>
            <br />
            <br />
            <div class="row">
               
                <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-6 col-xs-12 ">
                        <h4 class="title-bold">FURRUKH IQBAL MIRZA</h4><br />
                    
                            <img src="Images/download-2-square.jpg" class="img-rounded img-responsive"  />
                    <br />
                        <p>Founder & CEO
                        </p>
                    
                </div>
                 <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-6 col-xs-12">
                        <h4 class="title-bold">ABUBAKAR MIRZA</h4><br />
                    
                            <img src="Images/download-2-square.jpg" class="img-rounded img-responsive"  />
                    <br />
                        <p>Vice President
                        </p>
                       
                    
                </div>


            </div>
            <div class="row">
               
                <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-6 col-xs-12 ">
                        <h4 class="title-bold">YOUNUS MEMON</h4><br />
                    
                            <img src="Images/download-2-square.jpg" class="img-rounded img-responsive"  />
                    <br />
                        <p>Director
                        </p>
                    
                </div>
                 <div class="col-lg-offset-1 col-lg-5 col-md-offset-1 col-md-5 col-sm-6 col-xs-12">
                        <h4 class="title-bold">AHKAM MIRZA</h4><br />
                    
                            <img src="Images/download-2-square.jpg" class="img-rounded img-responsive"  />
                    <br />
                        <p>Director
                        </p>
                       
                    
                </div>


            </div>
        </div>
    </div>
    
    
</asp:Content>
