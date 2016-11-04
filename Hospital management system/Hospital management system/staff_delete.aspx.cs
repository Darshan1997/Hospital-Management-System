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
    public partial class staff_delete : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        String staff_id, connstr;
        protected void Page_Load(object sender, EventArgs e)
        {


            staff_id = Request.QueryString["staff_id"];
            try
            {
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

                String selectdep = "delete from staff_info where staff_id='" + staff_id + "'";
                cmd = new SqlCommand(selectdep, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                conn.Close();
            }
            catch (Exception ex) { }
            Response.Redirect("staff_admin.aspx");
        
        }
    }
}