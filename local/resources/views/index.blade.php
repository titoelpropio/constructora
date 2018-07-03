@extends('Layouts.inicio')
@section('Contenido')
<div class="container">
    <div class="row">
      <div class="col s12 m4 l4">
        <div class="card pt-0 pb-0">
          <div class="padding-2 ml-2">
            <span class="new badge gradient-45deg-light-blue-cyan gradient-shadow mt-2 mr-2">+ 42.6%</span>
            <p class="mt-2 mb-0">Members online</p>
            <p class="no-margin grey-text lighten-3">360 avg</p>
            <h5>3,450</h5>
        </div>
        <div class="row">
            <div class="sample-chart-wrapper" style="margin-bottom: -14px; margin-top: -75px;">
              <canvas id="custom-line-chart-sample-one" class="center"></canvas>
          </div>
 
      </div>

  </div>
</div>
            <div id="chartjs-pie-chart" class="section">
                <div class="row">
                  <div class="col s9">
                    <div class="row">
                      <div class="col s12 m12 l12">
                        <div class="sample-chart-wrapper">
                          <canvas id="pie-chart-sample"></canvas>
                        </div>
                        <p class="header center">Pie Charts</p>
                      </div>
                    
                    </div>
                  </div>
                  <div class="col s3">
                    <select id="obra" onchange="listardetalleobra(this.value)">
                      <option>Seleccione una obra</option>
                      <?php 
                       if (!session()->has('idPerfil')) 
                       {
                        for ($i=0; $i <count($obra) ; $i++) { 
                          echo "<option value='".$obra[$i]->id."'>".$obra[$i]->nombre;
                        }
                        }
                        
                       ?>
                    </select>
                  </div>
                </div>
              </div>
</div>
</div>
<input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
@stop
@section('scripts')
{!!Html::script('js/plugins/chartjs/chart.min.js')!!}
{!!Html::script('js/plugins/chartjs/chart-script.js')!!}
@endsection