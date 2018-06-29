<!-- Modal Structure -->
<div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token"> 
        <h4><strong>Agregar Cliente</strong></h4>
        <div class="divider"></div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <i class="mdi-action-account-circle prefix"></i>
                {!!Form::label('Nombre','Nombre: *')!!}
                {!!Form::text('nombre',null, ['id'=>'nombre'])!!}
            </div>
            <div class="input-field col s12 m6 l6">
                <i class="mdi-action-label-outline prefix"></i>
                {!!Form::label('Abreviatura','Direccion: ')!!}
                {!!Form::text('abreviatura',null, ['id'=>'direccion'])!!}
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <i class="mdi-communication-phone prefix"></i>
                {!!Form::label('Nombre','Telefono Fijo: ')!!}
                {!!Form::text('nombre',null, ['id'=>'telefonoFijo','onkeypress'=>'return isNumberKey(this);'])!!}
            </div>
            <div class="input-field col s12 m6 l6">
                <i class="mdi-action-settings-cell prefix"></i>
                {!!Form::label('Abreviatura','Celular: ')!!}
                {!!Form::text('abreviatura',null, ['id'=>'celular','onkeypress'=>'return isNumberKey(this);'])!!}
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <i class="mdi-communication-email prefix"></i>
                {!!Form::label('Abreviatura','Correo: ')!!}
                {!!Form::email('abreviatura',null, ['id'=>'correo'])!!}
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <i class="mdi-social-person-outline prefix"></i>
                {!!Form::label('Abreviatura','Razon Social: *')!!}
                {!!Form::text('abreviatura',null, ['id'=>'razonSocial'])!!}
            </div>
            <div class="input-field col s12 m6 l6">
                <i class="mdi-social-person prefix"></i>
                {!!Form::label('Abreviatura','Nit: *')!!}
                {!!Form::text('abreviatura',null, ['id'=>'NIT','onkeypress'=>'return isNumberKey(this);'])!!} 
            </div>
        </div>
        
        <div class="input-field col s12">
            <i class="mdi-editor-mode-edit prefix"></i>
            {!!Form::label('PREFERENCIAS','PREFERENCIAS:')!!}
            <textarea class="materialize-textarea" length="700" id='preferencias' maxlength="700"></textarea>
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
        <input type="hidden" id="id">
        <h4><strong>Actualizar Cliente</strong></h4>
        <div class="divider"></div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <i class="mdi-action-account-circle prefix"></i>
                {!!Form::label('nombres','Nombre: *')!!}
                {!!Form::text('nombre',null, ['id'=>'nombres','placeholder'=>''])!!}
            </div>
            <div class="input-field col s12 m6 l6">
                <i class="mdi-action-label-outline prefix"></i>
                {!!Form::label('abreviatura','Direccion: ')!!}
                {!!Form::text('abreviatura',null, ['id'=>'direccions','placeholder'=>''])!!}
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <i class="mdi-communication-phone prefix"></i>
                {!!Form::label('telefonoFijos','telefono Fijo: ')!!}
                {!!Form::text('nombre',null, ['id'=>'telefonoFijos','placeholder'=>'','onkeypress'=>'return isNumberKey(this);'])!!}
            </div>
            <div class="input-field col s12 m6 l6">
                <i class="mdi-action-settings-cell prefix"></i>
                {!!Form::label('Abreviatura','Celular: ')!!}
                {!!Form::text('abreviatura',null, ['id'=>'celulars','placeholder'=>'','onkeypress'=>'return isNumberKey(this);'])!!}
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <i class="mdi-communication-email prefix"></i>
                {!!Form::label('Abreviatura','Correo: ')!!}
                {!!Form::email('abreviatura',null, ['id'=>'correos','placeholder'=>''])!!}
            </div>
            
        </div>
        <div class="row">
            <div class="input-field col s12 m6 l6">
                <i class="mdi-social-person-outline prefix"></i>
                {!!Form::label('Abreviatura','Razon Social: *')!!}
                {!!Form::text('abreviatura',null, ['id'=>'razonSocials','placeholder'=>''])!!}
            </div>
            <div class="input-field col s12 m6 l6">
                <i class="mdi-social-person prefix"></i>
                {!!Form::label('Abreviatura','Nit: *')!!}
                {!!Form::text('abreviatura',null, ['id'=>'NITs','placeholder'=>'','onkeypress'=>'return isNumberKey(this);'])!!}
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <i class="mdi-editor-mode-edit prefix"></i>
                {!!Form::label('PREFERENCIAS','PREFERENCIAS:')!!}
                <textarea class="materialize-textarea" length="700" id='preferenciass' maxlength="700" placeholder=""></textarea>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Actualizar', $attributes = ['id'=>'actualizar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>



<!-- Modal Structure -->
<div id="modal3" class="modal modal-fixed-footer">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
        <input type="hidden" id="idClient">
        <h4><strong>Agregar Listas de Precios</strong></h4>
        <div class="divider"></div>



        <div class="col s12 m6 l6">
            <div class="row">
                <div class="input-field col s1">
                    <i class="mdi-social-location-city prefix"></i>
                </div>
                <div class=" input-field col s8">
                    <label for="idlistaP" class="active">Lista de precio: </label>
                    <select id = "idlistaP" >
                    </select>
                </div>
                <div class="input-field col s3">
                    {!!link_to('#', $title='Agregar', $attributes = ['id'=>'agregarLista', 'class'=>'btn btn-primary' ], $secure = null)!!}
                </div>
            </div>


        </div>

        <div class="input-field col s12 m6 l6">
            <div class="col s12 m6 l12">
                <table class="responsive-table centered" >
                    <thead>
                        <tr>
                            <th>Nombre Lista de precio</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody id="resultadoLista">
                    </tbody>
                </table>
            </div>



        </div>


    </div>
    <div class="modal-footer">
        <a class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Actualizar', $attributes = ['id'=>'actualizar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>
