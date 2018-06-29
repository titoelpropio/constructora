<!-- Modal Structure -->
<div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token"> 
        <h4><strong>Agregar Mano de obra</strong></h4>
        <div class="divider"></div>
        <div class="row">
            <div class="input-field col s12 m12 l12">
                <i class="mdi-action-account-circle prefix"></i>
                {!!Form::label('Nombre','Nombre: *')!!}
                {!!Form::text('nombre',null, ['id'=>'nombre'])!!}
            </div>
            <div class="input-field col s12 m12 l12">
                <i class="mdi-action-label-outline prefix"></i>
                {!!Form::label('pago','Pago: ')!!}
                {!!Form::number('pago',null, ['id'=>'pago'])!!}
            </div>
        </div>
        
    </div>
    <div class="modal-footer">
        <a id="closemodal" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Guardar', $attributes = ['id'=>'guardar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>
<!-- Modal Structure -->
<div id="modal2" class="modal modal-fixed-footer">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
        <input type="hidden" id="idactualizar">
        <h4><strong>Actualizar Mano de obra</strong></h4>
        <div class="divider"></div>
        <div class="row">
            <div class=" col s12 m6 l6">
                <i class="mdi-action-account-circle prefix"></i>
                {!!Form::label('nombres','Nombre: *')!!}
                {!!Form::text('nombre',null, ['id'=>'nombres','placeholder'=>''])!!}
            </div>
            <div class=" col s12 m12 l12">
                <i class="mdi-action-label-outline prefix"></i>
                {!!Form::label('pago','Pago: ')!!}
                {!!Form::number('pago',null, ['id'=>'pagos'])!!}
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Actualizar', $attributes = ['id'=>'actualizar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>

