<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_doctor.aspx.cs" Inherits="Hospital_management_system.admin_doctor" %>

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
           background-color:#7d7070;
            filter:alpha(opacity=90);
            opacity:0.7;
        
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
          <a href="#">
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
        Doctor  
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Doctor</li>
      </ol>
    </section>
<br />
   

        <asp:LinkButton runat="server" OnClick="add_doctorbtn" ID="adddocbtn" class ="button button-5 button-5a icon-cart">
      <i style="margin:0px 0px 0px 140px;"  class="fa fa-shopping-cart"></i>  <span>Add a Doctor</span>
      </asp:LinkButton>
      
      
 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popupmodel" PopupControlID="panel1" TargetControlID="adddocbtn" OkControlID="close" DropShadow="False" CancelControlID="closepopup"></ajaxToolkit:ModalPopupExtender>
      <asp:Panel style="height:500px;width:700px;"  class="modal-content"  ID="Panel1" runat="server">
            <asp:Button  style="background-color:transparent;border:none;"  class="close" runat="server" id="closepopup" text="CLOSE"   data-dismiss="modal" />
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


              <div class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Department</label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                              <asp:DropDownList id="departmentsmenu" runat="server" class="form-control">
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
                     <asp:Label style="margin-top:8px;" runat="server"  class="col-sm-3 control-label">Address</asp:Label>
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
      


      <asp:PlaceHolder ID="doctortable" runat="server"></asp:PlaceHolder>
     
     <!-- <div class="col-lg-3 col-xs-6"  id="departments" >
             
            <div class="small-box bg-aqua">
            <div class="inner">
              <h3>@i</h3>

              <p>New Orders</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>  
        </div>
      
      
  </div>-->
  <!-- /.content-wrapper -->
  

  <!-- Control Sidebar -->
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
</div>
    </form>

    </body>
</html>
