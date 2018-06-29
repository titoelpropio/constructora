<!-- Modal Structure -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
        <h4><strong>Nuevo Modulo</strong></h4>
        <div class="divider"></div>
        {!!Form::label('Nombre','Nombre: ')!!}
        {!!Form::text('nombre',null, ['id'=>'nombre'])!!}

        <table><tr>
                <td>
                    {!!Form::label('icono','Icono: ')!!}
                    {!!Form::text('icono',null, ['id'=>'icono'])!!}                                         
                </td>
                <td>                    
                    {!!Form::label('nro','No de Orden: ')!!}
                    {!!Form::text('nro',null, ['id'=>'nro','onkeypress'=>'return isNumberKey(this)'])!!}                       
                </td>
            </tr>
        </table>

        {!!Form::label('habilitado','Habilitado: ')!!}<br>
        <input name="group1" type="radio" id="test1" checked />
        <label for="test1">Si</label>
        <input name="group1" type="radio" id="test2" />
        <label for="test2">No</label> 


    </div>
    <div class="modal-footer">
        <a  id="closemodal" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Guardar', $attributes = ['id'=>'guardar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>





<!-- Modal Structure -->
<div id="modal2" class="modal">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
        <input type="hidden" id="idactualizar">
        <h4><strong>Actualizar Modulo</strong></h4>
        <div class="divider"></div>
        {!!Form::label('Nombre','Nombre: ')!!}
        {!!Form::text('nombre',null, ['id'=>'nombreact'])!!}

        <table><tr>
                <td>
                    {!!Form::label('icono','Icono: ')!!}
                    {!!Form::text('iconoact',null, ['id'=>'iconoact'])!!}                                       
                </td>
                <td>                    
                    {!!Form::label('nro','No de Orden: ')!!}
                    {!!Form::text('nroact',null, ['id'=>'nroact','onkeypress'=>'return isNumberKey(this)'])!!}                       
                </td>
            </tr>
        </table>

        {!!Form::label('habilitado','Habilitado: ')!!}
        <input name="group1act" type="radio" id="test1act" />
        <label for="test1act">Si</label>
        <input name="group1act" type="radio" id="test2act" />
        <label for="test2act">No</label>   
                
    </div>
    <div class="modal-footer">
        <a   class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Actualizar', $attributes = ['id'=>'actualizar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>

<script type="text/javascript">
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}    
</script>