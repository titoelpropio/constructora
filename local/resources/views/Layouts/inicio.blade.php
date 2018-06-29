<!DOCTYPE html>
<html lang="en">
  <!--================================================================================
  Item Name: Materialize - Material Design Admin Template
  Version: 4.0
  Author: PIXINVENT
  Author URL: https://themeforest.net/user/pixinvent/portfolio
  ================================================================================ -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <meta name="description" content="Materialize is a Material Design Admin Template,It's modern, responsive and based on Material Design by Google. ">
    <meta name="keywords" content="materialize, admin template, dashboard template, flat admin template, responsive admin template,">
    <title>Constructora </title>
    <!-- Favicons-->
    <link rel="icon" href="{{asset('images/favicon/favicon-32x32.png')}}" sizes="32x32">
    <!-- Favicons-->
    <link rel="apple-touch-icon-precomposed" href="{{asset('images/favicon/apple-touch-icon-152x152.png')}}">
    <!-- For iPhone -->
    <meta name="msapplication-TileColor" content="#00bcd4">
    <meta name="msapplication-TileImage" content="{{asset('images/favicon/mstile-144x144.png')}}">
    <!-- For Windows Phone -->
    {!!Html::script('js/plugins/jquery-3.2.1.min.js')!!}

    <!-- CORE CSS-->
    {!!Html::style('css/materialize.css')!!}
    {!!Html::style('css/style.css')!!}
    <!-- Custome CSS-->
    {!!Html::style('css/custom/custom.css')!!}
    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->

    {!!Html::style('js/plugins/perfect-scrollbar/perfect-scrollbar.css')!!}
    {!!Html::style('js/plugins/jvectormap/jquery-jvectormap.css')!!}
    {!!Html::style('css/flag-icon/css/flag-icon.min.css')!!}
    {!!Html::style('js/plugins/chartist-js/chartist.min.css')!!}
    {!!Html::style('js/plugins/sweetalert/dist/sweetalert.css')!!}
    {!!Html::style('js/plugins/ionRangeSlider/css/ion.rangeSlider.css')!!}
    {!!Html::style('js/plugins/ionRangeSlider/css/ion.rangeSlider.skinFlat.css')!!}
    {!!Html::style('css/select2/select2.css')!!}
    {!!Html::style('css/jquery-ui.css')!!}
    {!!Html::style('css/jquery.dataTables.min.css')!!}
    {!!Html::script('js/plugins/materialize.min.js')!!}
    <script type="">
      $('.modal').modal();
  </script>
  @stack('styles_add')
  {{--<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />--}}
</head>
<body class="layout-semi-dark">
    <input type="hidden" value="1" id="iddelperfil">
    <input type="hidden" value="1" id="iddelpuntoventa">
    <input type="hidden" value="1" id="iddelempleado">
    <input type="hidden" value="1" id="idsucursal">
    <input type="hidden" value="1" id="perfilpuedeGuardar">
    <input type="hidden" value="1" id="perfilpuedeEliminar">
    <input type="hidden" value="1" id="perfilpuedeModificar">
    <input type="hidden" value="1" id="perfilpuedeListars">
    <input type="hidden" value="1" id="perfilpuedeVerReporte">
    <input type="hidden" value="1" id="perfilpuedeImprimir">
    <input type="hidden" value="{{ Session::get('apertura_caja') }}" id="puede_abrir_caja">
    <!-- Start Page Loading -->
    <div id="loader-wrapper">
      <div id="loader"></div>
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
  </div>
  <!-- End Page Loading -->
  <!-- //////////////////////////////////////////////////////////////////////////// -->
  <!-- START HEADER -->
  <header id="header" class="page-topbar">
      <!-- start header nav-->
      <div class="navbar-fixed">
        <nav class="navbar-color">
          <div class="nav-wrapper">
            <div class="header-search-wrapper hide-on-med-and-down sideNav-lock">
              <i class="material-icons">search</i>
              <input type="text" name="Search" class="header-search-input z-depth-2" placeholder="Explore Materialize" />
          </div>
          <ul class="right hide-on-med-and-down">
              <!-- <li>
                <a href="javascript:void(0);" class="waves-effect waves-block waves-light translation-button" data-activates="translation-dropdown">
                  <span class="flag-icon flag-icon-gb"></span>
                </a>
            </li> -->
            <li>
                <a href="javascript:void(0);" class="waves-effect waves-block waves-light toggle-fullscreen">
                  <i class="material-icons">settings_overscan</i>
              </a>
          </li>
          <li>
            <a href="javascript:void(0);" class="waves-effect waves-block waves-light notification-button" data-activates="notifications-dropdown">
              <i class="material-icons">notifications_none
                <small class="notification-badge">5</small>
            </i>
        </a>
    </li>
    <li>
        <a href="javascript:void(0);" class="waves-effect waves-block waves-light profile-button" data-activates="profile-dropdown">
          <span class="avatar-status avatar-online">
            <img src="{{asset('images/avatar-7.png')}}" alt="avatar">
            <i></i>
        </span>
    </a>
