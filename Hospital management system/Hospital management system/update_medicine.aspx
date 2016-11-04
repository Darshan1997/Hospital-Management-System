<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update_medicine.aspx.cs" Inherits="Hospital_management_system.update_medicine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
         <asp:Label ID="error" runat="server" Text="Label"></asp:Label>

               

      <asp:Panel runat="server" ID="panel" ScrollBars="Auto">
          
                <h2>Medicine Details</h2>
<br />
          <br />
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <table border="0" style="width:100%;margin-top:-24px;">


              <tr>
                  <td>
              <div class="form-group">
                    <label style="margin-top:8px;" class="col-sm-3 control-label">Medicine ID</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="mid" runat="server" placeholder="Medicine ID" ReadOnly="true"  class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
                  <!--  for dontact details -->

                  <td>     
              <div class="form-group">
                    <label  style="" class="col-sm-3 control-label">Medicine Name</label>
                    <div   style="margin-top:0px;"  class="col-sm-9">
                        <asp:Textbox  id="mname"  runat="server" placeholder="Medicine Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>

                </tr>
             
              
              <tr>
                  <td>            
                            
                      <div class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Company Name</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="cname"  runat="server" placeholder="Company Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>

                  <td>
                   <div  class="form-group">
                    <label style="margin-top:8px;" class="control-label col-sm-3">Seller Name</label>
                     <div style="margin-top:8px;" class="col-sm-9"   >
                         <asp:Textbox  id="sname"  runat="server" placeholder="Seller Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>

                  </td>
              </tr>

              <tr>
                  <td>       
                      <div class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Date</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
    
                        <asp:Textbox  id="mdate"   runat="server" placeholder="Date" class="form-control" autofocus></asp:Textbox>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="mdate" Format="yyyy-mm-dd" />
                  
                   </div>
                </div>

                  </td>
                  <td>
              <div class="form-group">
                    <label for="type" style="margin-top:8px;;" class="col-sm-3 control-label">Quantity</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                          <asp:Textbox  id="qun" TextMode="Number"  runat="server" placeholder="Quantity Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>

                  </td>
                    </tr>

              <tr>
                  
                  <td>
                      <div class="form-group">
                    <label for="type" style="margin-top:8px;" class="col-sm-3 control-label">Amount</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                          <asp:Textbox  id="amount"  runat="server" placeholder="Amount" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>       
                  </td>
                  <td>
                      <div class="form-group">
                    <label for="type" style="margin-top:8px;" class="col-sm-3 control-label">Expire Date</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                          <asp:Textbox  id="edate"   runat="server" placeholder="Expire Date" class="form-control" autofocus></asp:Textbox>
                             <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="edate" Format="yyyy-mm-dd" />
                    </div>
                </div>
                  </td>
              </tr>

          </table>
          <br />

          <div class="row">
          <asp:Button runat="server"  style="margin-left:80px;"   OnClick="updatemedicine_Click" ID="updatemedicine" Text="Add Medicine"/>
          </div>
      
      </asp:Panel>



    </div>
    </form>
</body>
</html>
