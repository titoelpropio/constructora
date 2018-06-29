<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Herramienta extends Model
{

	protected $table = 'herramienta';
   protected $fillable = ['id', 'nombre',  'precio' ];
 
}
