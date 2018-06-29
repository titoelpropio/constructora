<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EquiObra extends Model
{

	protected $table = 'equi_obra';
   protected $fillable = ['id', 'id_obra', 'id_equipo', 'cantidad' , 'precio', 'eliminado'];
 
}
