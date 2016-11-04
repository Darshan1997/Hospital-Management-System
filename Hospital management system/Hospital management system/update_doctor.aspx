<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_doctor.aspx.cs" Inherits="Hospital_management_system.update_doctor" %>


<!-- for the tabing in popup model box(add_department.aspx) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- end tabing code in popupmaodel box (add_department.aspx)-->

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
              <asp:Panel style="height:500px;width:700px;"    ID="forupadte" runat="server">
            <div style="margin-top:12px;" class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">General</a></li>
    <li><a data-toggle="tab" href="#menu1">Educational</a></li>
    <li><a data-toggle="tab" href="#menu2">Contact details</a></li>
  </ul>
               
  <div class="tab-content">
    <div id="home" style="max-width: 530px;margin:0px 0px 0px 25px"   class="tab-pane fade in active">
      <h3>General Details</h3>

          <div   class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Doctor Id</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="doc_id" runat="server"  placeholder="doctro id" class="form-control" autofocus ReadOnly="True"></asp:Textbox>
                    </div>
                </div>
     <br />

         <div   class="form-group">
                    <label for="firstName" style="margin-top:8px;" class="col-sm-3 control-label">First Name</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="fnm" runat="server" placeholder="First Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
     <br />
                
        
        <div  class="form-group">
                    <asp:Label   runat="server" style="margin-top:8px;" class="col-sm-3 control-label">Category</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="catagory1" runat="server"  placeholder="Category" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>        
          
        <br />
                <div class="form-group">
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:Label style="margin-top:8px;"  runat="server" class="col-sm-3 control-label">Date of Birth</asp:Label>
                 <div style="margin-top:8px;" class="col-sm-9">
                 <asp:Textbox  id="bdate" runat="server"    class="form-control" ></asp:Textbox>
                 
                     <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="bdate" Format="yyyy/mm/dd" />
                             </div>
                </div>
        <br />
              <div class="form-group">
                    <label for="country" style="margin-top:8px;" class="col-sm-3 control-label">Country</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="country110" runat="server"   class="form-control">
                             <asp:ListItem>INDIA</asp:ListItem>
                         <asp:ListItem>NEW YORK</asp:ListItem>
                             <asp:ListItem>UK</asp:ListItem>
                         <asp:ListItem>GERMANY</asp:ListItem>
                             <asp:ListItem>LONDON</asp:ListItem>
                         </asp:DropDownList>
                   
                    </div>
                </div>


              <div class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Department</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="depmenu" runat="server" class="form-control">
                                </asp:DropDownList>
                   
                    </div>
                </div>


        <br />
                <div class="form-group">
                    <label style="margin-top:8px;" class="control-label col-sm-3">Gender</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label style="margin-top:8px;" class="radio-inline">
                                    <asp:RadioButton   runat="server"  GroupName="gen"   id="radiof"  value="Female" />female
                                </label>
                            &nbsp;</div>
                            <div class="col-sm-4">
                                <label style="margin-top:8px;" class="radio-inline">
                                    <asp:RadioButton     id="radio"  runat="server"  GroupName="gen"  value="Male" />Male
                                </label>
                            &nbsp;</div>
                           
                        </div>
                    </div>
                </div> 
             
    </div>
    <div id="menu1" style="max-width:530px;" class="tab-pane fade">
      <h3>Educational Details</h3>
                <div class="form-group">
                    <asp:Label style="margin-top:8px;" runat="server" class="col-sm-3 control-label">Degree</asp:Label>
                     <div style="margin-top:8px;"  class="col-sm-9">
                    
                          <asp:DropDownList id="degree1" runat="server"   class="form-control">
                             <asp:ListItem>M.B.B.S</asp:ListItem>
                         <asp:ListItem>B.D.S</asp:ListItem>
                             <asp:ListItem>RADIOGRAPHY</asp:ListItem>
                         <asp:ListItem>NUCLEAR MEDICAL TEHCNOLOGY</asp:ListItem>
                             <asp:ListItem>B.D.S</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                </div>
                    <div   class="form-group">
                     <asp:Label for="Achivments" style="margin-top:8px;" runat="server" class="col-sm-3 control-label">Achivments</asp:Label>
                     <div style="margin-top:8px;" class="col-sm-9">
                       
                     <textarea rows="4" cols="50" runat="server"  id="achivments"  placeholder="Achivments" class="form-control"  autofocus>
                     </textarea>
                     </div>
                </div>

    
                 <div class="form-group">
                     <asp:Label  style="margin-top:8px;" runat="server" class="col-sm-3 control-label">Experience(years)</asp:Label>
                     <div style="margin-top:8px;" class="col-sm-9">
                     <asp:TextBox runat="server" id="experience1"   placeholder="Experience" class="form-control"    TextMode="Number" autofocus ></asp:TextBox>
                     </div>
                </div>


    </div>
    <div id="menu2"  style="max-width: 530px;margin:0px 0px 0px 25px"  class="tab-pane fade">
      <h3>Contact Details</h3>
             <div class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;"  class="col-sm-3 control-label">Email</asp:Label>
                    <div  style="margin-top:8px;" class="col-sm-9">
                        <asp:TextBox runat="server" id="email123" placeholder="Email" class="form-control" TextMode="Email"></asp:TextBox>
                    </div>
                </div>

                <div style="margin-top:8px;" class="form-group">
                    <asp:Label style="margin-top:8px;"  runat="server" class="col-sm-3 control-label">contact no.</asp:Label>
                    <div class="col-sm-9">
                        <asp:TextBox id="contact_no1" runat="server" style="margin-top:8px;"  placeholder="phone number" class="form-control" TextMode="Phone"></asp:TextBox>
                    </div>
                </div>
               <div    class="form-group">
                     <asp:Label style="margin-top:8px;" runat="server"  class="col-sm-3 control-label"></asp:Label>Address</>
                     <div style="margin-top:8px;" class="col-sm-9"   >
                     <textarea  id="address"   rows="4" cols="50"  runat="server"   class="form-control"  autofocus>
                     </textarea>
                     </div>
                </div>
             
                </div>

    </div>
</div>
          <br />
         <div class="form-group" style="max-width:500px;"  >
                    <div class="col-sm-9 col-sm-offset-3">
                        <asp:Button runat="server" ID="update" onclick="update_Click" Text="update" class="btn btn-primary btn-block" />
                    </div>
                </div>
                  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

      </asp:Panel>            
    
    </div>
    </form>
</body>
</html>
