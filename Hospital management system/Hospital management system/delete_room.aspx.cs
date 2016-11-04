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
    public partial class delete_room : System.Web.UI.Page
    {
        String rno;
        SqlConnection conn;
        SqlCommand cmd;
        String d_id, connstr;
        protected void Page_Load(object sender, EventArgs e)
        {

            rno = Request.QueryString["room_no"];

            try
            {
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

                String selectdep = "update rooms_info set room_status='free' where room_no='"+ rno +"'";
                cmd = new SqlCommand(selectdep, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                conn.Close();

               conn.Open();
                String select = "delete from rooms where room_no='" + rno + "'";
                cmd = new SqlCommand(select, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                conn.Close();
                
            }
            catch (Exception ex) { }
            Response.Redirect("rec_room.aspx");

        }
    }
}