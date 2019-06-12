using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.IO;
namespace Spangle_Static
{
    public partial class Edit : System.Web.UI.Page
    { public static string con1 = System.Configuration.ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
        public static int? cat;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(con1);
            SqlDataAdapter adpt = new SqlDataAdapter("select cat_id,cat_Name  from Catagories", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "cat_Name";
            DropDownList1.DataValueField = "cat_id";
            DropDownList1.DataBind();
            DropDownList2.DataSource = dt;
            DropDownList2.DataBind();
            DropDownList2.DataTextField = "cat_Name";
            DropDownList2.DataValueField = "cat_id";
            DropDownList2.DataBind();
            DropDownList3.DataSource = dt;
            DropDownList3.DataBind();
            DropDownList3.DataTextField = "cat_Name";
            DropDownList3.DataValueField = "cat_id";
            DropDownList3.DataBind();

        }

        [WebMethod]
       public static string Update_detail(string pid,string p_Name,string p_disc,string cat_id)
        {
            try
            {

                

                SqlConnection con = new SqlConnection(con1);
                SqlCommand cmd1 = new SqlCommand("select cat_id from Catagories where cat_Name = @catname", con);
                cmd1.Parameters.AddWithValue("@catname", cat_id);
                con.Open();
                int cid = Convert.ToInt32(cmd1.ExecuteScalar());
                con.Close();

                SqlCommand cmd = new SqlCommand("update Products set p_Name = @pname, p_disc =@pdisc,cat_Id=@cid where p_id = @id", con);
                cmd.Parameters.AddWithValue("@pname",p_Name);
                cmd.Parameters.AddWithValue("@pdisc", p_disc);
                cmd.Parameters.AddWithValue("@id",Convert.ToInt32(pid));
                cmd.Parameters.AddWithValue("@cid", cid);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                con.Dispose();
                return "Saved";
            }
            catch(Exception ex)
            {
                return ex.Message;

            }
        }


