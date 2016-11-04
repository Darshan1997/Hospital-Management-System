<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_department.aspx.cs" Inherits="Hospital_management_system.add_department" %>

<!DOCTYPE html>
<!-- for popuo maode css-->
<link rel="stylesheet" href="/css/slncss/popupmodel.css">
 <!-- end popup model css-->
<!-- for the tabing in popup model box(add_department.aspx) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- end tabing code in popupmaodel box (add_department.aspx)-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 184px;
        }
        .popupmodel 
       {
            background-color:#7d7070;
            filter:alpha(opacity=90);
            opacity:0.6;
       }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table >
            <tr>
                <td  class="auto-style1"><h4>department name *</h4></td>
                <td style="margin-left: 80px">
                    <asp:TextBox ID="departmentname" Style="margin-top:18px;" runat="server" Width="168px" class="form-control" autofocus ></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td></td>
                <td>
                    <asp:RequiredFieldValidator  ValidationGroup='valGroup1'  style="color:red;font-size:24px;"  ID="dep_name_validation" runat="server" ErrorMessage="Name Can Not Be Null" ControlToValidate="departmentname" Text="Name Can Not Be Null"></asp:RequiredFieldValidator>
                     </td>
            </tr>

            <tr>
                <td class="auto-style1">
                    <br />
                    <h4>department descrption*</h4>
                </td>
                
                <td>
                    <asp:TextBox id="dep_description"   Style="margin-top:18px;width:500px;height:100px;"  cols="10" name="S1" rows="2" runat="server" class="form-control" autofocus  ></asp:TextBox>
                </td>
                
                </tr>
            <tr>
                <td></td>
                <td>
                <asp:RequiredFieldValidator ID="depdesval"  ValidationGroup='valGroup1' runat="server" style="color:red;font-size:24px;" ErrorMessage="Description Can Not Be Null" ControlToValidate="dep_description" Text="Description Can Not Be Null"></asp:RequiredFieldValidator>
                </td>
                   
                <td>&nbsp;</td>
            </tr>

            <asp:Label ID="errormsg" runat="server"></asp:Label>
        </table>

            <asp:Label  runat="server" style="color:red;"  Text=" ( * ) required Field"></asp:Label>
        
                    <div  style="border-bottom-color:darkblue; border-width:100%;margin-top:12px;margin-bottom:12px;" >
                            <hr />
                    </div>
             <table>
                 <tr>
                     <td>
                         <asp:Button ID="adddep" runat="server" style="width:145px;margin-left:15px;"   ValidationGroup='valGroup1'  OnClick="adddep_Click" Text="Add Department"  class="btn btn-primary btn-block"  />
                     </td>
                     <td>
                            <asp:Button ID="back" runat="server" style="width:75px;margin-left:12px;"   OnClick="back_Click" Text="BACK"  class="btn btn-primary btn-block" />
                     </td>
                 </tr>
             </table>
                  <hr style="color:black;"  />
                   <div  style="border-bottom-color:darkblue; border-width:100%;margin-top:12px;margin-bottom:12px;" >
                    </div>
             
        <asp:Label runat="server" ID="adddeplabel" style="color:black;font-size:18px;font-family:David;"  ></asp:Label>
        <br />
          <asp:Button ID="add_doctor" runat="server" Text="Add Doctor"  style="width:112px;margin-left:15px;"   class="btn btn-primary btn-block"   />
        <hr />
                
        <asp:Label ID="docava" runat="server"></asp:Label>
  
  

              <asp:PlaceHolder ID="ddata"  runat="server">
                        <asp:Label ID="pp"  runat="server" Text="List Of Available Doctor" style="color:blueviolet"></asp:Label>
              </asp:PlaceHolder>
    

 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popupmodel" PopupControlID="panel1" TargetControlID="add_doctor" OkControlID="close" DropShadow="False"></ajaxToolkit:ModalPopupExtender>
      <asp:Panel style="height:500px;width:700px;"  class="modal-content"  ID="Panel1" runat="server">
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
                    <label for="firstName" style="margin-top:8px;" class="col-sm-3 control-label">First Name</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="firstName11" runat="server" placeholder="First Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
     <br />
            <div   class="form-group">
                    <label for="lastname" style="margin-top:8px;" class="col-sm-3 control-label">Last Name</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="lastname1" runat="server"  placeholder="Last Name" class="form-control" autofocus ></asp:Textbox>
                    </div>
                </div>
           <br />
                
        
        <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;" class="col-sm-3 control-label">Category</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="catagory1" runat="server"  placeholder="Category" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>        
          
        <br />
                <div class="form-group">
                    <asp:Label style="margin-top:8px;"  runat="server" class="col-sm-3 control-label">Date of Birth</asp:Label>
                        <div style="margin-top:8px;" class="col-sm-9">
                     <asp:Textbox  id="bdate" runat="server"    class="form-control" TextMode="Date"></asp:Textbox>
                    </div>
                </div>
        <br />
              <div class="form-group">
                    <label for="country" style="margin-top:8px;" class="col-sm-3 control-label">Country</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="country" runat="server"   class="form-control">
                             <asp:ListItem>INDIA</asp:ListItem>
                         <asp:ListItem>NEW YORK</asp:ListItem>
                             <asp:ListItem>UK</asp:ListItem>
                         <asp:ListItem>GERMANY</asp:ListItem>
                             <asp:ListItem>LONDON</asp:ListItem>
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
                        <asp:Button runat="server" ID="submit" onclick="submit_Click" Text="Register" class="btn btn-primary btn-block" />
                    </div>
                </div>


      </asp:Panel>            
    
    
    </div>


    </form>
</body>
</html>
