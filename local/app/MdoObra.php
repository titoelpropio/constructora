<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MdoObra extends Model
{

	protected $table = 'mdo_obra';
   protected $fillable = ['id', 'cantidad', 'precio' ,'id_obra','id_mano_de_obra'];
 
}
