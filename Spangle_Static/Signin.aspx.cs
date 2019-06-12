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
    public partial class Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string Login(string id,string pass)
        {
            string con1 = System.Configuration.ConfigurationManager.ConnectionStrings["DBMS"].ConnectionString;
            try
            {

                if (id != "" && pass != "")
                {
                    SqlConnection con = new SqlConnection(con1);
                    SqlCommand cmd = new SqlCommand("select count(*) from Admin where Email='" + id + "' and password='" +pass  + "'", con);
                    con.Open();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                    con.Dispose();
                    if (count == 0)
                    {
                        return "Incorrect";
                    }
                    else
                    {
                        return "ok";
                      

                    }
                }
                else
                {
                    return "insert";
                }

            }

            catch (SqlException ex)
            {
                return ex.Message;
            }

        }
    }
}