        protected void btn_img_save_Click(object sender, EventArgs e)
        {

            pid.Text = Request.Form[lbl2.UniqueID];
            int id = Convert.ToInt32(pid.Text.ToString());


            try
            {


                if (FileUpload1.PostedFile != null && FileUpload1.HasFile)
                {


                    

                    string imgFile = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    FileUpload1.SaveAs(Server.MapPath("Images/"+imgFile));

                    SqlConnection conn = new SqlConnection(con1);


                    SqlCommand cmd1 = new SqlCommand("update Products set p_Img=@img where p_id='"+id+"'", conn);
                    cmd1.Parameters.AddWithValue("@img", "Images/" + imgFile);


                    conn.Open();
                    cmd1.ExecuteNonQuery();
                    conn.Close();
                    conn.Dispose();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Save Successfully')", true);


                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select The Imgae First')", true);


                }
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : '+'" + ex.Message + "')", true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {



            try
            {


                if (FileUpload4.PostedFile != null && FileUpload4.HasFile)
                {




                    string imgFile1 = Path.GetFileName(FileUpload4.PostedFile.FileName);

                    FileUpload4.SaveAs(Server.MapPath("Images/" + imgFile1));

                    SqlConnection conn = new SqlConnection(con1);
                   
                        SqlCommand cmd1 = new SqlCommand("update Catagories set cat_Img=@img where cat_id=@id", conn);
                        cmd1.Parameters.AddWithValue("@img", "Images/" + imgFile1);
                        cmd1.Parameters.AddWithValue("@id",Convert.ToInt32(DropDownList3.SelectedItem.Value));
                    

                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                        conn.Dispose();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Save Successfully')", true);
                   
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select The File')", true);

                }
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : '+'" + ex.Message + "')", true);
            }
        }
        

        protected void Button4_Click(object sender, EventArgs e)
        {



            try
            {



                if (TextBox5.Text != "" && TextBox6.Text != "") {
                    SqlConnection conn = new SqlConnection(con1);

                    SqlCommand cmd1 = new SqlCommand("update Catagories set cat_Name = @name, cat_disc =@disc where cat_id = @id", conn);
                    cmd1.Parameters.AddWithValue("@name", TextBox5.Text.ToString() );
                    cmd1.Parameters.AddWithValue("@disc", TextBox6.Text.ToString());

                    cmd1.Parameters.AddWithValue("@id", Convert.ToInt32(DropDownList3.SelectedItem.Value));


                    conn.Open();
                    cmd1.ExecuteNonQuery();
                    conn.Close();
                    conn.Dispose();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Save Successfully')", true);
                }
                else if(TextBox5.Text!="" && TextBox6.Text == "")
                {
                    SqlConnection conn = new SqlConnection(con1);

                    SqlCommand cmd1 = new SqlCommand("update Catagories set cat_Name = @name where cat_id = @id", conn);
                    cmd1.Parameters.AddWithValue("@name", TextBox5.Text.ToString());
                    
                    cmd1.Parameters.AddWithValue("@id", Convert.ToInt32(DropDownList3.SelectedItem.Value));


                    conn.Open();
                    cmd1.ExecuteNonQuery();
                    conn.Close();
                    conn.Dispose();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Save Successfully')", true);


                }

                else if (TextBox6.Text!="" && TextBox5.Text=="")
                {

                    SqlConnection conn = new SqlConnection(con1);

                    SqlCommand cmd1 = new SqlCommand("update Catagories set cat_disc = @disc where cat_id = @id", conn);
                    cmd1.Parameters.AddWithValue("@disc", TextBox6.Text.ToString());

                    cmd1.Parameters.AddWithValue("@id", Convert.ToInt32(DropDownList3.SelectedItem.Value));


                    conn.Open();
                    cmd1.ExecuteNonQuery();
                    conn.Close();
                    conn.Dispose();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Save Successfully')", true);


                }
                else if(TextBox5.Text=="" && TextBox6.Text == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Insert The Deatils')", true);


                }
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : '+'" + ex.Message + "')", true);
            }
        }




        protected void Button1_Click(object sender, EventArgs e)
        {

         

            try
            {


                if (FileUpload2.PostedFile != null && FileUpload2.HasFile)
                {




                    string imgFile1 = Path.GetFileName(FileUpload2.PostedFile.FileName);

                    FileUpload2.SaveAs(Server.MapPath("Images/" + imgFile1));

                    SqlConnection conn = new SqlConnection(con1);
                    if (TextBox1.Text != "" && TextBox2.Text != "")
                    {

                        SqlCommand cmd1 = new SqlCommand("insert into Catagories values(@catName,@cat_Img,@catDis)", conn);
                        cmd1.Parameters.AddWithValue("@cat_Img", "Images/" + imgFile1);
                        cmd1.Parameters.AddWithValue("@catName", TextBox1.Text.ToString());
                        cmd1.Parameters.AddWithValue("@catDis", TextBox2.Text.ToString());


                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                        conn.Dispose();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Save Successfully')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Enter Some text')", true);

                    }

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select The File')", true);

                }
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : '+'" + ex.Message + "')", true);
            }
        }

        [WebMethod]

        public static string New1(string cat_id) {


            SqlConnection con3 = new SqlConnection(con1);
            SqlCommand cm3 = new SqlCommand("select cat_id from Catagories where cat_Name=@cname", con3);
            cm3.Parameters.AddWithValue("@cname", cat_id);
            con3.Open();
             cat = Convert.ToInt32(cm3.ExecuteScalar());
            con3.Close();
            con3.Dispose();
            return "ho gya";
        }

        [WebMethod]

        public static string New2(string cat_id)
        {


            SqlConnection con3 = new SqlConnection(con1);
            SqlCommand cm3 = new SqlCommand("select cat_id from Catagories where cat_Name=@cname", con3);
            cm3.Parameters.AddWithValue("@cname", cat_id);
            con3.Open();
            int cid = Convert.ToInt32(cm3.ExecuteScalar());
            con3.Close();
            con3.Dispose();

            SqlConnection con = new SqlConnection(con1);
            SqlCommand cmd = new SqlCommand(" delete Catagories where cat_id=@id",con);
            cmd.Parameters.AddWithValue("@id",cid);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            return "Deleted Success";

        }



