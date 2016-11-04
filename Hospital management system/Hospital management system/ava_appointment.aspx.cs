using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class ava_appointment : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        String connstr, selectdoctor, id, rid,number,s="";
        int count,i=0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            dname.Text = Session["resdocname"].ToString();
            depname.Text = Session["resdepname"].ToString();
            
            checkcount();

            //decidingtime();

           // errormsg.Text = s;

   
            conn.Close();
        }

        private void decidingtime()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String select = "select time from appointment_info";
            command = new SqlCommand(select, conn);
            SqlDataAdapter adaptertime = new SqlDataAdapter(command);
            DataSet datatime = new DataSet();
            adaptertime.Fill(datatime, "time_info");
            foreach (DataRow row in datatime.Tables["time_info"].Rows)
            {
                var time = row["time"];
                s += " " + time;
            }
            conn.Close();
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            
            number = randomnumber();

            String insertdata = "insert into appointment_info (app_id,d_name,patient_name,p_contactno,p_email,d_department) values"+
                  "(@app_id,@dname,@pname,@pcon,@pemail,@dep)";
            command = new SqlCommand(insertdata, conn);
            command.Parameters.AddWithValue("@dname", Session["resdocname"]);
            command.Parameters.AddWithValue("@dep", Session["resdepname"]);
            command.Parameters.AddWithValue("@app_id", number);
            command.Parameters.AddWithValue("@pname", pname.Text);
            command.Parameters.AddWithValue("@pcon", conno.Text);
            command.Parameters.AddWithValue("@pemail",email.Text );
           // command.Parameters.AddWithValue("@ptime", time.Text );
            
            reader = command.ExecuteReader();

            conn.Close();
            Response.Redirect("resepsenist_admin.aspx");
        }

        private void checkcount()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String countapp = "select * from appointment_info where d_name=@dname and d_department=@dep";
            command = new SqlCommand(countapp, conn);
            command.Parameters.AddWithValue("@dname", Session["resdocname"]);
            command.Parameters.AddWithValue("@dep", Session["resdepname"]);
            reader = command.ExecuteReader();
            while (reader.Read())
            {
                i++;
            }
          //  errormsg.Text = "" + i;
            
            if (i >= 5) 
            {
                Session["full"] = true;
                Response.Redirect("resepsenist_admin.aspx");
            } 
        
            conn.Close();
        }

        public String randomnumber()
        {
            Random rnd = new Random();
            id = rnd.Next(1, 150).ToString();
            String select = "select * from appointment_info";
            command = new SqlCommand(select, conn);
            SqlDataAdapter adapternumber = new SqlDataAdapter(command);
            DataSet datanumber = new DataSet();
            adapternumber.Fill(datanumber, "d_info");
            foreach (DataRow row in datanumber.Tables["d_info"].Rows)
            {
                String did = (String)row["app_id"];
                if (did != id)
                {
                    rid = id;
                    //  succ = false;
                    break;
                }
            }
            if (rid == null) 
            {
                rid = id;
            }
            return rid;
        }


    }
}