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
    public partial class update_patient : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        String d_id, mode, calldata, connstr, id, s, ddid;
        protected void Page_Load(object sender, EventArgs e)
        {
            d_id = Request.QueryString["pid"];
            if (Session["on"] == null)
            {
                Session["docid"] = d_id;
                ddid = Session["docid"].ToString();
                Session["on"] = true;
            }
            
            filldatafield();
        }

        private void filldatafield()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
            calldata = "select * from patient where pid='" + ddid + "'";
            command = new SqlCommand(calldata, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "up");
            foreach (DataRow row in data.Tables["up"].Rows)
            {
                pid.Text = row["pid"].ToString();
                pname.Text = row["name"].ToString();
                pstate.Text = row["state"].ToString();
                pcity.Text = row["city"].ToString();
                type.Text = row["type"].ToString();
                address.InnerText = row["address"].ToString();
                s_status.Text ="";
                blood_group.Text = row["blood_group"].ToString();
                age.Text = row["age"].ToString();
                jdate.Text = row["check_in"].ToString();
                contactno.Text = row["contact_no"].ToString();
                email.Text = row["email"].ToString();
                String gender = row["gender"].ToString();
                if (gender == "M")
                {
                    radio.Checked = true;

                }
                else
                {
                    radiof.Checked = true;
                }
            }

        }

        protected void Registra_patient_Click(object sender, EventArgs e)
        {
            
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String updatetext = "update  patient set name=@name,gender=@gender,address=@address,city=@city,state=@state,blood_group=@bloodgroup,contact_no=@contactno,check_in=@checkdate,type=@type,age=@age where pid='" + d_id+  "'"; 
         
          
            command = new SqlCommand(updatetext, conn);
            command.Parameters.AddWithValue("@name", pname.Text);
            command.Parameters.AddWithValue("@number", pid.Text);
            command.Parameters.AddWithValue("@state", pstate.Text);
            command.Parameters.AddWithValue("@city", pcity.Text);
            command.Parameters.AddWithValue("@status", s_status.Text);
            command.Parameters.AddWithValue("@address", address.InnerText);
            command.Parameters.AddWithValue("@contactno", contactno.Text);
            command.Parameters.AddWithValue("@checkdate", jdate.Text);
            command.Parameters.AddWithValue("@email", email.Text);
            command.Parameters.AddWithValue("@bloodgroup", blood_group.Text);
            command.Parameters.AddWithValue("@type", type.Text);
            command.Parameters.AddWithValue("@age", age.Text);
            if (radio.Checked)
            {
                command.Parameters.AddWithValue("@gender", "M");
            }
            else
            {
                command.Parameters.AddWithValue("@gender", "F");
            }

            reader = command.ExecuteReader();

            Session["on"] = null;
            Session["docid"] = null;

            Response.Redirect("rec_patient_registration.aspx");

            conn.Close();
            
        }

        protected void closeupdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("rec_patient_registration.aspx");
        }
    }
}