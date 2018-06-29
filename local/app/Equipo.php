<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Equipo extends Model
{

	protected $table = 'equipo';
   protected $fillable = ['id', 'nombre', 'descripcion', 'precio_uso', ];
 
}