        protected void Button2_Click(object sender, EventArgs e)
        {



            try
            {


                if (FileUpload3.PostedFile != null && FileUpload3.HasFile)
                {




                    string imgFile2 = Path.GetFileName(FileUpload3.PostedFile.FileName);

                    FileUpload3.SaveAs(Server.MapPath("Images/" + imgFile2));

                    SqlConnection conn = new SqlConnection(con1);
                    if (TextBox3.Text != "" && TextBox4.Text != "" && cat!=null)
                    {

                        SqlCommand cmd1 = new SqlCommand("insert into Products values(@pname,@pdisc,@pimg,@cat_Id)", conn);
                        cmd1.Parameters.AddWithValue("@pimg", "Images/" + imgFile2);
                        cmd1.Parameters.AddWithValue("@pname", TextBox3.Text.ToString());
                        cmd1.Parameters.AddWithValue("@pdisc", TextBox4.Text.ToString());
                        cmd1.Parameters.AddWithValue("@cat_Id", cat);


                        conn.Open();
                        cmd1.ExecuteNonQuery();
                        conn.Close();
                        conn.Dispose();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Save Successfully')", true);
                        cat = null;
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Enter Some text')", true);

                    }

                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Select Image File')", true);

                }
            }
            catch (SqlException ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error : '+'" + ex.Message + "')", true);
            }
        }
        [WebMethod]
        public static string Delete(string pid)
        {
            try {


                SqlConnection conn = new SqlConnection(con1);
                SqlCommand cmd = new SqlCommand("delete Products where p_id='"+Convert.ToInt32(pid)+"'", conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                conn.Dispose();
                return "Del";

            }
            catch(Exception ex)
            {

                return ex.Message;
            }

        }


        [WebMethod]
        public static List<Product> GetAllData()
        {
            List<Product> list_det = new List<Product>();


            DataTable dt = get_all_products();
            for (Int32 i = 0; i < dt.Rows.Count; i++)
            {
                Product p = new Product();
              
                p.p_id = Convert.ToInt32(dt.Rows[i]["p_id"]);
                p.p_Name = Convert.ToString(dt.Rows[i]["p_Name"]);
                p.p_disc = Convert.ToString(dt.Rows[i]["p_disc"]);
                p.p_Img = Convert.ToString(dt.Rows[i]["p_Img"]);
                p.cat_Name= Convert.ToString(dt.Rows[i]["cat_Name"]);


                list_det.Add(p);
            }
            return list_det;

        }

        private static DataTable get_all_products()
        {

            string con1 = System.Configuration.ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(con1);
            SqlCommand cmd = new SqlCommand(@"select p.p_id,p.p_Name,p.p_disc,p.p_Img,c.cat_Name
from Products as p
left join Catagories as c
on p.cat_Id=c.cat_id", conn);
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataReader dr = cmd.ExecuteReader();
            dt.Load(dr);
            dr.Close();
            conn.Close();

            return dt;

        }

        [WebMethod]
        public static List<Product> GetEditData(string pid)
        {
            List<Product> list_det = new List<Product>();

            
            DataTable dt = get_product(Convert.ToInt32(pid));
            for (Int32 i = 0; i < dt.Rows.Count; i++)
            {
                Product p = new Product();

                
                p.p_Name = Convert.ToString(dt.Rows[i]["p_Name"]);
                p.p_disc = Convert.ToString(dt.Rows[i]["p_disc"]);
                p.p_Img = Convert.ToString(dt.Rows[i]["p_Img"]);


                list_det.Add(p);
            }
            return list_det;

        }

        private static DataTable get_product(int pid)
        {

            string con1 = System.Configuration.ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(con1);
            SqlCommand cmd = new SqlCommand(@"select * from Products where p_id=@pid", conn);
            cmd.Parameters.AddWithValue("@pid", pid);
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataReader dr = cmd.ExecuteReader();
            dt.Load(dr);
            dr.Close();
            conn.Close();

            return dt;

        }


    }
}

