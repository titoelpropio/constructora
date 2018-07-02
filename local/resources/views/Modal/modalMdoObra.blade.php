<!-- Modal Structure -->
<div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token"> 
        <h4><strong>Agregar Mano Obra</strong></h4>
        <div class="divider"></div>
        <div class="row">
            <div class=" col s12 m12 l12">
                <i class="mdi-action-account-circle prefix"></i>
                {!!Form::label('obra','Obra: *')!!}
                <select name="obra" id="obra">
                    <?php 
                    for ($i=0; $i < count($obra); $i++) { 
                       echo "<option value='".$obra[$i]->id."' >".$obra[$i]->nombre;
                    }
                    ?>
                </select>
            </div>
            <div class="col s12 m12 l12">
                <i class="mdi-action-label-outline prefix"></i>
                {!!Form::label('manoobra','manoobra: ')!!}
                 <select name="manoobra" id="manoobra">
                    <?php 
                    for ($i=0; $i < count($manoobra); $i++) { 
                       echo "<option value='".$manoobra[$i]->id."'>".$manoobra[$i]->nombre;
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m12 l12">
                <i class="mdi-communication-phone prefix"></i>
                {!!Form::label('cantidad','Cantidad : ')!!}
                {!!Form::number('cantidad',0, ['id'=>'cantidad'])!!}
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m12 l12">
                <i class="mdi-communication-phone prefix"></i>
                {!!Form::label('precio','Precio : ')!!}
                {!!Form::number('precio',0, ['id'=>'precio'])!!}
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
        <h4><strong>Actualizar Equipo</strong></h4>
        <div class="divider"></div>
         <div class="row">
            <div class=" col s12 m12 l12">
                <i class="mdi-action-account-circle prefix"></i>
                {!!Form::label('obra','Obra: *')!!}
                <select name="obra" id="obras">
                    <?php 
                    for ($i=0; $i < count($obra); $i++) { 
                       echo "<option  value='".$obra[$i]->id."'>".$obra[$i]->nombre;
                    }
                    ?>
                </select>
            </div>
            <div class="col s12 m12 l12">
                <i class="mdi-action-label-outline prefix"></i>
                {!!Form::label('manoobra','manoobra: ')!!}
                 <select name="manoobra" id="manoobras">
                    <?php 
                    for ($i=0; $i < count($manoobra); $i++) { 
                       echo "<option value='".$manoobra[$i]->id."'>".$manoobra[$i]->nombre;
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m12 l12">
                <i class="mdi-communication-phone prefix"></i>
                {!!Form::label('cantidad','Cantidad : ')!!}
                {!!Form::number('cantidad',0, ['id'=>'cantidads'])!!}
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m12 l12">
                <i class="mdi-communication-phone prefix"></i>
                {!!Form::label('precio','Precio : ')!!}
                {!!Form::number('precio',0, ['id'=>'precios'])!!}
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Actualizar', $attributes = ['id'=>'actualizar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>

