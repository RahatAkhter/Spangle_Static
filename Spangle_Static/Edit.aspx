<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Spangle_Static.Edit" %>

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
   <script type="text/javascript">
       $(document).ready(function () {
           $("#hide").hide();
           showdata();
       });

         function showdata() { 
            
            $.ajax({

                type: "POST",
                contentType: "application/json",
                url: 'Edit.aspx/GetAllData',
                data: "{}",
                datatype: "json",
                success: function (data) {
                    

                    var employeeTable = $('#employee tbody');  
                    for (var i = 0; i < data.d.length; i++) {
                        employeeTable.append('<tr><td style="width:10%;">' + data.d[i].p_id + '</td><td style="width:20%;">' + data.d[i].p_Name + '</td>'
                            + '<td style="width:20%;">' + data.d[i].p_disc + '</td><td style="width:20%;"><img src="' + data.d[i].p_Img + '" class=" img-rounded img-responsive" style="width:150; height:150px;" />'
                            + '</td > <td style="width:20%;">' + data.d[i].cat_Name + '</td><td style="width:5%;"><button type="button" class="btn btn-primary" value="' + data.d[i].p_id + '" onclick="Edit(this.value);">Edit</button></td>'
                            
                           +'<td style="width:5%;"><button type="button" class="btn btn-primary" value="'+data.d[i].p_id+'" onclick="Delete(this.value);">Delete</button></td> </tr >' ); 

                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });



       }
       function Delete(Val) {
           
            $.ajax({

                type: "POST",
                contentType: "application/json",
                url: 'Edit.aspx/Delete',
                data: "{'pid':'" + Val + "'}",
                datatype: "json",
                success: function (data) {
                    if (data.d == "Del") {
                        alert(" Product Delete Successfully");
                    }
                    else {

                        alert(data.d);
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });


       }
      


       var id = "";
       function Edit(Val) {
           id = Val;
           $('#myModal').modal('show');
            $('#<%=pid.ClientID%>').html(id.toString());

                                var label = document.getElementById("<%=pid.ClientID %>");

                                //Set the value of Label.
                                label.innerHTML = id.toString();

                                //Set the value of Label in Hidden Field.
                                document.getElementById("<%=lbl2.ClientID %>").value = label.innerHTML;
                                //alert(label);


            $.ajax({

                type: "POST",
                contentType: "application/json",
                url: 'Edit.aspx/GetEditData',
                data: "{'pid':'" + Val + "'}",
                datatype: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                      
                        $("#P_Name").val(data.d[i].p_Name);
                        $("#p_disc").val(data.d[i].p_disc);
                        document.getElementById('imgtag').src = data.d[i].p_Img;
                    }
                    
                },
                error: function (err) {
                    console.log(err);
                }
            });


       }
       function Update_Deatil() {
            var pname =  $("#P_Name").val();
           var p_disc = $("#p_disc").val();
             var iddl1 = document.getElementById('<%=DropDownList1.ClientID%>');
            var cid = iddl1.options[iddl1.selectedIndex].text;

           alert("ye he cid"+cid);
           if (pname != "" && p_disc != "" && id != "" && cid!="") {

            $.ajax({

                type: "POST",
                contentType: "application/json",
                url: 'Edit.aspx/Update_detail',
                data: "{'pid':'" + id + "','p_Name':'" + pname + "','p_disc':'" + p_disc + "','cat_id':'" + cid + "'}",
                datatype: "json",
                success: function (data) {
                    alert("agaya");
                    if (data.d == "Saved") {

                        alert("Product Successfuly Updated");
                        id = "";
                         
                        $("#P_Name").val("");
                        $("#p_disc").val("");
                    }
                    else {

                        alert(""+data.d);
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });



           }

       }
       function Add_New_Catagory() {
           $('#CatModal').modal('show');

       }

       function Add_New_Product() {
           $('#PModal').modal('show');


       }
      
       function Update_Cat() {
           $('#Update_CatModal').modal('show');


       }


       
       function aaa() {
  var iddl1 = document.getElementById('<%=DropDownList2.ClientID%>');
            var cid = iddl1.options[iddl1.selectedIndex].text;

           
               $.ajax({
                  
                   type: "POST",
                   contentType: "application/json",
                   url: 'Edit.aspx/New1',
                   data: "{'cat_id':'" + cid + "'}",
                   datatype: "json",
                   success: function (data) {
                       alert(data.d);
                   },
                   error: function (data) {
                       alert("Error");
                   }
                   
               });
           

       }

       function DeleteCat() {
          var iddl1 = document.getElementById('<%=DropDownList3.ClientID%>');
            var cid = iddl1.options[iddl1.selectedIndex].text;

           
               $.ajax({
                  
                   type: "POST",
                   contentType: "application/json",
                   url: 'Edit.aspx/New2',
                   data: "{'cat_id':'" + cid + "'}",
                   datatype: "json",
                   success: function (data) {
                       alert(data.d);
                   },
                   error: function (data) {
                       alert("Error");
                   }
                   
               });
           

  
       }

   </script>

</head>
<body>
     <div class=" container">
<div class=" row">
    <div class=" col-md-4">
        <button type="button" class=" btn btn-block btn-primary" onclick="Add_New_Catagory();">Add Catagory</button>
    </div>
    <div class=" col-md-4">
        <button type="button" class=" btn btn-block btn-primary" onclick="Add_New_Product();">Add Product</button>
    </div>
    <div class=" col-md-4">
        <button type="button" class=" btn btn-block btn-primary" onclick="Update_Cat();">Update Catagory</button>
    </div>

</div>

    <div class="row" >
  		
    	<div class="col-md-12 ">


            <table class="table table-bordered" id="employee" style=" margin-top:100px;">
  <thead>
    <tr>
      
      <th scope="col">Id</th>
      <th scope="col">Product Name</th>
      <th scope="col">Disc</th>
      <th scope="col">Image Path</th>
        
      <th scope="col">Catagory</th>
        <th scope="col">Edit</th>
        <th>Delete</th>
    </tr>
  </thead>
  <tbody ></tbody> 
</table>



        </div><!--/col-9-->
    </div><!--/row-->
            </div>
   

    <!-- Edit Modal-->
    <form runat="server">
    <div class=" container" id="modal-container">
   <div class=" row">
   <div class=" col-sm-9">
   
   <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <div class="row">
      <div class=" col-sm-6">
 <div class=" form-group">
        <label>Product Catagory</label>       
             <br />
             <asp:DropDownList ID="DropDownList1" runat="server" style="height:30px;width:300px;"></asp:DropDownList>
     </div>
        </div>
        
      
      <div class=" col-sm-6">
        <div class=" form-group">
        <label>Product Name</label>
        <input type="text" class=" form-control" placeholder="Enter Project Name" id="P_Name" />
        </div>
      
        </div>

      
      </div>
      
      </div>
      <div class="modal-body">
          <div id="hide">
              <asp:Label ID="pid" runat="server" Text=""></asp:Label>
              <asp:HiddenField ID="lbl2" runat="server" />
             </div>
        <div class=" form-group">
        <label for=" comment">Product Discription</label>
        <textarea class=" form-control" rows="5" id="p_disc"></textarea>
        </div>
        <div class=" form-group text-center">
        <button type="button" class="btn btn-primary" onclick="Update_Deatil();">Update Product Detail</button>
        </div> 
       <hr  style=" font-weight:bold; color:black"/>

           <div class=" form-group">
        <label for=" comment">Change Product Image</label>
                <img src="#" class="avatar img-circle img-thumbnail" style=" width:70px; height:70px;" alt="avatar" id='imgtag'/>
        

    <asp:FileUpload ID="FileUpload1" runat="server"  CssClass=" text-center"/>
    <br />
        </div>
          <div class=" form-group">
               <asp:Button ID="btn_img_save" runat="server" Text="Save Image" 
              CssClass=" btn btn-primary btn-md" onclick="btn_img_save_Click"/> 
   
          </div>

      </div>
      <div class="modal-footer">
      
       <button type="button" class="btn btn-primary btn-lg" data-dismiss="modal">Close</button>
       
      </div>
        
    </div>

  </div>
</div>
   </div>
   </div>
   
   </div>
        



<!--Update-Catagory Modal-->

    <!-- Modal -->
<div id="Update_CatModal" class="modal  fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Update Catagory</h4>
      </div>
      <div class="modal-body">
        
      <div class=" col-sm-12">
          <div class=" form-group">
        <label>Select Catagory Which U Want To Update or Delete</label>
              <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList> 
              </div>
        <div class=" form-group">
        <label>New Catagory Name</label>
            <asp:TextBox ID="TextBox5" runat="server" placeholder="please Enter Catagory Name" Style="width:100%;"></asp:TextBox>
            </div>
      
           <div class=" form-group">
        <label for=" comment">Catagory Discription</label>
        
           
               <asp:TextBox ID="TextBox6" runat="server" placeholder="Please Enter Discription" Style="width:100%;height:100px;"></asp:TextBox></div>
          
        </div>
           <div class=" form-group">
               <asp:Button ID="Button4" runat="server" Text="Update Detail" CssClass=" btn btn-primary" onclick="Button4_Click" />  
        <button type="button" class=" btn btn-primary" onclick="DeleteCat();">Delete </button>
           </div>

          <hr />
          <br />
          <div class=" form-group">
        <label for=" comment">Add Catagory Image</label>
              

    <asp:FileUpload ID="FileUpload4" runat="server"  CssClass=" text-center"/>
    <br />
        </div>
          <br />
          <div class="form-group text-center">
              <asp:Button ID="Button3" runat="server" Text="Save"  CssClass=" btn btn-primary btn-md" onclick="Button3_Click" />

          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>      




<!--Catagory Modal-->

    <!-- Modal -->
<div id="CatModal" class="modal  fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Product Catagory</h4>
      </div>
      <div class="modal-body">
        
      <div class=" col-sm-12">
        <div class=" form-group">
        <label>Product Name</label>
            <asp:TextBox ID="TextBox1" runat="server" placeholder="please Enter Catagory Name" Style="width:100%;"></asp:TextBox>
            </div>
      
           <div class=" form-group">
        <label for=" comment">Product Discription</label>
        
           
               <asp:TextBox ID="TextBox2" runat="server" placeholder="Please Enter Discription" Style="width:100%;height:100px;"></asp:TextBox></div>
          
        </div>

          <hr />
          <br />
          <div class=" form-group">
        <label for=" comment">Add Catagory Image</label>
              

    <asp:FileUpload ID="FileUpload2" runat="server"  CssClass=" text-center"/>
    <br />
        </div>
          <br />
          <div class="form-group text-center">
              <asp:Button ID="Button1" runat="server" Text="Save"  CssClass=" btn btn-primary btn-md" onclick="Button1_Click" />

          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>                                  
<!--Add new Product Modal-->
    <!-- Modal -->
<div id="PModal" class="modal  fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Please Fill The Form To Add New Product</h4>
      </div>
      <div class="modal-body">
       
          <div class=" col-sm-12">
        <div class=" form-group">
        <label>Product Name</label>
            <asp:TextBox ID="TextBox3" runat="server" placeholder="please Enter Catagory Name" Style="width:100%;"></asp:TextBox>
            </div>
      
           <div class=" form-group">
        <label for=" comment">Product Discription</label>
        
           
               <asp:TextBox ID="TextBox4" runat="server" placeholder="Please Enter Discription" Style="width:100%;height:100px;"></asp:TextBox>

           </div>
           <div class=" form-group">
        <label for=" comment">Select Product Catagory</label>
               <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
           
           </div>
                   <div class=" form-group">
        <label for=" comment">Add Product Image</label>
              

    <asp:FileUpload ID="FileUpload3" runat="server"  CssClass=" text-center"/>
    <br />
        </div>
              <br />
          <div class=" form-group text-center" >

              <asp:Button ID="Button2" runat="server" Text="Save" CssClass=" btn btn-primary btn-md" onclick="Button2_Click" OnClientClick="aaa();"  />
              </div>
              
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>                                  
        </form>
</body>
</html>
