<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="Spangle_Static.Signin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

      
     <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
   
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
   


    <link href="css/signincss.css" rel="stylesheet" />
    <script src="js/signinJs.js"></script>
    <script type="text/javascript">

        function Login() {

            var v = $('#id').val();
            var pass = $('#pass').val();
            alert(v+""+pass);
$.ajax({

            type: "POST",
            contentType: "application/json",
            url: 'Signin.aspx/Login',
            data: "{'id':'" + v + "','pass':'" + pass + "'}",
            datatype: "json",

            
    success: function (data) {
        if (data.d == "Incorrect") {
            alert("Incorrect Email or Password");

        }
        else if (data.d == "ok") {
            window.location.href="Edit.aspx";

        }
        else if (data.d == "insert") {
            alert("please insert Name or Password")

        }
        else {

            alert("Error Occur");
        }
        
            },
            error: function (err) {
                console.log(err);
            }
        });
             

        }

    </script>


</head>
<body>
   
<div class="container">
	<div class="login-container">
            <div id="output"></div>
            <div class="avatar"></div>
            <div class="form-box">
                <form >
                    <input name="user" type="text" placeholder="username" id="id" />
                    <input type="password" placeholder="password" id="pass" />
                    <button class="btn btn-info btn-block login" type="button" onclick="Login();">Login</button>
                </form>
            </div>
        </div>
        
</div>
</body>
</html>
