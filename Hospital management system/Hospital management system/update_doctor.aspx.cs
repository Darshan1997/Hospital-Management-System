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
    public partial class update_doctor : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        String d_id, mode, calldata, connstr, id, s,ddid;
           
        protected void Page_Load(object sender, EventArgs e)
        {
            d_id = Request.QueryString["d_id"];
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
            if (Session["test"] != null) 
            {
                String ss = Session["test"].ToString();
                Label1.Text = ""+ss; 
            }
            conn.Close();    
            
        }

        protected void update_Click(object sender, EventArgs e)
        {
            Session["test"] = fnm.Text;

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

           // String updatetext = "update doctor_info set d_name=@firstname " + " where d_id='" + d_id + "'";
            String updatetext = "update doctor_info set d_name=@firstname,d_department=@department,d_contact_no=@contactno,d_address=@address,d_category=@catagory,d_country=@country,d_gender=@gender,d_degree=@degree,d_achivments=@achivment,d_experience=@experience,d_email=@email,birthdate=@bdate where d_id='"+d_id+"'";

            command = new SqlCommand(updatetext, conn);
            
            //command.Parameters.AddWithValue("@number", d_id);    
            command.Parameters.AddWithValue("@firstname", fnm.Text);
            command.Parameters.AddWithValue("@catagory", catagory1.Text);
            command.Parameters.AddWithValue("@bdate", bdate.Text);
            command.Parameters.AddWithValue("@country", country110.Text);
            command.Parameters.AddWithValue("@department", depmenu.Text);
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

            reader = command.ExecuteReader();

            Session["on"] = null;
            Session["docid"] = null;

            Response.Redirect("admin_doctor.aspx");
            
            conn.Close();

        }

        private void insertintofield()
        {
            calldata = "select * from doctor_info where d_id='" + ddid + "'";
            command = new SqlCommand(calldata, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "up");
            foreach (DataRow row in data.Tables["up"].Rows)
            {
                doc_id.Text = row["d_id"].ToString();
                fnm.Text = row["d_name"].ToString();
                catagory1.Text = row["d_category"].ToString();
                // Label1.Text = row["birthdate"].ToString();
                bdate.Text = row["birthdate"].ToString();
                country110.Text = row["d_country"].ToString();
                contact_no1.Text = row["d_contact_no"].ToString();
                address.InnerText = row["d_address"].ToString();
                degree1.Text = row["d_degree"].ToString();
                achivments.InnerText = row["d_achivments"].ToString();
                experience1.Text = row["d_experience"].ToString();
                email123.Text = row["d_email"].ToString();
                depmenu.Text = row["d_department"].ToString();
                String gender = row["d_gender"].ToString();
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
                depmenu.Items.Add(dname);
            }
            
        }
        
    }
}