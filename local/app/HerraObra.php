<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HerraObra extends Model
{

	protected $table = 'herra_obra';
   protected $fillable = ['id', 'id_obra', 'id_herramienta', 'cantidad' , 'precio'];
 
}
