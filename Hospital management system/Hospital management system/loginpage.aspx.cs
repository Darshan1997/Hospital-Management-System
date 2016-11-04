using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_system
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        int flag;
        String conform_str, dropdown_str;
        protected void Page_Load(object sender, EventArgs e)
        {
            conform_str = (String)Request.QueryString["msg"];
            if (conform_str == "false")
            {
                error_msg.Text = "please enter detail first!!!!!";
            }  
        }
        protected void submit_btn_Click(Object sender, EventArgs e)
        {
            dropdown_str = selection.SelectedValue;
           

            String usernm = username.Text;
            String passwd = Password.Text;
            String connstring = "Data Source=ABCD;initial catalog=HMS;integrated security=true";

            SqlConnection conn = new SqlConnection(connstring);
            try
            {
                String s = "";
                conn.Open();
                SqlCommand command = new SqlCommand();
                command.Parameters.AddWithValue("@dropdown", dropdown_str);
                String selectdata = "select * from login_admin where type= @dropdown";
                command.Connection = conn;
                command.CommandText = selectdata;

                SqlDataReader reader = command.ExecuteReader();
              
                while (reader.Read())
                {
                    if ((reader["username"].Equals(usernm) && reader["password"].Equals(passwd)))
                    {
                        //if (reader["type"].Equals(conform_str))
                       // {
                            
                            flag = 1;
                            if (dropdown_str == "doctor")
                            {
                                Session["doctor"] = true;
                                Session["username"] = username.Text;
                                Session["password"] = Password.Text;
                                Response.Redirect("doctor_module.aspx");
                            }
                            else if(dropdown_str=="staff")
                            {
                                Session["staff"] = true;
                                Session["username"] = username.Text;
                                Session["password"] = Password.Text;
                                Response.Redirect("staff_admin.aspx");
                            }
                            else if (dropdown_str == "admin")
                            {
                                Session["admin"] = true;
                                Session["username"] = username.Text;
                                Session["password"] = Password.Text;
                                Response.Redirect("admin_home.aspx");
                            }
                            break;
                        //}
                    }
                    else
                    {
                        continue;
                    }
                }
                
                 if (flag != 1)
                 {
                     error_msg.Text = "Invalid Username or Password";     
                 }

            }
            catch (Exception ex)
            {
                //throw ex;
            }
        }
    }
    
}