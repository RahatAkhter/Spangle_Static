<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Spangle_Static.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link href="css/BootSideMenu.css" rel="stylesheet" />
    <script src="js/BootSideMenu.js"></script>
  <style>
    .fond{position:absolute;padding-top:85px;top:0;left:0; right:0;bottom:0;
 background-color:#00506b;}

.style_prevu_kit
{
    display:inline-block;
    border:0;
    width:100px;
    height:110px;
    position: relative;
    -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1); 
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1); 
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1);
    transition: all 200ms ease-in;
    transform: scale(1);   

}

::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {  
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}

</style>
    <script type="text/javascript">
     $(document).ready(function () {
         $("#sidemenu").BootSideMenu({

             side: 'left'
         });

        // GetCatagories();

         get_Catagories();
        });

        function get_Catagories() {
         
 
$.ajax({

            type: "POST",
            contentType: "application/json",
            url: 'Index.aspx/Get_All',
            data: "{}",
            datatype: "json",

            
    success: function (data) {
       
                $("#main2").empty();
        var count = 0;
        var check = data.d.length;
                for (var i = count; i < data.d.length; i++) {
                    
                   
                    if (check > 3) {
                        $("#main2").append('<div class=" row"><div class=" col-md-4 border-primary"><div class="card " style="width:100%;height:420px; background-color:white;">'
                        + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="'+data.d[count].cat_Img+'" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                        + '<h3 class="card-title" style="color: #339966; font-weight:bold">'+data.d[count].cat_Name+'</h3><p class="card-text" >'+data.d[count].cat_disc+' '
                        + '<br /><a href="Products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div><div class=" col-md-4 "><div class="card " style="width:100%;height:420px; background-color:white;">'
                        + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count+1].cat_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                        + '<h3 class="card-title" style="color: #339966; font-weight:bold">'+data.d[count+1].cat_Name+'</h3><p class="card-text" >'+data.d[count+1].cat_disc+''
                        + '<br /><a href="products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div><div class=" col-md-4 border-primary"><div class="card " style="width:100%;height:420px; background-color:white;">'
                        + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count+2].cat_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                        + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count+2].cat_Name + '</h3><p class="card-text" >' + data.d[count+2].cat_disc + ''
                        +'<br /><a href="#" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div></div><br /><br />'
                        
                    );
                        count += 3;
                        check = check-3;
                    }
                    else if (check == 2) {
                        $("#main2").append('<div class=" row"><div class=" col-md-4 "><div class="card " style="width:100%;height:420px;  background-color:white;">'
                        + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count].cat_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                        + '<h3 class="card-title" style="color: #339966; font-weight:bold">'+data.d[count].cat_Name+'</h3><p class="card-text" >'+data.d[count].cat_disc+''
                        + '<br /><a href="products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div><div class=" col-md-4 "><div class="card " style="width:100%;height:420px;  background-color:white;">'
                        + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count+1].cat_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                        + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count+1].cat_Name + '</h3><p class="card-text" >' + data.d[count+1].cat_disc + ''
                        +'<br /><a href="#" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div></div><br /><br />'
                        );
                        count += 2;
                        check = check - 2;
                    }
                    else if (check == 1) {
                        $("#main2").append('<div class=" row"><div class=" col-md-4 border-primary"><div class="card " style="width:100%;height:420px; border-radius:15px; background-color:white;">'
                        + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count].cat_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                        + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count].cat_Name + '</h3><p class="card-text" >' + data.d[count].cat_disc + ''
                        +'<br /><a href="#" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div></div><br /><br />'
                        
                        );

                        count += 1;
                        check = check - 1;
                    }
                                       
                }


            },
            error: function (err) {
                console.log(err);
            }
        });
             

     }



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <body style=" background-color:lightgray;">
    <div id="sidemenu" style=" margin-top:63px; width:300px;">
        <img style="max-width:80px; height:80px; margin-left:50px; margin-top:20px;"
             src="Images/logo company.JPG">
      <div class="list-group" style=" margin-top:20px;">
  <a href="Index.aspx" class="list-group-item">Home</a>
  <a href="Contact_us.aspx" class="list-group-item">Contact Us</a>
  <a href="About_us.aspx" class="list-group-item">About Us</a>
          
  <a href="Services.aspx" class="list-group-item">Services</a>
  <a href="Products.aspx" class="list-group-item">Products</a>
</div>
        <!--.shrink:hover
{
        -webkit-transform: scale(0.8);
        -ms-transform: scale(0.8);
        transform: scale(0.8);
}-->
            
        </div>
        <div class=" container" id="main2">
       
    </div>
    <div class=" container-fluid" style=" margin-top:50px;">
        <div class="row">
            <div class=" col-md-12 col-xs-12 col-sm-12">
                 <img src="Images/Mission.JPG" class="img-responsive img-rounded " style=" width:80%; height:400px; margin-top:40px; margin-left:10%;" />


                </div>
        </div>

        <br />
        <br />
     
         <div class="row">
            <div class=" col-md-12 ">
                 <img src="Images/Group_of.JPG" class="img-responsive img-rounded " style=" width:80%; height:400px; margin-top:40px; margin-left:10%;" />

                </div>
        </div>

        <br />
        <br />
        <div class="row">
            <div class=" col-md-12 text-center">
                 <img src="Images/sPANGLE_PROFILE.JPG" class="img-responsive img-rounded " style=" width:80%; height:400px; margin-top:40px; margin-left:10%;" />

                </div>
        </div>

        
    </div>
       </body>
</asp:Content>
