<?php
use App\cuenta;
use App\Http\Requests;

use Illuminate\Support\Facades\DB;
/**
 * Description of arbol
 *
 * @author MODESTO
 */
class arbol {
 private $_elements = array();
    public function get() {
       $query= DB::select("select*from cuenta");
     //$query= DB::select("select*from cuenta ");
        $this->_elements["masters"] = $this->_elements["childrens"] = array();
       
            foreach ($query as $element) {
                if ($element->id_padre== 0) {
                    array_push($this->_elements["masters"], $element);
                } else {
                    array_push($this->_elements["childrens"], $element);
                }
            
           
        }
        return $this->_elements;
    }
    public static function nested($rows = array(), $parent_id = 0) {
//echo json_encode($rows);
        $html = "";
        
        if (!empty($rows)) {
            $html.="<ul>";
            foreach ($rows as $row) {
                if ($row->id_padre == $parent_id) {
                    $html.="<li style='margin:5px 0px'>";
                    $html.="  <span><i class='fa fa-folder-open' aria-hidden='true'></i>";
                    $html.="<a href='#' data-status='{$row->hijo}' style='margin: 5px 6px' class='btn btn-warning btn-xs btn-folder'><i class=''></i>";

                    if ($row->hijo===1) {
                        $html.="<span style='color:white'><i class='fa fa-plus-circle' aria-hidden='true'></i><b>" .$row->codigo." ". $row->nombre . "</b></span></a>";
                    } else {
                         $html.="<span style='color:white'><i class='fa fa-minus-circle' aria-hidden='true'></i><b>" .$row->codigo." ". $row->nombre . "</b></span></a>";
                    }
                    
                    $html.=self::nested($rows, $row->id);
                    $html.="</li>";
                }
            }
            $html.="</ul>";
        }
     return $html;
    }

    public static function creararbol($idPadre, $Elementos, $Clase){
      $html = "";
      if (isset($Elementos['Padre'][$idPadre])) {
          $html .= "<ul ".$Clase.">";
          foreach ($Elementos['Padre'][$idPadre] as $itemId)
          {
              if(!isset($Elementos['Padre'][$itemId])) 
              {
                if($Elementos['Hijo'][$itemId]->utilizable == '1')
                {
                  $html .= "<li><a  class='Menu-Context' id='".$Elementos['Hijo'][$itemId]->id."' href='#'>".$Elementos['Hijo'][$itemId]->codigo." ".$Elementos['Hijo'][$itemId]->nombre."</a></li>";
                }
                else
                {
                  $html .= "<li><a class='Menu-Context' id='".$Elementos['Hijo'][$itemId]->id."' href='#'>".$Elementos['Hijo'][$itemId]->codigo." ".$Elementos['Hijo'][$itemId]->nombre."</a><ul class='file-tree'></ul></li>";
                }
              }
              if(isset($Elementos['Padre'][$itemId]))
              {
                $html .= "<li><a class='Menu-Context' id='".$Elementos['Hijo'][$itemId]->id."' href='#'>".$Elementos['Hijo'][$itemId]->codigo." ".$Elementos['Hijo'][$itemId]->nombre."</a>";
                $html .= arbol::creararbol($itemId, $Elementos,"");
                $html .= "</li>";
              }
          }
          $html .= "</ul>";
      }
      return $html;
    }


// function to create dynamic treeview menus
function createTreeView($parent, $menu) {
   $html = "";
   if (isset($menu['parents'][$parent])) {
      $html .= "
      <ol class='tree'>";
       foreach ($menu['parents'][$parent] as $itemId) {
          if(!isset($menu['parents'][$itemId])) {
             $html .= "<li><label for='subfolder2'>
                       <a href='".$menu['items'][$itemId]['link']."'>"
                       .$menu['items'][$itemId]['label']."</a></label>;
                       <input type='checkbox' name='subfolder2'/></li>";
          }
          if(isset($menu['parents'][$itemId])) {
             $html .= "<li><label for='subfolder2'>
                       <a href='".$menu['items'][$itemId]['link']."'>"
                       .$menu['items'][$itemId]['label']."</a></label>
                       <input type='checkbox' name='subfolder2'/>";
             $html .= createTreeView($itemId, $menu);
             $html .= "</li>";
          }
       }
       $html .= "</ol>";
   }
   return $html;
}

     public static function validar($tipo, $texto) {
        $texto = trim($texto);
        switch ($tipo) {
            case "texto":
                $expresion = '/^[A-Z üÜáéíóúÁÉÍÓÚñÑ]{1,50}$/i';
                if (!preg_match('/^[A-Z üÜáéíóúÁÉÍÓÚñÑ]{1,50}$/i', $texto)) {
                    return true;
                }

                break;
            case "vacio":
                if (strlen($texto) > 0) {
                    return true;
                }
                break;
            case "entero":
                if (!is_int($texto)) {
                    return true;
                }
                break;
            case "decimal":
                /* if(is_float($texto)){
                  return true;
                  } */
                return true;
                break;
            case "texto y entero":
                $expresion = "/^[0-9a-zA-Z\.\,\s-_º()=?¿/%$@!:;{}óíáéúñÍÁÉÚÓ]+$/";
                if (!preg_match($expresion, $texto)) {
                    return true;
                }
                break;
            case "correo":
                if (!filter_var($texto, FILTER_VALIDATE_EMAIL) === false) {
                    return true;
                }
                break;
        }
        return false;
    }
}

?>