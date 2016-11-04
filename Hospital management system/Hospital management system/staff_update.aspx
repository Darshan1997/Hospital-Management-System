<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staff_update.aspx.cs" Inherits="Hospital_management_system.staff_update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <div   class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Staff Member Id</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="staff_mem_id" runat="server"  placeholder=" Staff Member id" class="form-control" autofocus ReadOnly="True"></asp:Textbox>
                    </div>
                </div>

        <br />

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 
          <table border="0" style="width: 100%;margin-top:-70px;">

                <tr>
                    <th  style="width:500px;text-align:center">
                            <h2 >Personal Details</h2>
                    </th>
                <th style="width:500px;text-align:center" >
                            <h2 >contact Details</h2>
                </th>

                 <th style="width:500px;text-align:center">
                            
                     <h2 >department Details</h2>
                </th>
                </tr>

              <tr>
                  <td style="width:50px;">
              <div class="form-group">
                    <label for="firstName" style="margin-top:8px" class="col-sm-3 control-label"> Name</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="firstName11"   runat="server" placeholder="First Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
                  <!--  for dontact details -->

                  <td>     
              <div class="form-group">
                    <label   class="col-sm-3 control-label">contactno</label>
                    <div   style="margin-top:0px;"  class="col-sm-9">
                        <asp:Textbox  id="contactno"   runat="server" placeholder="contactno" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>

                  <td>
              <div class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label"> Department</label>
                  <div style="margin-top:8px;"   class="col-sm-9">
                       <asp:DropDownList id="DropDownList1" runat="server"    class="form-control">  
                       </asp:DropDownList>
                  </div>
                </div>  
                  </td>
                  
                </tr>

    
              <tr>    
                  <td>
        <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;" class="col-sm-3 control-label">Category</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="cat" runat="server"    placeholder="Category" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
              <td>
                  <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;" class="col-sm-3 control-label">Email</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="email" runat="server"    placeholder="Email" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
              </td>
                  <td>
                      <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;" class="col-sm-3 control-label">joining date</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="jdate"  runat="server"    placeholder="joning data" class="form-control" autofocus></asp:Textbox>
                    </div>
                          <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="jdate" Format="yyyy/mm/dd" />
                     
                      </div>

                  </td>
                  </tr>


              <tr>
                  <td>
                       <div class="form-group">
                    <asp:Label style="margin-top:8px;"  runat="server" class="col-sm-3 control-label">Date of Birth</asp:Label>
                        <div style="margin-top:8px;" class="col-sm-9">
                     <asp:Textbox  id="bdate" runat="server"     class="form-control"></asp:Textbox>
                    </div>
                           <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="bdate" Format="yyyy/mm/dd" />
                     
                </div>
                  </td>

                  <td>

                  </td>
                  <td>
                      <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;" class="col-sm-3 control-label">designation date</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="ddate"  runat="server"    placeholder="designation" class="form-control" autofocus></asp:Textbox>
                    </div>
                          <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="ddate" Format="yyyy/mm/dd" />
                     
                      </div>
                  </td>
              </tr>




              <tr>
                  <td>
                                <div class="form-group">
                    <label for="country" style="margin-top:8px;" class="col-sm-3 control-label">Country</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="country" runat="server"    class="form-control">
                             <asp:ListItem>INDIA</asp:ListItem>
                         <asp:ListItem>NEW YORK</asp:ListItem>
                             <asp:ListItem>UK</asp:ListItem>
                         <asp:ListItem>GERMANY</asp:ListItem>
                             <asp:ListItem>LONDON</asp:ListItem>
                         </asp:DropDownList>
                   
                    </div>
                </div>

                  </td>
                  <td>

                  </td>
                  <td>
              <div class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">qulification</label>
                  <div style="margin-top:8px;"   class="col-sm-9">
                       <asp:DropDownList id="qulification" runat="server"    class="form-control">  
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                             <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                             <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                  </div>
                </div>  

                  </td>
              </tr>





              <tr>
                  <td>
              <div class="form-group">
                    <label for="country" style="margin-top:8px;" class="col-sm-3 control-label">status</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="s_status" runat="server"    class="form-control">
                             <asp:ListItem>SINGLE</asp:ListItem>
                         <asp:ListItem>MARRIED</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                </div>

                  </td>
              </tr>





              <tr>
                  <td>

              <div class="form-group">
                    <label for="country" style="margin-top:8px;" class="col-sm-3 control-label">Blood_group</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="blood_group" runat="server"    class="form-control">
                         <asp:ListItem>A+</asp:ListItem>
                         <asp:ListItem>A-</asp:ListItem>
                         <asp:ListItem>B+</asp:ListItem>
                         <asp:ListItem>B-</asp:ListItem>
                         <asp:ListItem>AB+</asp:ListItem>
                         <asp:ListItem>AB-</asp:ListItem>
                         <asp:ListItem>O+</asp:ListItem>
                         <asp:ListItem>O-</asp:ListItem>
                      
                                     </asp:DropDownList>
                    </div>
                </div>

                  </td>
              </tr>



              <tr>
                  <td>
                                    
                    <div  class="form-group">
                    <label style="margin-top:8px;" class="control-label col-sm-3">Address</label>
                     <div style="margin-top:8px;" class="col-sm-9"   >
                     <textarea  id="address"   rows="4" cols="50"  runat="server"   class="form-control"  autofocus>
                     </textarea>
                     </div>
                </div>

                  </td>
              </tr>



              <tr>
                  <td>
                                <div class="form-group">
                    <label style="margin-top:8px;" class="control-label col-sm-3">Gender</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label style="margin-top:8px;" class="radio-inline">
                                    <asp:RadioButton    runat="server"  GroupName="gen"   id="radiof"  value="Female" />female
                                </label>
                            &nbsp;</div>
                            <div class="col-sm-4">
                                <label style="margin-top:8px;" class="radio-inline">
                                    <asp:RadioButton      id="radio"  runat="server"  GroupName="gen"  value="Male" />Male
                                </label>
                            &nbsp;</div>
                           
                        </div>
                    </div>
             
                 </div>
                         </td>
              </tr>


          </table>

         <div class="form-group" style="max-width:500px;"  >
                    <div class="col-sm-9 col-sm-offset-3">
                        <asp:Button runat="server" ID="submit" onclick="submit_Click" Text="Register" class="btn btn-primary btn-block" />
                    </div>
                </div>

    </div>
    </form>
</body>
</html>
