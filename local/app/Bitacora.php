<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bitacora extends Model
{

	protected $table = 'bitacora';
   protected $fillable = ['id', 'cantidad', 'iduser', 'fecha_registro', 'idobjeto'];
 
}