</li>
<li>
    <a href="#" data-activates="chat-out" class="waves-effect waves-block waves-light chat-collapse">
      <i class="material-icons">format_indent_increase</i>
  </a>
</li>
</ul>
<!-- translation-button -->
           <!--  <ul id="translation-dropdown" class="dropdown-content">
              <li>
                <a href="#!" class="grey-text text-darken-1">
                  <i class="flag-icon flag-icon-gb"></i> English</a>
                </li>
                <li>
                  <a href="#!" class="grey-text text-darken-1">
                    <i class="flag-icon flag-icon-fr"></i> French</a>
                  </li>
                  <li>
                    <a href="#!" class="grey-text text-darken-1">
                      <i class="flag-icon flag-icon-cn"></i> Chinese</a>
                    </li>
                    <li>
                      <a href="#!" class="grey-text text-darken-1">
                        <i class="flag-icon flag-icon-de"></i> German</a>
                      </li>
                  </ul> -->
                  <!-- notifications-dropdown -->
                  <ul id="notifications-dropdown" class="dropdown-content">
                      <li>
                        <h6>NOTIFICATIONS
                          <span class="new badge">5</span>
                      </h6>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#!" class="grey-text text-darken-2">
                      <span class="material-icons icon-bg-circle cyan small">add_shopping_cart</span> A new order has been placed!</a>
                      <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">2 hours ago</time>
                  </li>
                  <li>
                      <a href="#!" class="grey-text text-darken-2">
                        <span class="material-icons icon-bg-circle red small">stars</span> Completed the task</a>
                        <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">3 days ago</time>
                    </li>
                    <li>
                        <a href="#!" class="grey-text text-darken-2">
                          <span class="material-icons icon-bg-circle teal small">settings</span> Settings updated</a>
                          <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">4 days ago</time>
                      </li>
                      <li>
                          <a href="#!" class="grey-text text-darken-2">
                            <span class="material-icons icon-bg-circle deep-orange small">today</span> Director meeting started</a>
                            <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">6 days ago</time>
                        </li>
                        <li>
                            <a href="#!" class="grey-text text-darken-2">
                              <span class="material-icons icon-bg-circle amber small">trending_up</span> Generate monthly report</a>
                              <time class="media-meta" datetime="2015-06-12T20:50:48+08:00">1 week ago</time>
                          </li>
                      </ul>
                      <!-- profile-dropdown -->
                      <ul id="profile-dropdown" class="dropdown-content">
                        <li>
                          <a href="#" class="grey-text text-darken-1">
                            <i class="material-icons">face</i> Profile</a>
                        </li>
                        <li>
                            <a href="#" class="grey-text text-darken-1">
                              <i class="material-icons">settings</i> Settings</a>
                          </li>
                          <li>
                              <a href="#" class="grey-text text-darken-1">
                                <i class="material-icons">live_help</i> Help</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#" class="grey-text text-darken-1">
                                  <i class="material-icons">lock_outline</i> Lock</a>
                              </li>
                              <li>
                                  <a href="#" class="grey-text text-darken-1">
                                    <i class="material-icons">keyboard_tab</i> Logout</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </header>
            <!-- END HEADER -->
            <!-- //////////////////////////////////////////////////////////////////////////// -->
            <!-- START MAIN -->
            <div id="main">
              <!-- START WRAPPER -->
              <div class="wrapper">
                <!-- START LEFT SIDEBAR NAV-->
                <aside id="left-sidebar-nav" class="nav-expanded nav-lock nav-collapsible">
                  <div class="brand-sidebar">
                    <h1 class="logo-wrapper">
                      <a href="index.html" class="brand-logo darken-1">
                        <img src="{{asset('images/logos/materialize-logo.png')}}" alt="materialize logo">
                        <span class="logo-text hide-on-med-and-down">Construc</span>
                    </a>
                    <a href="#" class="navbar-toggler" id="btnradiodesplegar">
                        <i class="material-icons">radio_button_checked</i>
                    </a>
                </h1>
            </div>
            <ul id="slide-out" class="side-nav fixed leftside-navigation">
                <li class="no-padding">
                  <ul class="collapsible" data-collapsible="accordion">
                    <li class="bold">
                  <a class="collapsible-header waves-effect waves-cyan">
                    <i class="material-icons">dashboard</i>
                    <span class="nav-text">Administracion</span>
                  </a>
                  <div class="collapsible-body">
                    <ul>
                      <li>
                        <a href="index.html">
                          <i class="material-icons">keyboard_arrow_right</i>
                          <span>Clientes</span>
                        </a>
                      </li>
                      <li>
                        <a href="dashboard-analytics.html">
                          <i class="material-icons">keyboard_arrow_right</i>
                          <span>Usuarios</span>
                        </a>
                      </li>
                    </ul>
                  </div>
                </li>

            </ul>
        </li>
        <li class="bold">
            <a class="collapsible naranja white-text" style="font-size:11px;">
              <i class="" style="">Bs.</i>TCV:<strong><label id="TCV" class="white-text" style="font-size:15px;"></label></strong>
              TCC:<strong><label id="TCC" class="white-text" style="font-size: 15px;"></label></strong>
          </a>
      </li>
  </ul>
  <a href="#" data-activates="slide-out" class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only gradient-45deg-light-blue-cyan gradient-shadow">
      <i class="material-icons">menu</i>
  </a>
