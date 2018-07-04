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
    <input type="hidden" id="autorizacion" value="{!!URL::to('Autorizaciones')!!}" name="">
    <input type="hidden" id="iddelperfil" value="<?php  echo Session::get('idPerfil');  ?>">
    <input type="hidden" id="perfilpuedeGuardar">
    <input type="hidden"  id="perfilpuedeEliminar">
    <input type="hidden" id="perfilpuedeModificar">
    <input type="hidden" id="perfilpuedeListars">
    <input type="hidden"  id="perfilpuedeVerReporte">
    <input type="hidden"  id="perfilpuedeImprimir">
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
                <a href="javascript:void(0);" class="waves-effect waves-block waves-light profile-button" data-activates="profile-dropdown">
                  <span class="avatar-status avatar-online">
                    <img src="{{asset('images/avatar-7.png')}}" alt="avatar">
                    <i></i>
                  </span>
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
                                <!-- <li>
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
                                        </li> -->
                                        <li>
                                          <a href="{!!URL::to('Logout')!!}" class="grey-text text-darken-1">
                                            <i class="material-icons" >keyboard_tab</i> Logout</a>
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
                                      <input type="hidden" name="" id="raiz" value="{!!URL::to('/')!!}">
                                      <ul id="slide-out" class="side-nav fixed leftside-navigation">
                                        <li class="no-padding">
                                          <ul class="collapsible" data-collapsible="accordion">

                                            <?php 
                                            if (!session()->has('idPerfil')) 
                                            {
                                            //  return redirect('/');
                                            }
                                            else
                                            {
                                            $modulo=DB::select("SELECT * FROM modulo order by orden asc "); //OBTENGO LOS MODULOS DISPONIBLES PARA LA EMPRESA?>
                                            <?php foreach ($modulo as $key => $value): ?>
                                                <?php $objeto=DB::select("SELECT objeto.* FROM objeto,perfilobjeto WHERE objeto.id=perfilobjeto.idObjeto AND objeto.estado=0 AND objeto.eliminado=0 AND objeto.idmodulo=".$value->id." AND perfilobjeto.idperfil=".Session::get('idPerfil')." AND perfilobjeto.puedelistar=1   and perfilobjeto.deleted_at IS NULL"); //OBTENGO LOS OBJETOS DISPONIBLE DE DADO EL MODULO Y EL PERFIL EN CASO Q NO TENGA PERMISO A NINGUN MODULO VERIFIXO CON EL COUNT SI ES 0 NO GENERA EL MODULO.?>
                                              <?php if (count($objeto) > 0): //PREGUNTO SI TIENE ALGUN OBJETO DISPONIBLE EN ESE MODULO PARA Q APARESCA EL MODULO?>
                                                <li class="bold">
                                                  <a class="collapsible-header  waves-effect waves-cyan">
                                                   <i class="material-icons">{{$value->icono}}</i> &nbsp;&nbsp; {{$value->nombre}} 
                                                  </a>
                                                  <div class="collapsible-body">
                                                    <ul>
                                                      <?php foreach ($objeto as $key => $value2): ?>
                                                        <div id="{{substr($value2->urlobjeto,1)}}">
                                                          <?php if ($value2->urlobjeto == "/EmpresaModulo"): ?>
                                                            <li>
                                                              <a href="#" onclick="VerificarAcceso()">
                                                               &nbsp;&nbsp;   {{$value2->nombre}}
                                                             </a>
                                                           </li>

                                                           <?php else: ?>
                                                            <li>

                                                              <a href="{!!URL::to($value2->urlobjeto)!!}">
                                                               &nbsp;&nbsp;  {{$value2->nombre}}
                                                             </a>
                                                           </li>                                    
                                                         <?php endif ;?>
                                                       </div>                                        
                                                     <?php endforeach ;?>
                                                   </ul>
                                                 </div>
                                               </li>               
                                             <?php endif ?>
                                             
                                            
                                           <?php endforeach ;
                                        }


                                           ?>
                                          </ul>
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
                                  <footer class="page-footer footer-fixed gradient-45deg-purple-deep-oranger">
                                    <div class="footer-copyright">
                                      <div class="container">
                                        <span>Copyright ©
                                          <script type="text/javascript">
                                            document.write(new Date().getFullYear());
                                          </script> <a class="grey-text text-darken-2" href="http://themeforest.net/user/pixinvent/portfolio?ref=pixinvent" target="_blank">CONTRUCTORA-BR</a> Todos los derechos reservados.</span>
                                          <span class="right hide-on-small-only"> Design and Developed by <a class="grey-text text-darken-2" href="https://pixinvent.com/">CONTRUCTORA-BR</a></span>
                                           <span style="    font-weight: bold;">CANTIDAD VISITAS: <span id="quantityvisit">0</span></span>
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
  <style type="text/css">
    body.layout-semi-dark #main .side-nav{
      <?php 
          $tema=DB::Select('select *from configuracion');
          switch ($tema[0]->tema) {
            case '1':
              
              break;
            case '2':
              echo "background:  linear-gradient(45deg, #43484c 50%, #ffffff 100%) !important;";
              break;
            case '3':
              echo "background:  linear-gradient(45deg, #37474f   50%, #37474f 100%) !important;";
              break;
            default:
              # code...
              break;
          }
       ?>
        
    }
    body.layout-semi-dark #main #left-sidebar-nav .brand-sidebar{
      <?php 
          switch ($tema[0]->tema) {
            case '1':
              
              break;
            case '2':
              echo "background: linear-gradient(45deg, #43484c 0%, #aaacae 100%) !important;";
              break;
            case '3':
              echo "background:  linear-gradient(45deg, #37474f   50%, #37474f   100%) !important;";
              break;
            default:
              # code...
              break;
          }
       ?>
        
    }
  </style>
  <script>
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