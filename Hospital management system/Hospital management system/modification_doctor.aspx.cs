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
    public partial class modification_doctor : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand command;
        String d_id,mode,calldata,connstr,id,s;
        protected void Page_Load(object sender, EventArgs e)
        {

            

          //  update.Visible = false;
           // fordelete.Visible = false;
            d_id = Request.QueryString["d_id"];
            mode = Request.QueryString["mod"];
           
            
            
            //if (mode == "update") 
            //{
               
              //  update.Visible = true;
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();



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
                
                calldata = "select * from doctor_info where d_id='"+d_id+"'";
                command = new SqlCommand(calldata, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet data = new DataSet();
                    adapter.Fill(data, "up");
                foreach (DataRow row in data.Tables["up"].Rows)
                {
                    doc_id.Text = row["d_id"].ToString();
                    firstName11.Text = row["d_name"].ToString();
                    catagory1.Text = row["d_category"].ToString();
                   // Label1.Text = row["birthdate"].ToString();
                    bdate.Text =row["birthdate"].ToString();
                    country110.Text = row["d_country"].ToString();
                    contact_no1.Text = row["d_contact_no"].ToString();
                    address.InnerText = row["d_address"].ToString();
                    degree1.Text = row["d_degree"].ToString();
                    achivments.InnerText = row["d_achivments"].ToString();
                    experience1.Text = row["d_experience"].ToString();
                    email123.Text = row["d_email"].ToString();
                    Label1.Text=row["d_department"].ToString();
                    depmenu.Text=row["d_department"].ToString();
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

                

                conn.Close();

     
           // }
            /*else if (mode == "remove") 
            {

            }
            else if (mode == "info")
            {

            }*/

        }


        
        protected void update_Click(object sender, EventArgs e) 
        {
     //       update.Visible = true;
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();
            String dep = depmenu.Text;
            String country = country110.Text;
            String val=degree1.Text;
            String updatetext = "update doctor_info set d_id=@number,d_name=@firstname,d_department=@department,d_contact_no=@contactno,d_address=@address,d_category=@catagory,d_country=@country,d_gender=@gender,d_degree=@degree,d_achivments=@achivment,d_experience=@experience,d_email=@email,birthdate=@bdate where d_id=@number";

            command = new SqlCommand(updatetext, conn);
            command.Parameters.AddWithValue("@number", doc_id.Text);    
            command.Parameters.AddWithValue("@firstname", firstName11.Text);
            command.Parameters.AddWithValue("@catagory", catagory1.Text);
            command.Parameters.AddWithValue("@bdate", bdate.Text);
            command.Parameters.AddWithValue("@country", country);
            command.Parameters.AddWithValue("@department",dep);
            command.Parameters.AddWithValue("@contactno", contact_no1.Text);
            command.Parameters.AddWithValue("@address", address.InnerText);
            command.Parameters.AddWithValue("@degree",val);
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
     
        }
    }
}