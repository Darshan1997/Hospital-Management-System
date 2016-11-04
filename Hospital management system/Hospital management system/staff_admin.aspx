<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staff_admin.aspx.cs" Inherits="Hospital_management_system.staff_admin" %>

<!DOCTYPE html>

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
  

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->




<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<style type="text/css">
     
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

  <body class="hold-transition skin-blue sidebar-mini">
 <form id="form1" runat="server">

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
          <a href="admin_home.aspx">
            <i class="fa fa-dashboard"></i>
            <span>Department</span>
            
          </a>
        </li>
        <li class="treeview">
          <a href="admin_doctor.aspx">
            <i class="fa fa-files-o"></i>
            <span>Doctors</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-th"></i> <span>Staff</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="report.aspx">
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
        Staff 
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Staff</li>
      </ol>
    </section>
<br />
   


       <asp:LinkButton runat="server"  ID="addstaff"   class ="button button-5 button-5a icon-cart">
      <i style="margin:0px 0px 0px 140px;"  class="fa fa-shopping-cart"></i>  <span>Add a Staff Member</span>
      </asp:LinkButton>

      <asp:PlaceHolder ID="staffplaceholder" runat="server"></asp:PlaceHolder>
      
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popupmodel" PopupControlID="panel" TargetControlID="addstaff"  DropShadow="False" CancelControlID="forclose">
          
      </ajaxToolkit:ModalPopupExtender>
      <asp:Panel runat="server" ID="panel" >
          
          <table border="0" style="width: 100%;margin-top:-70px;">

                <tr>
                    <th  style="width:500px;text-align:center">
                            <h2 style="color:white">Personal Details</h2>
                    </th>
                <th style="width:500px;text-align:center" >
                            <h2 style="color:white">contact Details</h2>
                </th>

                 <th style="width:500px;text-align:center">
                            
                     <h2 style="color:white">department Details</h2>
                </th>
                </tr>

              <tr>
                  <td style="width:50px;">
              <div class="form-group">
                    <label for="firstName" style="margin-top:8px;color:white" class="col-sm-3 control-label"> Name</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="firstName11" style="color:blue;"  runat="server" placeholder="First Name" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
                  <!--  for dontact details -->

                  <td>     
              <div class="form-group">
                    <label  style="color:white" class="col-sm-3 control-label">contactno</label>
                    <div   style="margin-top:0px;"  class="col-sm-9">
                        <asp:Textbox  id="contactno" style="color:blue;"  runat="server" placeholder="contactno" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>

                  <td>
              <div class="form-group">
                    <label  style="margin-top:8px;color:white" class="col-sm-3 control-label"> Department</label>
                  <div style="margin-top:8px;"   class="col-sm-9">
                       <asp:DropDownList id="DropDownList1" runat="server"  style="color:blue;"  class="form-control">  
                       </asp:DropDownList>
                  </div>
                </div>  
                  </td>
                  
                </tr>

    
              <tr>    
                  <td>
        <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;color:white" class="col-sm-3 control-label">Category</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="cat" runat="server" style="color:blue;"   placeholder="Category" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
              <td>
                  <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;color:white" class="col-sm-3 control-label">Email</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="email" runat="server" style="color:blue;"   placeholder="Email" class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
              </td>
                  <td>
                      <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;color:white" class="col-sm-3 control-label">joining date</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="jdate" TextMode="Date" runat="server" style="color:blue;"   placeholder="joning data" class="form-control" autofocus></asp:Textbox>
                    </div>
                      </div>

                  </td>
                  </tr>


              <tr>
                  <td>
                       <div class="form-group">
                    <asp:Label style="margin-top:8px;color:white"  runat="server" class="col-sm-3 control-label">Date of Birth</asp:Label>
                        <div style="margin-top:8px;" class="col-sm-9">
                     <asp:Textbox  id="bdate" runat="server" style="color:blue;"    class="form-control" TextMode="Date"></asp:Textbox>
                    </div>
                </div>
                  </td>

                  <td>

                  </td>
                  <td>
                      <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;color:white" class="col-sm-3 control-label">designation date</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="ddate" TextMode="Date" runat="server" style="color:blue;"   placeholder="designation" class="form-control" autofocus></asp:Textbox>
                    </div>
                      </div>
                  </td>
              </tr>




              <tr>
                  <td>
                                <div class="form-group">
                    <label for="country" style="margin-top:8px;color:white" class="col-sm-3 control-label">Country</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="country" runat="server"  style="color:blue;"  class="form-control">
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
                    <label  style="margin-top:8px;color:white" class="col-sm-3 control-label">qulification</label>
                  <div style="margin-top:8px;"   class="col-sm-9">
                       <asp:DropDownList id="qulification" runat="server"  style="color:blue;"  class="form-control">  
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
                    <label for="country" style="margin-top:8px;color:white" class="col-sm-3 control-label">status</label>
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
                    <label for="country" style="margin-top:8px;color:white" class="col-sm-3 control-label">Blood_group</label>
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
                    <label style="margin-top:8px;color:white" class="control-label col-sm-3">Address</label>
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
                    <label style="margin-top:8px;color:white" class="control-label col-sm-3">Gender</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label style="margin-top:8px;color:white" class="radio-inline">
                                    <asp:RadioButton   style="color:blue;" runat="server"  GroupName="gen"   id="radiof"  value="Female" />female
                                </label>
                            &nbsp;</div>
                            <div class="col-sm-4">
                                <label style="margin-top:8px;color:white" class="radio-inline">
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
          <asp:Button runat="server" class="btn lg ghost" onclick="add_staff"  ID="savestaff" Text="Registration"/>
          </div>
          
          <div class="row">
              <button class="btn lg ghost" runat="server"  id="forclose"  >Close</button>
          </div>
                </asp:panel>
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

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

    
       </form>
</body>
</html>
