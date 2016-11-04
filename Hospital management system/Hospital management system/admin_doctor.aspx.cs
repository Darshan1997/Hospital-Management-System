using System;
using System.Collections.Generic;
using System.Configuration;
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
    public partial class admin_doctor : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        int i = 0;
        Literal lit = new Literal();
        StringBuilder str = new StringBuilder();
        String connstr,selectdoctor,id,rid;
        String update = "update";
        String del = "delete";
        protected void Page_Load(object sender, EventArgs e)
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();


            String selectdep = "select department from department_info";
            command = new SqlCommand(selectdep, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "depmenu");
            foreach (DataRow row in data.Tables["depmenu"].Rows)
            {
                String dname = (String)row["department"];
                departmentsmenu.Items.Add(dname);
            }
            
            
            selectdoctor="select * from doctor_info";
            command = new SqlCommand(selectdoctor, conn);
            reader = command.ExecuteReader();
            str.Append("<div class=\"row\"><div class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
               "<thead>" +
                "<tr  role=\"row\">"+
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Browser: activate to sort column ascending\">Doctor_id</th>"+
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">Doctor name</th>"+
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Engine version: activate to sort column ascending\">Doctor department</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Doctor category</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">update info</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">Remove Doctor</th>" +
                "<th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"CSS grade: activate to sort column ascending\">more info</th>" +
                "</thead><tbody>");

            while (reader.Read())
            {
                i++;
                str.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                       "<td style=\"border-color:black;\" ID=\"dept_id\"  class=\"sorting_1\">" + reader["d_id"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["d_name"] + "</td>" +
                       "<td style=\"border-color:black;\">" + reader["d_department"] + "</td>" +
                        "<td style=\"border-color:black;\">" + reader["d_category"] + "</td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\"  href=" + "update_doctor.aspx?d_id=" + reader["d_id"] +   ">UPDATE</a></td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "doctor_remove.aspx?d_id=" + reader["d_id"] + ">REMOVE</a></td>" +
                       "<td style=\"border-color:black;\"><a runat=\"server\" ID=\"pop\" href=" + "doctor_info.aspx?d_id=" + reader["d_id"] + ">INFO</a></td>" +
                       "</tr>");
            }
            str.Append("</tbody></table></div></div>");
            lit.Text = str.ToString();
            doctortable.Controls.Add(lit);

            
            
            reader.Close();
            conn.Close();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
            String number = randomnumber();
            String selecteddepartment =(String)departmentsmenu.SelectedValue;


            String text = "insert into doctor_info (d_id,d_name,d_department,d_contact_no,d_address,d_category,d_country,d_gender,d_degree,d_achivments,d_experience,d_email,birthdate)" +
                "values (@number,@firstname,@department,@contactno,@address,@catagory,@country,@gender,@degree,@achivment,@experience,@email,@bdate)";
            command = new SqlCommand(text, conn);
            command.Parameters.AddWithValue("@firstname", firstName11.Text);
            command.Parameters.AddWithValue("@number", number);
            command.Parameters.AddWithValue("@catagory", catagory1.Text);
            command.Parameters.AddWithValue("@bdate", bdate.Text);
            command.Parameters.AddWithValue("@country", country.Text);
            command.Parameters.AddWithValue("@contactno", contact_no1.Text);
            command.Parameters.AddWithValue("@department", selecteddepartment);
            command.Parameters.AddWithValue("@address", address.InnerText);
            command.Parameters.AddWithValue("@degree", degree1.Text);
            command.Parameters.AddWithValue("@achivment", achivments.InnerText);
            command.Parameters.AddWithValue("@experience", experience1.Text);
            command.Parameters.AddWithValue("@email", email123.Text);


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
                Response.Redirect("admin_doctor.aspx");
                reader.Close();
            }
        public String randomnumber()
        {
            Random rnd = new Random();
            id = rnd.Next(1, 150).ToString();
            String select = "select * from doctor_info";
            command = new SqlCommand(select, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "doctor_info");
            foreach (DataRow row in data.Tables["doctor_info"].Rows)
            {
                String did = (String)row["d_id"];
                if (did != id)
                {

                    rid = id;
                  //  succ = false;
                    break;
                }
            }
            return rid;
        }
        protected void add_doctorbtn(object sender, EventArgs e)
        {
           
        }
    }
}