</aside>
<!-- END LEFT SIDEBAR NAV-->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<!-- START CONTENT -->
@yield('breadcumbs')
<!-- START CONTENT -->
<section id="content">
    <!--start container-->
    <div class="container">
      @yield('Contenido')
  </div>
</section>
<!--start container-->

<!-- END WRAPPER -->
</div>
<!-- END MAIN -->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<!-- START FOOTER -->
<footer class="page-footer">
  <div class="footer-copyright">
    <div class="container">
      <span>Copyright ©
        <script type="text/javascript">
          document.write(new Date().getFullYear());
      </script> <a class="grey-text text-darken-2" href="http://themeforest.net/user/pixinvent/portfolio?ref=pixinvent" target="_blank">VENCO-SOFT</a> All rights reserved.</span>
      <span class="right hide-on-small-only"> Design and Developed by <a class="grey-text text-darken-2" href="https://pixinvent.com/">VENCO-SOFT</a></span>
  </div>
</div>
</footer>
<!-- END FOOTER -->
      <!-- ================================================
    Scripts
    ================================================ -->
    <!-- jQuery Library -->
    <!-- <script type="text/javascript" src="../../vendors/jquery-3.2.1.min.js"></script> -->
    {!!Html::script('js/plugins/angular.min.js')!!}
    {!!Html::script('js/jquery.redirect/jquery.redirect.js')!!}
    <!--materialize js-->

    <!-- <script type="text/javascript" src="../../js/materialize.min.js"></script> -->
    <!--prism-->
    {!!Html::script('js/plugins/prism/prism.js')!!}

    <!-- <script type="text/javascript" src="../../vendors/prism/prism.js"></script> -->
    <!--scrollbar-->
    <!-- <script type="text/javascript" src="../../vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script> -->
    {!!Html::script('js/plugins/perfect-scrollbar/perfect-scrollbar.min.js')!!}
    <!-- chartjs -->
    {!!Html::script('js/plugins/chartjs/chart.min.js')!!}

    <!-- <script type="text/javascript" src="../../vendors/chartjs/chart.min.js"></script> -->
    <!-- <script type="text/javascript" src="../../vendors/chartjs/chart.min.js"></script> -->
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    {!!Html::script('js/plugins/plugins.js')!!}
    <!-- <script type="text/javascript" src="../../js/plugins.js"></script> -->
    <!--custom-script.js - Add your own theme custom JS-->
    {!!Html::script('js/plugins/custom-script.js')!!}
    <!-- <script type="text/javascript" src="../../js/custom-script.js"></script> -->

    {!!Html::script('js/jquery.dataTables.min.js')!!}
    {!!Html::script('scripts/data-tables.js')!!}
    {!!Html::script('js/dataTables.responsive.min.js')!!}
    {!!Html::script('js/addautorizacion.js')!!}
    {!!Html::script('js/plugins/sweetalert/dist/sweetalert.min.js')!!}
    {!!Html::script('js/plugins/ionRangeSlider/js/ion.rangeSlider.js')!!}
    {!!Html::script('js/plugins/jquery-validation/jquery.validate.min.js')!!}
    {!!Html::script('js/plugins/jquery-validation/additional-methods.min.js')!!}
    {!!Html::script('js/plugins/formatter/jquery.formatter.min.js')!!}
    {!!Html::script('js/plugins/floatThead/jquery.floatThead.min.js')!!}
    {!!Html::script('js/plugins/floatThead/jquery.floatThead-slim.min.js')!!}
    {!! Html::script('js/comun.js') !!}
    {!!Html::script('css/select2/select2.min.js')!!}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize-autocomplete/1.0.7/jquery.materialize-autocomplete.min.js"></script>
    {{--<script src="https://cdnjs.cloudflare.co
    m/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>--}}

    @stack('scripts_add')
    @section('scripts')
    @show
<!-- <script type="text/javascript">
    function startTime() {
        today = new Date();
        h = today.getHours();
        m = today.getMinutes();
        s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        var horacompleta = h + ":" + m + ":" + s;
        if (horacompleta == "0:21:00") {
//                    alert('Tu turno acaba de terminar : ' + horacompleta);
        }
        document.getElementById('reloj').innerHTML = horacompleta;
        t = setTimeout('startTime()', 500);
        return horacompleta;
    }

    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }

    $(window).load(function () {
        startTime();
    });

</script> -->
<script>
    var contabilidad_activa = '{{ Session::get('asientos_contables') }}';
    $('input[type=text]').focus(function () {
      $(this).select();
  });

    $('input[type=number]').focus(function () {
      $(this).select();
  });
</script>
<!-- <script type="text/javascript" src="../../js/scripts/dashboard-ecommerce.js"></script> -->
</body>
</html>