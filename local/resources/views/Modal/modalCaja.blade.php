<div id="modal1" class="modal">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
        <input type="hidden" id="id">
        <h4><strong>Agregar Caja</strong></h4>
        <div class="divider"></div>
        <div class="col s12 input-field">
            {!!Form::label('Nombre','Nombre: *')!!}
            {!!Form::text('nombre',null, ['id'=>'nombre'])!!}
        </div>
        <div class="col s12">
            <label for="cuenta" class="active">Cuenta Contable</label>
            <input type="text" list="list_cuentas_caja" id="cc_cuenta_caja" name="cc_cuenta_caja"
                   autocomplete="on" class="input-field ">
            <datalist id="list_cuentas_caja">
                @foreach($cuentas_contables as $row)
                    <option data-id="{{ $row->id }}" value="{{ $row->nombre }}">{{ $row->naturaleza }}
                @endforeach
            </datalist>
            <input id="cc_cuenta_caja_id" name="cc_cuenta_caja_id" hidden>
        </div>
        <div class="col s12">
            <label for="cuenta" class="active">Monedas</label>
            <select id="moneda_id" name="moneda_id">
                <option value="0">Seleccione una moneda</option>
                @foreach($monedas as $row)
                    <option value="{{ $row->id }}">{{ $row->nombre }}</option>
                @endforeach
            </select>
        </div>
        <div class="row">
            <div class="col s12">
                {!!Form::label('Activado','Activar : ')!!}
                <br>
                <center>
                    <div class="col s12">
                        <input  class="group1" name="group1" type="radio" id="test2" value="no" checked/>
                        <label for="test2">No</label>
                        <input  class="group1" name="group1" type="radio" id="test1" value="si"  />
                        <label for="test1">Si</label>
                    </div>
                </center>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a  id="closemodal" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Agregar', $attributes = ['id'=>'guardar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>


<div id="modal2" class="modal">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
        <input type="hidden" id="idactualizar">
        <h4><strong>Actualizar Caja</strong></h4>
        <div class="divider"></div>
        <div class="col s12 input-field">
            {!!Form::label('Nombre','Nombre: *')!!}
            {!!Form::text('nombre',null, ['id'=>'nombrenuevo','placeholder'=>''])!!}
        </div>
        <div class="col s12">
            <label for="cuenta" class="active">Cuenta Contable</label>
            <input type="text" list="editar_list_cuentas_caja" id="editar_cc_cuenta_caja" name="editar_cc_cuenta_caja"
                   autocomplete="on" class="input-field ">
            <datalist id="editar_list_cuentas_caja">
                @foreach($cuentas_contables as $row)
                    <option data-id="{{ $row->id }}" value="{{ $row->nombre }}">{{ $row->naturaleza }}
                @endforeach
            </datalist>
            <input id="editar_cc_cuenta_caja_id" name="editar_cc_cuenta_caja_id" hidden>
        </div>
        <div class="col s1">
            <label for="cuenta" class="active">Monedas</label>
            <select id="editar_moneda_id" name="editar_moneda_id" hidden>
                <option value="0">Seleccione una moneda</option>
                @foreach($monedas as $row)
                    <option value="{{ $row->id }}">{{ $row->nombre }}</option>
                @endforeach
            </select>
        </div>
        <div class="row">
            <div class="col s12">
                {!!Form::label('Activado','Activar : ')!!}
                <br>
                <center>
                    <div class="col s12">
                        <input  class="group1s" name="group1s" type="radio" id="test2s" value="no" checked/>
                        <label for="test2s">No</label>
                        <input  class="group1s" name="group1s" type="radio" id="test1s" value="si" />
                        <label for="test1s">Si</label>
                    </div>
                </center>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a   class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Actualizar', $attributes = ['id'=>'actualizar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>