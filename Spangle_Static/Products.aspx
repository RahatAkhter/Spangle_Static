<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Spangle_Static.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/BootSideMenu.css" rel="stylesheet" />
    <script src="js/BootSideMenu.js"></script>
    <style>
        
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

         GetCatagories();
         get_all();
     });



     function GetCatagories() {
         
$.ajax({

            type: "POST",
            contentType: "application/json",
            url: 'Products.aspx/Get_Cat',
            data: "{}",
            datatype: "json",

            
            success: function (data) {
                
                $("#main").empty();
                for (var i = 0; i < data.d.length; i++) {
                   
                        $("#main").append(' <a href="#" class="list-group-item list-group-item-action " onclick="get(this)" style=" font-weight:bold">'+data.d[i].cat_Name+'</a>');
                                       
                }


            },
            error: function (err) {
                console.log(err);
            }
        });



     }


     function get_all() {

         $.ajax({

            type: "POST",
            contentType: "application/json",
            url: 'Products.aspx/Get_All',
            data: "{}",
            datatype: "json",

            
    success: function (data) {
       
                $("#main2").empty();
        var count = 0;
        var check = data.d.length;
                        for (var i = count; i < data.d.length; i++) {
                    
                   
                    if (check > 3) {
                        $("#main2").append('<div class=" row"><div class=" col-md-4"><div class="card " style="width:100%;height:420px; border-radius:15px; background-color:white;">'
                            + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count].p_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                            + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count].p_Name + '</h3><p class="card-text" >' + data.d[count].p_disc + ' '
                            + '<br /></p></div></div></div><div class=" col-md-4"><div class="card " style="width:100%;height:420px; border-radius:15px; background-color:white;">'
                            + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count + 1].p_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                            + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count + 1].p_Name + '</h3><p class="card-text" >' + data.d[count + 1].p_disc + ''
                            + '<br /><a href="products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div><div class=" col-md-4"><div class="card " style="width:100%;height:420px; border-radius:15px; background-color:white;">'
                            + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count + 2].p_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                            + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count + 2].p_Name + '</h3><p class="card-text" >' + data.d[count + 2].p_disc + ''
                        +'<br /><a href="#" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div></div><br /><br />'
                        
                    );
                        count += 3;
                        check = check-3;
                    }
                    else if (check == 2) {
                        $("#main2").append('<div class=" row"><div class=" col-md-4"><div class="card " style="width:100%;height:420px; border-radius:15px; background-color:white;">'
                            + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count].p_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                            + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count].p_Name + '</h3><p class="card-text" >' + data.d[count].p_disc + ''
                            + '<br /><a href="products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div><div class=" col-md-4"><div class="card " style="width:100%;height:420px; border-radius:15px; background-color:white;">'
                            + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count + 1].p_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                            + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count + 1].p_Name + '</h3><p class="card-text" >' + data.d[count + 1].p_disc + ''
                        +'<br /><a href="#" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div></div><br /><br />'
                        );
                        count += 2;
                        check = check - 2;
                    }
                    else if (check == 1) {
                        $("#main2").append('<div class=" row"><div class=" col-md-4"><div class="card " style="width:100%;height:420px; border-radius:15px; background-color:white;">'
                            + '<div class="card-body" style=" height:420px; width:100%; overflow:scroll;" ><img src="' + data.d[count].p_Img + '" class="style_prevu_kit img-rounded img-responsive" style="width:80%; margin-left:10%; height:300px;" />'
                            + '<h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count].p_Name + '</h3><p class="card-text" >' + data.d[count].p_disc + ''
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
     function get(Val) {
         var v = Val.innerHTML;

         if (v == 'ALL') {
             get_all();

         }

         else {

             
$.ajax({

            type: "POST",
            contentType: "application/json",
            url: 'Products.aspx/Get_specific',
            data: "{'cat_Name':'" + v + "'}",
            datatype: "json",

            
    success: function (data) {
        
                $("#main2").empty();
        var count = 0;
        var check = data.d.length;
                for (var i = count; i < data.d.length; i++) {
                    
                    if (check >= 3) {
                        $("#main2").append('<div class=" row" ><div class=" col-md-4"><div class="card style_prevu_kit" style="width:100%;height:420px; background-color:white;">'
                            + '  <div class="card-body"><img src="' + data.d[count].p_Img + '" style="width:80%; margin-left:10%; height:300px;" /><h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count].p_Name + '</h3>'
                            + '<p class="card-text">' + data.d[count].p_disc + '<br />'
                            + '<a href="Products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div><div class=" col-md-4"><div class="card style_prevu_kit" style="width:100%;height:420px; background-color:white;">'
                            + '  <div class="card-body"><img src="' + data.d[count + 1].p_Img + '" style="width:80%; margin-left:10%; height:300px;" /><h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count + 1].p_Name + '</h3>'
                            + '<p class="card-text">' + data.d[count + 1].p_disc + '<br />'
                            + '<a href="Products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div><div class=" col-md-4"><div class="card style_prevu_kit" style="width:100%;height:420px; background-color:white;">'
                            + '  <div class="card-body"><img src="' + data.d[count + 2].p_Img + '" style="width:80%; margin-left:10%; height:300px;" /><h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count + 2].p_Name + '</h3>'
                            + '<p class="card-text">' + data.d[count + 2].p_disc + '<br />'
                            + '<a href="Products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div></div><br /><br />'
                        );
                        count += 3;
                        check = check-3;
                    }
                    else if (check == 2) {
                        $("#main2").append('<div class=" row" ><div class=" col-md-4"><div class="card style_prevu_kit" style="width:100%;height:420px; background-color:white;">'
                            + '  <div class="card-body"><img src="' + data.d[count].p_Img + '" style="width:80%; margin-left:10%; height:300px;" /><h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count].p_Name + '</h3>'
                            + '<p class="card-text">' + data.d[count].p_disc + '<br />'
                            + '<a href="Products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div><div class=" col-md-4"><div class="card style_prevu_kit" style="width:100%;height:420px; background-color:white;">'
                            + '  <div class="card-body"><img src="' + data.d[count + 1].p_Img + '" style="width:80%; margin-left:10%; height:300px;" /><h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count + 1].p_Name + '</h3>'
                            + '<p class="card-text">' + data.d[count + 1].p_disc + '<br />'
                            + '<a href="Products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div></div><br /><br />'
                        );
                        count += 2;
                        check = check - 2;
                    }
                    else if (check == 1) {
                        $("#main2").append('<div class=" row" ><div class=" col-md-4"><div class="card style_prevu_kit" style="width:100%;height:420px; background-color:white;">'
                            + '  <div class="card-body"><img src="' + data.d[count].p_Img + '" style="width:80%; margin-left:10%; height:300px;" /><h3 class="card-title" style="color: #339966; font-weight:bold">' + data.d[count].p_Name + '</h3>'
                            + '<p class="card-text">' + data.d[count].p_disc + '<br />'
                            + '<a href="Products.aspx" class="card-link" style="color: #339966;">Learn More</a></p></div></div></div></div><br /><br />'
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

     } 
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body style=" background-color:lightgray;" >
    <div id="sidemenu" style=" margin-top:63px; width:300px;">
         
            <h1 style=" font-weight:bold;color: #339966; ">Catagories</h1>
            
            <div class="list-group" style=" margin-top:30px;" >
                <a href="#" class="list-group-item list-group-item-action " onclick="get(this)" style=" font-weight:bold">ALL</a>
                <div id="main" >

                </div>
 
</div>
        </div>

    <div class=" container" id="main2">
        
        
        
    </div>
    


</body>
</asp:Content>
