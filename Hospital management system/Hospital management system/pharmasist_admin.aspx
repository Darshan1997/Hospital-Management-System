﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pharmasist_admin.aspx.cs" Inherits="Hospital_management_system.pharmasist_admin" %>



  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--for tabbing css-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  end tabing css-->  

<!-- for popuo maode css-->
<link rel="stylesheet" href="/css/slncss/popupmodel.css">
 <!-- end popup model css-->

   <!-- for button style-->
   <link rel="stylesheet" href="/css/buttonstyle.css">
   <!-- end  for button style-->

<!-- for splash popup  animation-->
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap.css">
    <link rel="stylesheet" href="/css/splash.css">
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.7/angular.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.7/angular-animate.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/0.14.3/ui-bootstrap.min.js"></script>
    <script type="text/javascript" src="/css/splash.js"></script>
<!-- end of splash animation-->



  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <link rel="stylesheet" href="/css/buttonstyle.css">
  <link rel="stylesheet" href="/css/slncss/popupmodel.css">
  
<script>
function Calculate()   
      {    
        var q = parseInt(document.getElementById("qun").value); 
        var mp = parseInt(document.getElementById("mprice").value); 
        document.getElementById("amount").value = q * mp;   
      } 
    </script>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
 <form id="form1" runat="server" name="simpleform">

<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>HMS</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b> HMS Admin</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          
         <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
        
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
    
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i>
            <span>General</span>
            
          </a>
        </li>
        <li class="treeview">
          <a href="add_medicine.aspx">
            <i class="fa fa-files-o"></i>
            <span>Add Medicine</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-th"></i> <span>From pricripsion</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>Reports</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
         
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Pharmasist
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Pharmasist</li>
      </ol>
    </section>
<br />
   

      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>
      <br />
              <asp:Label ID="err" runat="server"></asp:Label>
      <br />
      <br /><br />
              <table border="0" style="width:100%;margin-top:-24px;">
              
              <tr>
                  <td>   
                      <div class="form-group">
                    <label style="margin-top:8px;" class="col-sm-3 control-label">PID</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:DropDownList ID="pid" AutoPostBack="true" runat="server"  class="form-control" autofocus >
                        </asp:DropDownList>    
                    </div>
                </div>
                  </td>

                  <td>
                        <div class="form-group">
                    <label style="margin-top:8px;" class="col-sm-3 control-label">Patient Name</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:DropDownList ID="pname" runat="server"  class="form-control" autofocus >
                        </asp:DropDownList>
                    </div>
                </div>
                  </td>
              
              </tr>
              
              
              <tr>
                  <td>              
                      <div class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Company Name</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:DropDownList ID="cnamelist"  OnSelectedIndexChanged="cnamelist_SelectedIndexChanged"  AutoPostBack="true" runat="server"  class="form-control" autofocus >
                        </asp:DropDownList>        
                    </div>
                </div>
                  </td>
                  
                  <!--  for dontact details -->

                  <td>     
              <div class="form-group">
                    <label  style="" class="col-sm-3 control-label">Medicine Name</label>
                    <div   style="margin-top:0px;"  class="col-sm-9">
                        <asp:DropDownList ID="mnamelist" AutoPostBack="true" OnSelectedIndexChanged="mnamelist_SelectedIndexChanged" runat="server"  class="form-control" autofocus >
                        </asp:DropDownList>
                    </div>
                </div>
                  </td>
                  <td>
                        <div class="form-group">
                    <label  style="" class="col-sm-3 control-label">Price</label>
                    <div   style="margin-top:0px;"  class="col-sm-9">        
                          <asp:Textbox  id="mprice"  ReadOnly="true"  runat="server" class="form-control" autofocus></asp:Textbox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="mprice" FilterType="Numbers , Custom" ValidChars="." />
                    </div>
                </div>
                  </td>
                </tr>
              

              <tr>
                  <td>       
                      <div class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Date</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
    
                        <asp:Textbox  id="mdate"  TextMode="Date" runat="server" placeholder="Date" class="form-control" autofocus></asp:Textbox>
                    
                   </div>
                </div>

                  </td>

                  <td>
              <div class="form-group">
                    <label for="type" style="margin-top:8px;;" class="col-sm-3 control-label">Quantity</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                          <asp:Textbox  id="qun" OnTextChanged="qun_TextChanged"   AutoPostBack="true" runat="server" placeholder="Quantity" class="form-control" autofocus></asp:Textbox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="qun" FilterType="Numbers" />
                    </div>
                </div>

                  </td>
                  
                  <td>
                      <div class="form-group">
                    <label for="type" style="margin-top:8px;" class="col-sm-3 control-label">Expire Date</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                          <asp:Textbox  id="edate1"  ReadOnly="true" runat="server" placeholder="Expire Date" class="form-control" autofocus></asp:Textbox>
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
                        <div id="feedbackpassword"></div>
                         </div>
                </div>       
                  </td>

                     <td>
                      <div class="form-group">
                    <label for="type" style="margin-top:8px;" class="col-sm-3 control-label">Stock</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                          <asp:Textbox  id="stock" ReadOnly="true" runat="server" placeholder="stock" class="form-control" autofocus></asp:Textbox>
                         </div>
                </div>       
                  </td>
              </tr>
          
          </table>
      <asp:Button ID="submit" runat="server"  OnClick="submit_Click" Text="submit" />
      
                      
          </ContentTemplate>
          </asp:UpdatePanel>
               
      

  </div>

         <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

    
       </form>
</body>
</html>
