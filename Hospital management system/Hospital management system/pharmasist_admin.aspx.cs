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
    public partial class pharmasist_admin : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader,rdr;
        SqlCommand command,cmd;
        String connstr, pidtext, patientname,s;
        int amountsel;
        int ap;
        String medid;
        int amt;
        protected void Page_Load(object sender, EventArgs e)
        {
        
            if (!IsPostBack) 
            {
                initfill();
            }
            
            

            if (IsPostBack)
            {
             
                pname.Items.Clear();
                
                connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
                conn = new SqlConnection(connstr);
                conn.Open();

                String selectpatientname = "select name from patient where pid='"+ pid.Text +"'";
                command = new SqlCommand(selectpatientname, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet data = new DataSet();
                adapter.Fill(data, "db");
                foreach (DataRow row in data.Tables["db"].Rows)
                {
                    patientname = (String)row["name"];
                    pname.Items.Add(patientname);
                }


    

                
                conn.Close();
            }
        }

        private void initfill()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();



            String selectmed = "select pid from patient";
            command = new SqlCommand(selectmed, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data, "med_info");
            foreach (DataRow row in data.Tables["med_info"].Rows)
            {
                String pidmenu = (String)row["pid"];
                pid.Items.Add("" + pidmenu);
            }

            String ss = pid.Text;
            String selectname = "select * from patient where pid='" + ss +"'";
            command = new SqlCommand(selectname, conn);
            SqlDataAdapter adapterpname = new SqlDataAdapter(command);
            DataSet datapname = new DataSet();
            adapterpname.Fill(datapname, "db");
            foreach (DataRow row in datapname.Tables["db"].Rows)
            {
                String namemenu = (String)row["name"];
                pname.Items.Add(namemenu);
            }

            String selectcom = "select company_name,med_name from medicine_info";
            command = new SqlCommand(selectcom, conn);
            SqlDataAdapter adaptercom = new SqlDataAdapter(command);
            DataSet datacom = new DataSet();
            adaptercom.Fill(datacom, "db");
            foreach (DataRow row in datacom.Tables["db"].Rows)
            {
                String menucom = (String)row["company_name"];
                cnamelist.Items.Add(menucom);
            }
            
            String selectmedinfo = "select med_name from medicine_info where company_name='"+ cnamelist.Text +"'";
            command = new SqlCommand(selectmedinfo, conn);
            SqlDataAdapter adaptermedlist = new SqlDataAdapter(command);
            DataSet datamedlist = new DataSet();
            adaptermedlist.Fill(datamedlist, "db");
            foreach (DataRow row in datamedlist.Tables["db"].Rows)
            {
                String menucom = (String)row["med_name"];
                mnamelist.Items.Add(menucom);
            }

            String edate = "select * from medicine_info where company_name='" + cnamelist.Text + "'" + " and med_name='" + mnamelist.Text + "'";
            command = new SqlCommand(edate, conn);
            SqlDataAdapter adapteredate = new SqlDataAdapter(command);
            DataSet dataedate = new DataSet();
            adapteredate.Fill(dataedate, "db1");
            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                var date = row["expiry_date"];
                edate1.Text = "" + date;
            }

            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                var price = row["amount"];
                mprice.Text = "" + price;
            }


            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                var st = row["quantity"];
                stock.Text = "" + st;
            }


            conn.Close();
        }



        protected void cnamelist_SelectedIndexChanged(object sender, EventArgs e)
        {
            mnamelist.Items.Clear();
            String selectmedinfo = "select med_name from medicine_info where company_name='" + cnamelist.Text + "'";
            command = new SqlCommand(selectmedinfo, conn);
            SqlDataAdapter adaptermedlist = new SqlDataAdapter(command);
            DataSet datamedlist = new DataSet();
            adaptermedlist.Fill(datamedlist, "db");

            foreach (DataRow row in datamedlist.Tables["db"].Rows)
            {
                String menucom = (String)row["med_name"];
                mnamelist.Items.Add(menucom);
            }

            
          //  String edate = "select expiry_date,amount,quantity from medicine_info where company_name='" + cnamelist.Text + "'" + " and med_name='" + mnamelist.Text + "'";
            String edate = "select * from medicine_info where company_name='" + cnamelist.Text + "'" + " and med_name='" + mnamelist.Text + "'";

            command = new SqlCommand(edate, conn);
            SqlDataAdapter adapteredate = new SqlDataAdapter(command);
            DataSet dataedate = new DataSet();
            adapteredate.Fill(dataedate, "db1");
            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                var date = row["expiry_date"];
                edate1.Text = "" + date;
            }
            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                var price = row["amount"];
                mprice.Text = "" + price;
            }
            

            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                amt = Int32.Parse(row["quantity"].ToString());
                
            }
            stock.Text = amt.ToString();
            if (amt == 0)
            {
                err.Text = "The stock is over for this medicine of requested company";
                submit.Enabled = false;
                qun.ReadOnly = true;
                amount.ReadOnly = true;
            }
            else 
            {
                err.Text = "";
                submit.Enabled = true;
                qun.ReadOnly = false;
                amount.ReadOnly = false;
            }


        }
        protected void mnamelist_SelectedIndexChanged(object sender, EventArgs e)
        {
            String edate = "select * from medicine_info where company_name='" + cnamelist.Text + "'" + " and med_name='" + mnamelist.Text + "'";
            command = new SqlCommand(edate, conn);
            SqlDataAdapter adapteredate = new SqlDataAdapter(command);
            DataSet dataedate = new DataSet();
            adapteredate.Fill(dataedate, "db1");
            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                var date = row["expiry_date"];
                edate1.Text = "" + date;
            }

            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                var price = row["amount"];
                mprice.Text = "" + price;
            }


            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                amt = Int32.Parse(row["quantity"].ToString());
            }
            stock.Text = amt.ToString();
            if (amt == 0)
            {
                err.Text = "The stock is over for this medicine";
                submit.Enabled = false;
                qun.ReadOnly = true;
                amount.ReadOnly = true;
            }
            else
            {
                err.Text = "";
                submit.Enabled = true;
                qun.ReadOnly = false;
                amount.ReadOnly = false;
            }


        }
    

        protected void submit_Click(object sender, EventArgs e)
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String formid="select med_id,quantity from medicine_info where company_name='" + cnamelist.Text + "'" + " and med_name='" + mnamelist.Text + "'";

            command =  new SqlCommand(formid,conn);
            SqlDataAdapter adapteredate = new SqlDataAdapter(command);
            DataSet dataedate = new DataSet();
            adapteredate.Fill(dataedate, "db1");
            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
                 medid = row["med_id"].ToString();
                 amt = Int32.Parse(row["quantity"].ToString());
            }


            int n = Int32.Parse(qun.Text);

           
           // else
            //{
                //err.Text = "";
              //  submit.Enabled = true;
            //}

                int number = amt - n;
                Session["number"] = number;
                String insertdata = "insert into madicine (med_id,pid,quntity,amount,date) values(@mid,@pid,@qun,@amount,@date)";
                String update = "update medicine_info set quantity=@number where med_id='" + medid + "'";
                command = new SqlCommand(insertdata, conn);
                cmd = new SqlCommand(update, conn);
                command.Parameters.AddWithValue("@mid", medid);
                command.Parameters.AddWithValue("@pid", pid.Text);
                command.Parameters.AddWithValue("@qun", qun.Text);
                command.Parameters.AddWithValue("@amount", amount.Text);
                command.Parameters.AddWithValue("@date", mdate.Text);
                cmd.Parameters.AddWithValue("@number", number);
                reader = command.ExecuteReader();
                reader.Close();
                rdr = cmd.ExecuteReader();
                Response.Redirect("pharmasist_admin.aspx"); 
          
        
            conn.Close();
        
        }

        protected void qun_TextChanged(object sender, EventArgs e)
        {

            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String formid = "select quantity from medicine_info where company_name='" + cnamelist.Text + "'" + " and med_name='" + mnamelist.Text + "'";

            command = new SqlCommand(formid, conn);
            SqlDataAdapter adapteredate = new SqlDataAdapter(command);
            DataSet dataedate = new DataSet();
            adapteredate.Fill(dataedate, "db1");
            foreach (DataRow row in dataedate.Tables["db1"].Rows)
            {
               amt = Int32.Parse(row["quantity"].ToString());
            }

            if (!(String.IsNullOrEmpty(qun.Text)))
            {
                int n = Int32.Parse(qun.Text);
                if (n > amt)
                {
                    err.Text = "The stock is not sufficient for  this medicine .....";
                    submit.Enabled = false;
                }
                else
                {
                    err.Text = "";
                    submit.Enabled = true;
                }
            }

        
            if(!(String.IsNullOrEmpty(qun.Text)))
            {
               float  p=float.Parse((mprice.Text).ToString());
               int noqun = Int32.Parse(qun.Text);
               amount.Text = (p * noqun).ToString();
            }
        }
}
}