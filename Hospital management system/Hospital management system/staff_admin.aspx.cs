using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class staff_admin : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        Literal lit = new Literal();
        StringBuilder str = new StringBuilder();
        String connstr, selectdoctor, id, rid;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            filldep();

            selectdoctor = "select * from staff_info";
            command = new SqlCommand(selectdoctor, conn);
            reader = command.ExecuteReader();
            str.Append("<div class=\"row\"><div class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
               "<thead>" +
                "<tr  role=\"row\">" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Browser: activate to sort column ascending\">Staff_id</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">Member name</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Engine version: activate to sort column ascending\">Member department</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">category</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">update info</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Remove Doctor</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">more info</th>" +
                "</thead><tbody>");
            
            while (reader.Read())
            {
                
                str.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                       "<td style=\"border-color:black;\" ID=\"dept_id\"  class=\"sorting_1\">" + reader["staff_id"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["s_name"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["s_department"] + "</td>" +
                        "<td style=\"border-color:black;\">" + reader["s_category"] + "</td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\"  href=" + "staff_update.aspx?staff_id=" + reader["staff_id"] + ">UPDATE</a></td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "staff_delete.aspx?staff_id=" + reader["staff_id"] + ">REMOVE</a></td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "staff_info.aspx?staff_id=" + reader["staff_id"] + ">INFO</a></td>" +
                       "</tr>");
            }
            str.Append("</tbody></table></div></div>");
            lit.Text = str.ToString();
            
                staffplaceholder.Controls.Add(lit);
            
            
            conn.Close();    

        }

        public String randomnumber()
        {
            Random rnd = new Random();
            id = rnd.Next(1, 150).ToString();
            String select = "select * from staff_info";
            command = new SqlCommand(select, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "staff_info");
            foreach (DataRow row in data.Tables["staff_info"].Rows)
            {
                String did = (String)row["staff_id"];
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

        protected void add_staff(object sender, EventArgs e) 
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
            String number = randomnumber();
            
            String text = "insert into staff_info (staff_id,s_name,s_gender,s_address,s_dob,s_bloodgroup,s_contactno,s_email,s_qualification,s_department,s_joiningdate,s_designationdate,s_status,s_category,country)" +
                "values (@number,@name,@gender,@address,@bdate,@bloodgroup,@contactno,@email,@qualification,@department,@jdate,@ddate,@status,@catagory,@country)";
            command = new SqlCommand(text, conn);
            command.Parameters.AddWithValue("@name", firstName11.Text);
            command.Parameters.AddWithValue("@number", number);
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
            SqlDataReader reader = command.ExecuteReader();
            conn.Close();
            Response.Redirect("staff_admin.aspx");
            reader.Close();
        }

    }
}