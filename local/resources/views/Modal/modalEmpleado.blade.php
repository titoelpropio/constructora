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
                <div class="input-field col s12 m6 l3">
                    <label for='Docidentidad' class="active">Documento de identidad: *</label>
                    <input type="text"  id="Docidentidad" length="20" placeholder="" onkeypress="return isNumberKey(this);">
                </div>       
                <div class="input-field col s12 m6 l3">
                    <label class="active" for="fechanacimiento">Fecha Nacimiento:</label> 
                    <input type="date"  id="fechanacimiento" class="" placeholder="">
                </div>                                                   
            </div>

            <div class="col s12">
                <div class="input-field col s12 m6 l6">
                    <label class="active" for="correo" >Correo electronico :</label>
                    <input type="email"  id="correo" placeholder="">
                </div>                
                <div class="input-field col s12 m6 l3">
                    <label for="genero" class="active">Genero: </label>
                    <select id="genero">
                        <option value="Masculino">Masculino</option>
                        <option value="Femenino">Femenino</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>     
                <div class="input-field col s12 m6 l3">
                    <label for="Cargo" class="active">Cargo: </label>
                    <select id="Cargo">   
                    </select>
                </div>
            </div>

            <div class="col s12">
                <div class="input-field col s12 m6 l4">
                    <label for="turno" class="active">Turno:</label>
                    <select id="turno">
                    </select> 
                </div>                
                <div class="input-field col s12 m6 l4">
                    <label for="telefonofijo" class="active">Telefono Fijo :</label>
                    <input type="text"  id="telefonofijo" placeholder="" onkeypress="return isNumberKey(this);"> 
                </div>
                <div class="input-field col s12 m6 l4">
                    <label class="active" for="celular" >Celular: *</label>
                    <input type="text"  id="celular" placeholder="" onkeypress="return isNumberKey(this);">
                </div>
            </div>

            <div class="col s12">
                <div class="input-field col s12 m6 l12">
                    {!!Form::label('Descuento','Porcentaje de Comision: *')!!} <br><br>
                    <div id="descuento"></div>
                </div>
            </div>

        </form>

    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cerrar</a>
        {!!link_to('#', $title='Actualizar', $attributes = ['id'=>'actualizar', 'class'=>'btn btn-primary'], $secure = null)!!}
    </div>
</div>