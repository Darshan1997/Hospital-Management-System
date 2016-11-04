<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update_patient.aspx.cs" Inherits="Hospital_management_system.update_patient" %>

<!DOCTYPE html>


  <link rel="stylesheet" href="/css/buttonstyle.css">
  <link rel="stylesheet" href="/css/slncss/popupmodel.css">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style type="text/css">


          body 
          {
              background-color:#808080;
          }


    .popupmodel 
       {
             background: rgba(0,0,0,0.85);
            opacity:0.8;
            width:100%;
            height:100%;   
            perspective:1000px;
   
       }

          .row 
          {
          width: 100%;
          position: relative;
          display: inline-block;
          //margin: 10px;
          text-align: center;
           }

    .btn {
        display: inline-block;
        border-radius: 2px;
        border: none;
        height: 45px;
        padding: 0;
        margin-top: 5px;
        margin-bottom: 5px;
    }
    .lg 
    {
        width: 40%;
    }

    .ghost {
        background-color: transparent;
        color: #F07444;
        border: 1px solid #F07444;
        transition: .2s ease;
    }
     .ghost:hover {
    background-color: #F07444;
    color: white;
    
    transition: .2s ease;
  }



        </style>


</head>
<body>
    <form id="form1" runat="server">
    <div>
       
            <asp:Panel runat="server" ID="panel">
          
          <table border="0" style="width:100%;margin-top:-24px;">

                <tr>
                    <th  style="width:500px;text-align:center">
                            <h2>Patient Datails</h2>
                    </th>
                <th style="width:500px;text-align:center" >
                            <h2>contact Details</h2>
                </th>

                </tr>

              <tr>
                  <td>
              <div class="form-group">
                    <label style="margin-top:8px;" class="col-sm-3 control-label">Patient ID</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="pid" style="color:blue;"  runat="server" placeholder="Patient ID" ReadOnly="true"  class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
                  <!--  for dontact details -->

                  <td>     
              <div class="form-group">
                    <label  style="" class="col-sm-3 control-label">contactno</label>
                    <div   style="margin-top:0px;"  class="col-sm-9">
                        <asp:Textbox  id="contactno" style="color:blue;"  runat="server" placeholder="contactno" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>

                </tr>
             
               <tr>   
                   <td style="width:50px;">
              <div class="form-group">
                    <label style="margin-top:8px;" class="col-sm-3 control-label">Patient Name</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="pname" style="color:blue;"  runat="server" placeholder="Patient Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
              <td>
                  <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;" class="col-sm-3 control-label">Email</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="email" runat="server" style="color:blue;"   placeholder="Email" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
              </td>
              </tr>


              <tr>
                  <td>            
                            <div class="form-group">
                    <label for="country" style="margin-top:8px;" class="col-sm-3 control-label">state</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="pstate" runat="server"  style="color:blue;"  class="form-control">
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
                    <label for="country" style="margin-top:8px;" class="col-sm-3 control-label">city</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="pcity" runat="server"  style="color:blue;"  class="form-control">
                             <asp:ListItem>INDIA</asp:ListItem>
                         <asp:ListItem>NEW YORK</asp:ListItem>
                             <asp:ListItem>UK</asp:ListItem>
                         <asp:ListItem>GERMANY</asp:ListItem>
                             <asp:ListItem>LONDON</asp:ListItem>
                         </asp:DropDownList>
                    </div>
                </div>

                  </td>
              </tr>

              <tr>
                  <td>
              <div class="form-group">
                    <label for="type" style="margin-top:8px;;" class="col-sm-3 control-label">type</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="type" runat="server"  style="color:blue;"  class="form-control">
                             <asp:ListItem>IN PATIENT</asp:ListItem>
                         <asp:ListItem>OUT PATIENT</asp:ListItem>
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
                              <asp:DropDownList id="s_status" runat="server"  style="color:blue;"  class="form-control">
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
                              <asp:DropDownList id="blood_group" runat="server"  style="color:blue;"  class="form-control">
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
                    <asp:Label  runat="server" style="margin-top:8px;" class="col-sm-3 control-label">Age</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="age" runat="server" style="color:blue;"   placeholder="age" TextMode="Number"  class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
              </tr>


              <tr>
                  <td>
                   <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;" class="col-sm-3 control-label">CheckIN date</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="jdate"  runat="server" style="color:blue;"   placeholder="joning data" class="form-control" autofocus></asp:Textbox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="jdate" Format="yyyy-mm-dd" />
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
                                    <asp:RadioButton   style="color:blue;" runat="server"  GroupName="gen"   id="radiof"  value="Female" />female
                                </label>
                            &nbsp;</div>
                            <div class="col-sm-4">
                                <label style="margin-top:8px;" class="radio-inline">
                                    <asp:RadioButton style="color:blue;"     id="radio"  runat="server"  GroupName="gen"  value="Male" />Male
                                </label>
                            &nbsp;</div>
                           
                        </div>
                    </div>
             
                 </div>

                  </td>
              </tr>


          </table>
          <div class="row">
          <asp:Button runat="server"     OnClick="Registra_patient_Click" ID="Registra_patient" Text="Registration"/>
          </div>
          
          <div class="row">
              <asp:Button  runat="server"   OnClick="closeupdate_Click"   id="closeupdate" Text="Close" />
          </div>
             </asp:Panel>
          
    </div>
    </form>
</body>
</html>
