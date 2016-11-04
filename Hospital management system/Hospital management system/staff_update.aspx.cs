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
    public partial class staff_update : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        String d_id, mode, calldata, connstr, id, s, ddid;
           
        protected void Page_Load(object sender, EventArgs e)
        {
            d_id = Request.QueryString["staff_id"];
            if (Session["on"] == null)
            {
                Session["docid"] = d_id;
                ddid = Session["docid"].ToString();
                Session["on"] = true;
            }

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            filldep(); //fill dropdown menu
            insertintofield();

            conn.Close();
        }


        private void insertintofield()
        {
            calldata = "select * from staff_info where staff_id='" + ddid + "'";
            command = new SqlCommand(calldata, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "up");
            foreach (DataRow row in data.Tables["up"].Rows)
            {
                staff_mem_id.Text = row["staff_id"].ToString();
                firstName11.Text = row["s_name"].ToString();
                cat.Text = row["s_category"].ToString();
                bdate.Text = row["s_dob"].ToString();
                country.Text = row["country"].ToString();
                s_status.Text = row["s_status"].ToString();
                blood_group.Text = row["s_bloodgroup"].ToString();
                address.InnerText = row["s_address"].ToString();
                contactno.Text = row["s_contactno"].ToString();
                email.Text = row["s_email"].ToString();
                DropDownList1.Text = row["s_department"].ToString();
                jdate.Text = row["s_joiningdate"].ToString();
                ddate.Text = row["s_designationdate"].ToString();
                qulification.Text = row["s_qualification"].ToString();


                String gender = row["s_gender"].ToString();
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

        private void filldep()
        {
            String selectdep = "select department from department_info";
            SqlCommand cmd = new SqlCommand(selectdep, conn);
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet dd = new DataSet();
            ada.Fill(dd, "depmenu");
            foreach (DataRow row in dd.Tables["depmenu"].Rows)
            {
                String dname = (String)row["department"];
                DropDownList1.Items.Add(dname);
            }

        }


        protected void submit_Click(object sender, EventArgs e)
        {

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            // String updatetext = "update doctor_info set d_name=@firstname " + " where d_id='" + d_id + "'";
            String updatetext = "update staff_info set  s_name=@name,s_gender=@gender,s_address=@address,s_dob=@bdate,s_bloodgroup=@bloodgroup,s_contactno=@contactno,s_email=@email,s_qualification=@qualification,s_department=@department,s_joiningdate=@jdate,s_designationdate=@ddate,s_status=@status,s_category=@catagory,country=@country   where staff_id='"+d_id +"'";

        //    String updatetext = "update staff_info set  s_name='hello' where staff_if='" + d_id + "'";    

            command = new SqlCommand(updatetext, conn);

            command.Parameters.AddWithValue("@name", firstName11.Text);
            command.Parameters.AddWithValue("@catagory", cat.Text);
            command.Parameters.AddWithValue("@bdate", bdate.Text);
            command.Parameters.AddWithValue("@country", country.Text);
            command.Parameters.AddWithValue("@contactno", contactno.Text);
            command.Parameters.AddWithValue("@department", DropDownList1.Text);
            command.Parameters.AddWithValue("@address", address.InnerText);
            command.Parameters.AddWithValue("@qualification", qulification.Text);
            command.Parameters.AddWithValue("@jdate", jdate.Text);
            command.Parameters.AddWithValue("@ddate", ddate.Text);
            command.Parameters.AddWithValue("@email", email.Text);
            command.Parameters.AddWithValue("@bloodgroup", blood_group.Text);
            command.Parameters.AddWithValue("@status", s_status.Text);

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

            Response.Redirect("staff_admin.aspx");

            conn.Close();
        }   

    }
}