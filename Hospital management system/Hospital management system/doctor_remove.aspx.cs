using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class doctor_remove : System.Web.UI.Page
    {
        SqlConnection conn;
        
        SqlCommand cmd;
        String d_id,connstr;
        protected void Page_Load(object sender, EventArgs e)
        {
            d_id = Request.QueryString["d_id"];
            try
            {
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

                String selectdep = "delete from doctor_info where d_id='" + d_id + "'";
                cmd = new SqlCommand(selectdep, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                conn.Close();
            }
            catch(Exception ex){}
            Response.Redirect("admin_doctor.aspx");
        }

    }
}