<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ManoObra extends Model
{

	protected $table = 'mano_de_obra';
   protected $fillable = ['id', 'nombre', 'pago' ];
 
}
