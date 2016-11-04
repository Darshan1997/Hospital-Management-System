<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rec_patient_registration.aspx.cs" Inherits="Hospital_management_system.rec_patient_registration" %>


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


<!DOCTYPE html>

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
          <a href="resepsenist_admin.aspx">
            <i class="fa fa-dashboard"></i>
            <span>Appointment</span>
            
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>Patient Registration</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li>
          <a href="rec_room.aspx">
            <i class="fa fa-th"></i> <span>Room</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="rec_report.aspx">
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
        Patient Registration
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Patient Registration</li>
      </ol>
    </section>
<br />
   

      <asp:LinkButton ID="addpatient" runat="server">Add a Patient</asp:LinkButton>
      
      <asp:PlaceHolder ID="staffplaceholder" runat="server"></asp:PlaceHolder>
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="popupmodel" PopupControlID="panel" TargetControlID="addpatient"  DropShadow="False" CancelControlID="forclose">
          
      </ajaxToolkit:ModalPopupExtender>
      
            <asp:Panel runat="server" ID="panel">
          
          <table border="0" style="width:100%;margin-top:-50px;">

                <tr>
                    <th  style="width:500px;text-align:center">
                            <h2 style="color:white">Patient Datails</h2>
                    </th>
                <th style="width:500px;text-align:center" >
                            <h2 style="color:white">contact Details</h2>
                </th>

                </tr>

              <tr>
                  <td style="width:50px;">
              <div class="form-group">
                    <label style="margin-top:8px;color:white" class="col-sm-3 control-label">Patient ID</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="pid" style="color:blue;"  runat="server" placeholder="Patient ID" ReadOnly="true"  class="form-control" autofocus></asp:Textbox>
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

                </tr>
             
               <tr>   
                   <td style="width:50px;">
              <div class="form-group">
                    <label style="margin-top:8px;color:white" class="col-sm-3 control-label">Patient Name</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:Textbox  id="pname" style="color:blue;"  runat="server" placeholder="Patient Name" class="form-control" autofocus></asp:Textbox>
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
              </tr>


              <tr>
                  <td>            
                            <div class="form-group">
                    <label for="country" style="margin-top:8px;color:white" class="col-sm-3 control-label">state</label>
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
                    <label for="country" style="margin-top:8px;color:white" class="col-sm-3 control-label">city</label>
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
                    <label for="type" style="margin-top:8px;color:white;" class="col-sm-3 control-label">type</label>
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
                    <asp:Label  runat="server" style="margin-top:8px;color:white" class="col-sm-3 control-label">Age</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="age" runat="server" style="color:blue;"   placeholder="age" TextMode="Number"  class="form-control" autofocus></asp:Textbox>
                    </div>
                </div>
                  </td>
              </tr>


              <tr>
                  <td>
                   <div  class="form-group">
                    <asp:Label  runat="server" style="margin-top:8px;color:white" class="col-sm-3 control-label">CheckIN date</asp:Label>
                    <div style="margin-top:8px;"  class="col-sm-9">
                        <asp:Textbox  id="jdate" TextMode="Date" runat="server" style="color:blue;"   placeholder="joning data" class="form-control" autofocus></asp:Textbox>
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
          <asp:Button runat="server" class="btn lg ghost"  OnClick="Registra_patient_Click"   ID="Registra_patient" Text="Registration"/>
          </div>
          
          <div class="row">
              <button class="btn lg ghost" runat="server"  id="forclose" >Close</button>
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

    
       </form>
</body>
  

</html>
