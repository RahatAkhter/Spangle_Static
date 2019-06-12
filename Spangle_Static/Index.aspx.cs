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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static List<Catagories> Get_All()
        {
            List<Catagories> list_det = new List<Catagories>();


            DataTable dt = get_all_Catagories();
            for (Int32 i = 0; i < dt.Rows.Count; i++)
            {
                Catagories p = new Catagories();
               
                p.cat_Name = Convert.ToString(dt.Rows[i]["cat_Name"]);
                p.cat_disc = Convert.ToString(dt.Rows[i]["cat_disc"]);
                p.cat_Img = Convert.ToString(dt.Rows[i]["cat_Img"]);



                list_det.Add(p);
            }
            return list_det;

        }

        private static DataTable get_all_Catagories()
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
    }
}