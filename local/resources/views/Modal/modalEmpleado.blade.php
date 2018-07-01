<div id="modal1" class="modal modal-fixed-footer">
    <div class="modal-content">
        <input type="hidden" name="_token" value="{{ csrf_token() }}" id="token">
        <input type="hidden" id="id">
        <h4><b>Actualizar Empleado</b></h4>
        <div class="divider"></div>

        <form  class="row">

            <div class="col s12">
                <div class="input-field col s12 m6 l6">
                    <label for="nombre" class="active"> Nombre:* </label>
                    <input id="nombre" type="text"  length="100" placeholder="">
                </div>    
                <div class="input-field col s12 m6 l4">
                    <input id="apellido" type="text"  length="100">
                    <label for="input">Apellido: *</label>
                </div>
                <div class="col s12 m6 l3">
                    <input type="text"  id="Docidentidad" length="20">
                    <label for="Docidentidad">Documento de identidad: *</label>
                </div>            

                <div class="input-field col s12 m6 l3">
                    <label for="fechanacimiento" class="active">Fecha de nacimiento: *</label> 
                    <input type="date"  id="fechanacimiento">
                </div>
                <div class="input-field col s12 m6 l2">
                    <label for="genero" class="active">Genero:</label>
                    <select id="genero">
                        <option value="Masculino">Masculino</option>
                        <option value="Femenino">Femenino</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>                                             
            </div>

        </form>

    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Actualizar', $attributes = ['id'=>'actualizar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>