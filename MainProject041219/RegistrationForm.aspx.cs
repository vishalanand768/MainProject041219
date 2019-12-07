using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MainProject041219
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["xyz"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               get_ddlcountry();
               get_ddlSecurityQuestion();
               gridview();
            }
        }

        public void clear() 
        {
            txtfname.Text = "";
            txtlname.Text = "";
            rblgen.ClearSelection();
            txtemail.Text = "";
            txtpass.Text = "";
            ddlcountry.SelectedValue = "0";
            ddlsec.SelectedValue = "0";
            txtanswer.Text = "";
            gridview();
        }

        public void get_ddlcountry() 
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_CountryBind", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            ddlcountry.DataValueField = "cid";
            ddlcountry.DataValueField = "cname";
            ddlcountry.DataSource = dt;
            ddlcountry.DataBind();

            ddlcountry.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void get_ddlSecurityQuestion() 
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_ddlSecurityQuestion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            ddlsec.DataValueField = "SQid";
            ddlsec.DataValueField = "SQname";
            ddlsec.DataSource = dt;
            ddlsec.DataBind();

            ddlsec.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void gridview()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UserDisplay", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();

            grd.DataSource = dt;
            grd.DataBind();
        }

        protected void btnreg_Click(object sender, EventArgs e)
        {
            if (btnreg.Text == "Register")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_Users_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@First_Name", txtfname.Text);
                cmd.Parameters.AddWithValue("@Last_Name", txtlname.Text);
                cmd.Parameters.AddWithValue("@Gender", rblgen.SelectedValue);
                cmd.Parameters.AddWithValue("@EmailId", txtemail.Text);
                cmd.Parameters.AddWithValue("@Password", txtpass.Text);
                cmd.Parameters.AddWithValue("@Country", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@Security_Question", ddlsec.SelectedValue);
                cmd.Parameters.AddWithValue("@Answer", txtanswer.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                gridview();
                clear();
            }

            else if (btnreg.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", ViewState["PP"]);
                cmd.Parameters.AddWithValue("@First_Name", txtfname.Text);
                cmd.Parameters.AddWithValue("@Last_Name", txtlname.Text);
                cmd.Parameters.AddWithValue("@Gender", rblgen.SelectedValue);
                cmd.Parameters.AddWithValue("@EmailId", txtemail.Text);
                cmd.Parameters.AddWithValue("@Password", txtpass.Text);
                cmd.Parameters.AddWithValue("@Country", ddlcountry.SelectedValue);
                cmd.Parameters.AddWithValue("@Security_Question", ddlsec.SelectedValue);
                cmd.Parameters.AddWithValue("@Answer", txtanswer.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                btnreg.Text = "Register";
                gridview();
                clear();
            }
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A") 
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                gridview();
            }

            else if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("usp_edit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserID", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();

                txtfname.Text = dt.Rows[0]["First_Name"].ToString();
                txtlname.Text = dt.Rows[0]["Last_Name"].ToString();
                rblgen.SelectedValue = dt.Rows[0]["Gender"].ToString();
                txtemail.Text = dt.Rows[0]["EmailId"].ToString();
                txtpass.Text = dt.Rows[0]["Password"].ToString();
                ddlcountry.SelectedValue = dt.Rows[0]["Country"].ToString();
                ddlsec.SelectedValue = dt.Rows[0]["Security_Question"].ToString();
                txtanswer.Text = dt.Rows[0]["Answer"].ToString();
                btnreg.Text = "Update";
                ViewState["PP"] = e.CommandArgument;

            }
        }
    }
}