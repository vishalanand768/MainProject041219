<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="MainProject041219.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
       <link rel="stylesheet" src ="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css" />
       

 <%--   <script type ="text/javascript">
        function validation() {
            var dabba = "";
            dabba += checkfname();
            dabba += checklname();
            dabba += checkemail();
            dabba += checkpassword();
            dabba += checkanswer();

            if (dabba == "") {
                return true;
            }
            else {
                alert(dabba);
                return false;
            }
        }
        function checkfname() {
            var TB = document.getElementById('txtfname');
            if (TB.value == "") {
                return 'Plz Enter your first name !!\n';
            }

            else {
                return "";
            }
        }
        function checklname() {
            var Tb = document.getElementById('txtlname');
            if (Tb.value == "") {
                return 'Plz Enter your Last name!!\n';
            }
            else {
                return "";
            }
        }

        function checkemail() {
            var Tb = document.getElementById('txtlemail');
            if (Tb.value == "") {
                return 'Plz Enter your email id!!\n';
            }
            else {
                return "";
            }
        }

        function checkpassword() {
            var Tb = document.getElementById('txtpass');
            if (Tb.value == "") {
                return 'Plz Enter your password!!\n';
            }
            else {
                return "";
            }
        }

        function checkanswer() {
            var Tb = document.getElementById('txtlname');
            if (Tb.value == "") {
                return 'Plz give the answer first!!\n';
            }
            else {
                return "";
            }
        }
    </script>--%>

    <table>
        <tr>
            <td>First Name :</td>
            <td><asp:TextBox ID="txtfname" runat="server"></asp:TextBox></td>         
        </tr>

         <tr>
            <td>Last Name :</td>
            <td><asp:TextBox ID="txtlname" runat="server"></asp:TextBox></td>
        </tr>

         <tr>
            <td>Gender :</td>
            <td><asp:RadioButtonList ID="rblgen" runat="server" RepeatColumns="3" AutoPostBack="false">
                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>

         <tr>
            <td>Email Id :</td>
            <td><asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox></td>
        </tr>

         <tr>
            <td>Password :</td>
            <td><asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>

         <tr>
            <td>Country :</td>
           <td><asp:DropDownList ID="ddlcountry" runat="server"></asp:DropDownList></td> 
        </tr>

         <tr>
            <td>Security Question :</td>
            <td><asp:DropDownList ID="ddlsec" runat="server"></asp:DropDownList></td> 
             </tr>

        <tr>
            <td>Answer :</td>
            <td><asp:TextBox ID="txtanswer" runat="server"></asp:TextBox></td> 
        </tr>

         <tr>
            <td></td>
            <td> <asp:Button ID="btnreg" runat="server" Text="Register" OnClientClick="return validation()" OnClick="btnreg_Click" ></asp:Button></td> 
        </tr>

           <tr>
            <td></td>
            <td> <asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <%#Eval("First_Name") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <%#Eval("Last_Name") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <%#Eval("Gender").ToString()=="1" ? "male" :Eval("gender").ToString()=="2" ? "female" : "others"  %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email Id">
                        <ItemTemplate>
                            <%#Eval("EmailId") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <%#Eval("Country") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Security Question">
                        <ItemTemplate>
                            <%#Eval("Security_Question") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Answer">
                        <ItemTemplate>
                            <%#Eval("Answer") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                           <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="A" CommandArgument='<%#Eval("UserID") %>' />
                           <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="B" CommandArgument='<%#Eval("UserID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />

                 </asp:GridView></td> 
        </tr>

    </table>
</asp:Content>

