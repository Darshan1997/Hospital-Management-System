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
    public partial class doctor_module_priscription : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand cmd1;
        Literal lit = new Literal();
        StringBuilder str = new StringBuilder();
        String connstr, genralpid, rid , returnpid,resname,resdoctor,id;
        DataRow dr;
        String[] mednm = new String[100];
        int[] medno = new int[100];
        String[] medtime = new String[100];
        SqlDataReader[] rdrarr;
        int flag;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["doctor"] == null && Session["docmodule"] == null)
            {
                Response.Redirect("loginpage.aspx?msg=false");
            }
            username.Text = Session["username"].ToString();
            usnm.Text = Session["username"].ToString();


            if (ViewState["c"] == null) 
            {
                ViewState["c"] = 0;
                ViewState["mednm"] = null;
                ViewState["medno"] = null;
                ViewState["medtime"] = null;

            }
            if(!IsPostBack)
        
            {
                addlist();
                generateprescriptionlist();

            }
            
            }

        private void generateprescriptionlist()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            DataTable prelist = new DataTable();
            dr = prelist.NewRow();
            prelist.Columns.Add(new DataColumn("PID", typeof(String)));
            prelist.Columns.Add(new DataColumn("Patient Name", typeof(String)));
            prelist.Columns.Add(new DataColumn("Doctor", typeof(String)));
            prelist.Columns.Add(new DataColumn("Date", typeof(String)));
           


            String selectpre = "select *  from patient_medication_relationship";
            SqlCommand cmd = new SqlCommand(selectpre, conn);
            SqlDataAdapter adapre = new SqlDataAdapter(cmd);
            DataSet ddpre = new DataSet();
            adapre.Fill(ddpre, "depmenu");

            
            foreach (DataRow row in ddpre.Tables["depmenu"].Rows)
            {
                String pid = row["pid"].ToString();
                String name = getnamefrompid(pid);
                String doctor = getdocfrompid(pid);
                var date = "11/02/1997";
           


                prelist.Rows.Add(pid,name,doctor,date);

                ViewState["tableprescription"] = prelist;
                prescription.DataSource = prelist;
                prescription.DataBind();
            
            }
            conn.Close();

        }

        


        private string getdocfrompid(string pid)
        {
            String selectpre = "select  name,doctor from patient where pid='" + pid + "'";
            SqlCommand cmd = new SqlCommand(selectpre, conn);
            SqlDataAdapter adapre = new SqlDataAdapter(cmd);
            DataSet ddpre = new DataSet();
            adapre.Fill(ddpre, "depmenu");

            foreach (DataRow row in ddpre.Tables["depmenu"].Rows)
            {
            //    resname = row["name"].ToString();
                resdoctor = row["doctor"].ToString();

            }

            return resdoctor;
        
        }

        private String getnamefrompid(string pid)
        {

            String selectpre = "select  name,doctor from patient where pid='"+ pid +"'";
            SqlCommand cmd = new SqlCommand(selectpre, conn);
            SqlDataAdapter adapre = new SqlDataAdapter(cmd);
            DataSet ddpre = new DataSet();
            adapre.Fill(ddpre, "depmenu");

            foreach (DataRow row in ddpre.Tables["depmenu"].Rows)
            {
                resname = row["name"].ToString();
                //resdoctor = row["doctor"].ToString();
               
            }

            return resname;
        }

        private void addlist()
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            String selectdata = "select pid,name from patient";
            SqlCommand cmd = new SqlCommand(selectdata, conn);
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet dd = new DataSet();
            ada.Fill(dd, "depmenu");
            foreach (DataRow row in dd.Tables["depmenu"].Rows)
            {   
                String pid = (String)row["pid"];
                String pnm = (String)row["name"];
                String final = "" + pnm + "(" + pid + ")";
                pnameid.Items.Add(final);
            }

            String selectmd = "select * from medicine_info";
            SqlCommand cmd1 = new SqlCommand(selectmd, conn);
            SqlDataAdapter ada1 = new SqlDataAdapter(cmd1);
            DataSet dd1 = new DataSet();
            ada1.Fill(dd1, "depmenu1");
            foreach (DataRow row in dd1.Tables["depmenu1"].Rows)
            {

                String mdnm = (String)row["med_name"];
                String mdid = (String)row["med_id"];
                String final1 = "" + mdnm + "(" + mdid + ")";
                medicienelist.Items.Add(final1);
    
            }
            conn.Close();
        }

        protected void createpre_Click(object sender, EventArgs e)
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();

            
       
            genralpid=getpid();
            String insertdata = "update patient set notes=@notes,treatment=@tre where pid=@patientid";
            SqlCommand cmd = new SqlCommand(insertdata, conn);
            cmd.Parameters.AddWithValue("@notes", notes.InnerText);
            cmd.Parameters.AddWithValue("@tre", ptreat.Text);
            cmd.Parameters.AddWithValue("@patientid", genralpid);
            reader = cmd.ExecuteReader();
            reader.Close();

             String getrndno = randomnumber();

             String selectrefid = "select * from patient_medication_relationship";
             SqlCommand command = new SqlCommand(selectrefid, conn);
             SqlDataReader rd3 = command.ExecuteReader();
             
            if (rd3.HasRows)
             {
                 while (rd3.Read())
                 {
                     if (genralpid != (String)rd3["pid"])
                     {
                         flag = 1;
                         break;
                     }
                 }
             }
            else
            {
                flag = 1;
            }
             

             rd3.Close();

             if (flag == 1) 
             {
                 String insertrndno = "insert into patient_medication_relationship (refid,pid) values (@refid,@pid)";
                 SqlCommand command1 = new SqlCommand(insertrndno, conn);
                 command1.Parameters.AddWithValue("@pid", genralpid);
                 command1.Parameters.AddWithValue("@refid", getrndno);
                 SqlDataReader rd1 = command1.ExecuteReader();
                 rd1.Close();
                 flag = 0;
             }
            

            for(int i=0;i<(int)ViewState["c"];i++)
            {
                conn.Close();
                conn.Open();
                String mednmviewstate=ViewState["mednm"+i].ToString();
                int mednoviewstate=Int32.Parse(ViewState["medno"+i].ToString());
                String medtimeviewstate=ViewState["medtime"+i].ToString();

                String insertdatamed = "insert into patient_medication (pid,medicine_name,medicine_no,medicine_time)" +
                    " values (@pid,@mname,@mno,@mtime)";
                cmd1 = new SqlCommand(insertdatamed, conn);
                cmd1.Parameters.AddWithValue("@mname", mednmviewstate);
                cmd1.Parameters.AddWithValue("@mno", mednoviewstate);
                cmd1.Parameters.AddWithValue("@mtime", medtimeviewstate);
                cmd1.Parameters.AddWithValue("@pid", genralpid);

                 SqlDataReader rd2 = cmd1.ExecuteReader();
                rd2.Close();
                //rdrarr[i] = cmd1[i].ExecuteReader();
                //rdrarr[i].Close();
                generateprescriptionlist();

                notes.InnerText = "";
                numberofmedicine.Text = "";

            }
            conn.Close();
            

            int c = (int)ViewState["c"];
            for (int i = 0; i < c; i++)
            {
                ViewState["mednm" + c]=null;
                ViewState["medno" + c]=null;
                ViewState["medtime" + c] = null;
            }

            ViewState["alltable"] = null;
            dd1.DataSource = ViewState["alltable"] as DataTable;
            dd1.DataBind();
            ViewState["c"] = null;
        }

        private String randomnumber()
        {
            Random rnd = new Random();
            id = rnd.Next(1, 150).ToString();
            String select = "select * from patient_medication_relationship";
            SqlCommand  command = new SqlCommand(select, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataSet data = new DataSet();
            adapter.Fill(data,"id");
            foreach (DataRow row in data.Tables["id"].Rows)
            {
                String did = "" + row["pid"];
                if (did != id)
                {
                    rid = id;
                    break;
                }
            }
            if(rid == null)
            {
                rid = id;
            }
            return rid;
        }

        private String getpid()
        {
            String selectdata = "select pid,name from patient";
            SqlCommand cmd = new SqlCommand(selectdata, conn);
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet dd = new DataSet();
            ada.Fill(dd, "depmenu");
            foreach (DataRow row in dd.Tables["depmenu"].Rows)
            {
                String pid = (String)row["pid"];
                String pnm = (String)row["name"];
                String final = "" + pnm + "(" + pid + ")";
                if (final.Equals(pnameid.Text)) 
                {
                    returnpid = pid;
                }
            }
            return returnpid;
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["alltable"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["alltable"] = dt;
            dd1.DataSource = ViewState["alltable"] as DataTable;
            dd1.DataBind();
            ViewState["mednm" + index] = null;
            ViewState["medno" + index] = null;
            ViewState["medtime" + index] = null;
            int temp =(int) ViewState["c"];
            temp--;
            ViewState["c"]=temp;
        }

        protected void forprescription(object sender, GridViewDeleteEventArgs e)
        {
            connstr = WebConfigurationManager.ConnectionStrings["myconn"].ConnectionString;
            conn = new SqlConnection(connstr);
            conn.Open();


            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["tableprescription"] as DataTable;
            DataRow r = dt.Rows[index];
            String idfromcell = (String)r[0];
            dt.Rows[index].Delete();
            ViewState["tableprescription"] = dt;
            prescription.DataSource = ViewState["tableprescription"] as DataTable;
            prescription.DataBind();

            String delete = "delete from patient_medication where pid='" + idfromcell + "'";
            SqlCommand cmd=new SqlCommand(delete,conn);
            SqlDataReader rdr=cmd.ExecuteReader();
            rdr.Close();

            String deletelist = "delete from patient_medication_relationship where pid='" + idfromcell + "'";
            SqlCommand cmddel = new SqlCommand(deletelist, conn);
            SqlDataReader rdrdel = cmddel.ExecuteReader();
            rdrdel.Close();
            conn.Close();

           // ViewState["tableprescription"] = null;

            generateprescriptionlist();
        }

        protected void addmedicine_Click(object sender, EventArgs e)
        {
            int counter = (int)ViewState["c"];
            ViewState["mednm"+counter]  = medicienelist.Text;
            ViewState["medno" + counter] = Int32.Parse((numberofmedicine.Text).ToString());
            ViewState["medtime" + counter] = whentotake.Text;

            counter++;
            ViewState["c"] = counter;

            
           DataTable table = new DataTable();
           dr = table.NewRow();
           table.Columns.Add(new DataColumn("mednm",typeof(String)));
           table.Columns.Add(new DataColumn("medno", typeof(Int32)));
           table.Columns.Add(new DataColumn("medtime", typeof(String)));

    
        
            for (int i = 0; i < counter; i++)
           {
               table.Rows.Add(ViewState["mednm" + i], ViewState["medno" + i], ViewState["medtime" + i]);
           }

            ViewState["alltable"] = table;
           dd1.DataSource = table;
           dd1.DataBind();
                      
        }

        protected void profile_Click(object sender, EventArgs e)
        {

        }

        protected void signout_Click(object sender, EventArgs e)
        {
            Session["doctor"] = null;
            Session["username"] = null;
            Session["docmodule"] = null;
            Response.Redirect("loginpage.aspx");
        }

       

    }
}