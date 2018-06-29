<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MaterialObra extends Model
{

	protected $table = 'mat_obra';
   protected $fillable = ['id', 'id_obra', 'id_material', 'cantidad' , 'precio'];
 
}
