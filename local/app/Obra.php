<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Obra extends Model
{

	protected $table = 'obra';
   protected $fillable = ['id', 'nombre', 'descripcion', 'duracion', 'presupuesto'];
 
}
