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
    public partial class add_department : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand command,seldepcmd;
        SqlDataReader reader;
        String dbconn,connstr;
        bool succ;
        int i=0;
       StringBuilder str = new StringBuilder();
       Literal lit = new Literal();
       String s = "",id,department;
        protected void Page_Load(object sender, EventArgs e)
        
        {
            pp.Visible = false;

            if (Session["textdep"] != null) 
            {
                adddeplabel.Text = "Add Doctor For " + Session["textdep"] + "  Department";
            }

            if (Session["depexist"] != null)
            {
                errormsg.Text = "this department is already exist.....";
            }
            else 
            {
                errormsg.Text = "";
            
            }

            if (Session["depadded"]==null) 
            {
                adddeplabel.Visible = false;
                add_doctor.Visible = false;
                ddata.Visible = false;
                Panel1.Visible = false;
                docava.Visible = false;
            }

            else 
            {
                adddeplabel.Visible = true;
                add_doctor.Visible = true;
                ddata.Visible = true;
                Panel1.Visible = true;
                docava.Visible = true;
            }
          //  try
        //    {
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();
                command = new SqlCommand();
               // String countdata = "select count (*) from doctor_info where department='" + Session["department"] + "'";
                String selectdata = "select * from doctor_info where d_department='" + Session["department"] + "'";
                command.Connection = conn;
                command.CommandText = selectdata;
              //  int count = (int)command.ExecuteScalar();
                reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    pp.Visible = true;
                    str.Append("<div class=\"row\"><div style=\"max-width:800px;\" class=\"col-sm-12\"><table style=\"border-color:black;\" id=\"example2\" class=\"table table-bordered table-hover dataTable\" role=\"grid\" aria-describedby=\"example2_info\">" +
             "<thead>" +
              "<tr  role=\"row\"><th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Browser: activate to sort column ascending\">id</th><th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Platform(s): activate to sort column ascending\">doctor name</th><th style=\"border-color:black;\" class=\"sorting\" tabindex=\"0\" aria-controls=\"example2\" rowspan=\"1\" colspan=\"1\" aria-label=\"Engine version: activate to sort column ascending\">category</th>" +
              "</thead><tbody>");

                    while (reader.Read())
                    {
                        i++;
                        str.Append("<tr style=\"border-color:black;\" role=\"row\" class=\"even\">" +
                               "<td style=\"border-color:black;\" class=\"sorting_1\">" + reader["d_id"] + "</td>" +
                               "<td style=\"border-color:black;\">" + reader["d_name"] + "</td>" +
                               "<td style=\"border-color:black;\">" + reader["d_category"] + "</td>" +
                             "</tr>");
                    }

                    str.Append("</tbody></table></div></div>");

                    lit.Text = str.ToString();
                    ddata.Controls.Add(lit);


                }
                else
                {
                    docava.Text = "No doctor Is Avilable for"+ Session["textdep"]  +" department";
                }

                conn.Close();  
        }       
        

        protected void adddep_Click(object sender, EventArgs e)
        {

            department = departmentname.Text;
            Session["department"] = departmentname.Text;
            Session["justname"] = departmentname.Text;
            //Session["depdes"] = dep_description.Text;
            Session["justdes"] = dep_description.Text;
            try
            {
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();
                String adddepartment = "insert into department_info (department,description) values (@depname,@depdes)";
               // String selectdep = "select department from department_info";
                command = new SqlCommand(adddepartment, conn);
                //seldepcmd = new SqlCommand(selectdep, conn);
                command.Parameters.AddWithValue("@depname", departmentname.Text);
                command.Parameters.AddWithValue("@depdes", dep_description.Text);

                
                String selectdep = "select department from department_info";
                seldepcmd = new SqlCommand(selectdep, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(seldepcmd);
                DataSet data = new DataSet();
                adapter.Fill(data, "dep");
                foreach (DataRow row in data.Tables["dep"].Rows)
                {
                    String depava = (String)row["department"];
                    if (depava.Equals(departmentname.Text))
                    {
                        Session["depexist"] = true;
                        Response.Redirect("add_department.aspx");
                    }
                }

                reader = command.ExecuteReader();
                Session["depadded"] = true;
                Session["depexist"] = null;
                reader.Close();
                conn.Close();

                Session["textdep"] = departmentname.Text;
                
                Response.Redirect("add_department.aspx");      
            }

            catch(Exception ex){}
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();


            String ddp = (String)Session["justname"];
            String number = randomnumber();
            String text = "insert into doctor_info (d_id,d_name,d_department,d_contact_no,d_address,d_category,d_country,d_gender,d_degree,d_achivments,d_experience,d_email,birthdate)" +
                "values (@number,@firstname,@department,@contactno,@address,@catagory,@country,@gender,@degree,@achivment,@experience,@email,@bdate)";
            command = new SqlCommand(text, conn);
            command.Parameters.AddWithValue("@firstname", firstName11.Text);
            command.Parameters.AddWithValue("@number", number);
            command.Parameters.AddWithValue("@catagory", catagory1.Text);
            command.Parameters.AddWithValue("@bdate", bdate.Text);
            command.Parameters.AddWithValue("@country", country.Text);
            command.Parameters.AddWithValue("@department", ddp);
            command.Parameters.AddWithValue("@contactno", contact_no1.Text);
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
                Response.Redirect("add_department.aspx");
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
                        succ = false;
                        break;
                    }
                }
            return id;
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Session["textdep"] = null;
            Session["depadded"] = null;
            Response.Redirect("admin_home.aspx");
        }
      }
}