<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="doctor_module_priscription.aspx.cs" Inherits="Hospital_management_system.doctor_module_priscription" %>

<!-- for the tabing in popup model box(add_department.aspx) -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- end tabing code in popupmaodel box (add_department.aspx)-->

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
  


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .borderstylemine, .borderstylemine th, .borderstylemine td 
        {
              border:1px solid #4cff00;
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
              <img src="dist/img/download.jpg" class="user-image" alt="User Image">
              <asp:Label  class="hidden-xs" runat="server" ID="username"></asp:Label>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/download.jpg" class="img-circle" alt="User Image">
                <p>
              <asp:Label  class="hidden-xs" runat="server" ID="usnm"></asp:Label>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                    <asp:Button ID="profile" OnClick="profile_Click"  class="btn btn-default btn-flat"  runat="server" Text="profile" />
                </div>
                <div class="pull-right">
                    <asp:Button ID="signout" OnClick="signout_Click"  class="btn btn-default btn-flat"  runat="server" Text="Sign Out" />
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
          <a href="doctor_module.aspx">
            <i class="fa fa-dashboard"></i>
            <span>Patient</span>
            
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>Appointment</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li>
          <a href="doctor_module_priscription.aspx">
            <i class="fa fa-th"></i> <span>Priscription</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="doctor_module_reports.aspx">
            <i class="fa fa-pie-chart"></i>
            <span>Lab Reports</span>
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
        Doctor Appointment  
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">doctor appointment</li>
      </ol>
    </section>
<br />
   
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>
            <asp:Panel style="height:500px;width:100%"    ID="forupadte" runat="server">
            <div style="margin-top:12px;" class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Add Priscription</a></li>
    <li><a data-toggle="tab" href="#menu1">Priscription List</a></li>
  </ul>
               
  <div class="tab-content">
    <div id="home" style="max-width: 530px;margin:0px 0px 0px 25px"   class="tab-pane fade in active">
      <h3>Add Priscription</h3>


      <table>
          <tr>
              <td>
        <table  style="width:550px;height:auto">
            <tr>
                <td>
                         <div class="form-group">
                    <label style="margin-top:8px;" class="col-sm-3 control-label">Patient Name</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:DropDownList ID="pnameid"  runat="server"  class="form-control" autofocus >
                        </asp:DropDownList>    
                    </div>
                </div>
                </td>
              

               </tr>
                
               
          <tr>
              <td>
                            <div   class="form-group">
                    <label  style="margin-top:8px;" class="col-sm-3 control-label">Treatment</label>
                    <div style="margin-top:8px;"   class="col-sm-9">
                        <asp:DropDownList ID="ptreat"  runat="server"  class="form-control" autofocus >
                        </asp:DropDownList>    
                    </div>
                </div>
      
              </td>
          </tr>
            
      

            <tr>
                <td>
                      <div   class="form-group">
                     <asp:Label  style="margin-top:8px" runat="server" class="col-sm-3 control-label">Notes</asp:Label>
                     <div style="margin-top:8px;" class="col-sm-9">
                       
                     <textarea rows="4" cols="50" runat="server"  id="notes"  class="form-control"  autofocus>
                     </textarea>
                     </div>
                </div>

                </td>
            </tr>

            <tr>
                <td>
                    
             <div class="form-group">
                <asp:Label style="margin-top:8px;"  runat="server" class="col-sm-3 control-label">Medication</asp:Label>
                 <div style="margin-top:8px;" class="col-sm-9">
                 <asp:DropDownList ID="medicienelist"  runat="server"  class="form-control" autofocus >
                 </asp:DropDownList>  
                 <asp:Textbox  id="numberofmedicine"   runat="server" placeholder="Number of medicine" class="form-control" autofocus></asp:Textbox>
                 <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="numberofmedicine" FilterType="Numbers" />
                
                 <asp:DropDownList ID="whentotake"  runat="server"  class="form-control" autofocus >
                 <asp:ListItem>BEFORE BREAKFAST</asp:ListItem>
                 <asp:ListItem>AFTER BREAKFAST</asp:ListItem>
                 <asp:ListItem>BEFORE MEAL</asp:ListItem>
                 <asp:ListItem>AFTER MEAL</asp:ListItem>
                 <asp:ListItem>BEFORE LUNCH</asp:ListItem>
                 <asp:ListItem>AFTER LUNCH</asp:ListItem>
                 </asp:DropDownList>  
              
                         <div class="form-group">
                    <div style="margin-top:8px;"   class="col-sm-9">
                         <asp:Button ID="addmedicine" OnClick="addmedicine_Click"   runat="server" Text="Add" />
                    </div>
                  </div>
                       
                 </div>
                 </div>

                </td>
            </tr>
            </table>
              </td>

               <td>
                    <asp:Panel  ID="Panel2" runat="server" >
       <div class="row" >
           <div class="col-sm-12">
               <asp:GridView ID="dd1" runat="server"  OnRowDeleting="OnRowDeleting" aria-describedby="example2_info" class="table table-bordered table-hover dataTable" role="grid" AutoGenerateColumns="true">
                   <Columns>
                        <asp:CommandField ShowDeleteButton="True"  ButtonType="Button"  />
                   </Columns>
               </asp:GridView>
              </div>
           </div>
            </asp:Panel>
                </td>
          </tr>
        </table>
      
        <asp:Button ID="createpre" runat="server"   OnClick="createpre_Click" Text="Create Prescription" />
        
                </div> 
              
   
    <div id="menu1" style="max-width:530px;" class="tab-pane fade">
        
            <h3>Priscriptions List</h3>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                      
        <asp:Panel  ID="Panel1" runat="server" >
       <div class="row" >
           <div class="col-sm-12">
               
               <asp:GridView ID="prescription" BorderColor="Black" runat="server"  OnRowDeleting="forprescription"  aria-describedby="example2_info" class="table table-bordered table-hover dataTable" role="grid" AutoGenerateColumns="true">
                   <Columns>
                      
                        <asp:CommandField ShowDeleteButton="True"  ButtonType="Button"  />
                   </Columns>
               </asp:GridView>
              </div>
           </div>
            </asp:Panel>

    
    </div>   
  </div>       
            </div>
            </asp:Panel> 
          </ContentTemplate>
    </asp:UpdatePanel>
      

</div>
    

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


    </form>

    </body>
    

</html>
