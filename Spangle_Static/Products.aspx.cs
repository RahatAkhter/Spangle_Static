using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace Spangle_Static
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static List<Catagories> Get_Cat()
        {
            List<Catagories> list_det = new List<Catagories>();


            DataTable dt = getdata();
            for (Int32 i = 0; i < dt.Rows.Count; i++)
            {
                Catagories u = new Catagories();
                
                u.cat_Id = Convert.ToInt32(dt.Rows[i]["cat_Id"]);
                u.cat_Name = Convert.ToString(dt.Rows[i]["cat_Name"]);


                list_det.Add(u);
            }
            return list_det;

        }

        private static DataTable getdata()
        {

            string con1 = System.Configuration.ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(con1);
            SqlCommand cmd = new SqlCommand(@"select * from Catagories", conn);
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataReader dr = cmd.ExecuteReader();
            dt.Load(dr);
            dr.Close();
            conn.Close();

            return dt;

        }

        [WebMethod]
        public static List<Product> Get_All()
        {
            List<Product> list_det = new List<Product>();


            DataTable dt = get_all_products();
            for (Int32 i = 0; i < dt.Rows.Count; i++)
            {
                Product p = new Product();
               p.cat_Id= Convert.ToInt32(dt.Rows[i]["cat_Id"]);
                p.p_id= Convert.ToInt32(dt.Rows[i]["p_id"]);
                p.p_Name= Convert.ToString(dt.Rows[i]["p_Name"]);
                p.p_disc= Convert.ToString(dt.Rows[i]["p_disc"]);
                p.p_Img = Convert.ToString(dt.Rows[i]["p_Img"]);



                list_det.Add(p);
            }
            return list_det;

        }

        private static DataTable get_all_products()
        {

            string con1 = System.Configuration.ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(con1);
            SqlCommand cmd = new SqlCommand(@"select * from Products", conn);
            conn.Open();
            DataTable dt = new DataTable();
            SqlDataReader dr = cmd.ExecuteReader();
            dt.Load(dr);
            dr.Close();
            conn.Close();

            return dt;

        }

        [WebMethod]
        public static List<Product> Get_specific(string cat_Name)
        {
            List<Product> list_det = new List<Product>();

            
            DataTable dt = get_all_products(cat_Name);
            for (Int32 i = 0; i < dt.Rows.Count; i++)
            {
                Product p = new Product();
                p.cat_Id = Convert.ToInt32(dt.Rows[i]["cat_Id"]);
                p.p_id = Convert.ToInt32(dt.Rows[i]["p_id"]);
                p.p_Name = Convert.ToString(dt.Rows[i]["p_Name"]);
                p.p_disc = Convert.ToString(dt.Rows[i]["p_disc"]);
                p.p_Img = Convert.ToString(dt.Rows[i]["p_Img"]);



                list_det.Add(p);
            }
            return list_det;

        }

        private static DataTable get_all_products(string cat_Name)
        {



            string con1 = System.Configuration.ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            SqlConnection conn = new SqlConnection(con1);
            SqlConnection con2 = new SqlConnection(con1);
            SqlCommand cmd1 = new SqlCommand("select cat_Id from Catagories where cat_Name='" + cat_Name + "'", con2);
            con2.Open();
            int cat_id = Convert.ToInt32(cmd1.ExecuteScalar());
            con2.Close();
            con2.Dispose();

            SqlCommand cmd = new SqlCommand(@"select * from Products as p 
left join Catagories as c
on c.cat_id=p.cat_Id
where p.cat_Id='"+cat_id+"'", conn);
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
public class Catagories
{

   public int cat_Id { get; set; }
public string cat_Name { get; set; }
    public string cat_Img { get; set; }
    public string cat_disc { get; set; }
}
