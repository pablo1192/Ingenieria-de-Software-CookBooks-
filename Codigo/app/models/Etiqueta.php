<?php

class Etiqueta extends Eloquent  
{

	protected $table = 'etiqueta';
	protected $fillable = ['nombre'];
	
	//libros de una etiqueta
	public function libros(){
        return $this->belongsToMany('Libro', 'libroetiqueta', 'etiqueta_id', 'libro_id');
    }
	
	public static function agregarEtiqueta($input){
        // función que recibe como parámetro la información del formulario para crear la etiqueta
        
        $respuesta = array();
        
        // Declaramos reglas para validar que el nombre  sea obligatorio
        $reglas =  array(
            'nombre'  => array('required', 'max:100','unique:etiqueta,nombre,1','alpha'),   
        );
                
        $validator = Validator::make($input, $reglas);
        
        // verificamos que los datos cumplan la validación 
        if ($validator->fails()){
            
            // si no cumple las reglas se van a devolver los errores al controlador 
            $respuesta['mensaje'] = $validator;
            $respuesta['error']   = true;
        }else{
        
            // en caso de cumplir las reglas se crea el objeto Etiqueta
            $etiqueta = static::create($input);        
            
            // se retorna un mensaje de éxito al controlador
            $respuesta['mensaje'] = 'Etiqueta creada!';
            $respuesta['error']   = false;
            $respuesta['data']    = $etiqueta;
        }     
        
        return $respuesta; 
    }
  public static function reglasDeValidacion(){
		//Solo letras como minimo 5, q sea unico y no vacio..
		return ['nombre'=>['alpha','min:5','required','unique:etiqueta,nombre,1']];
	}
	
	//agrego al modelo la funcion disponibles, la cual ignora el "Sin Etiqueta"
	//ni las etiquetas borradas logicamente
	public function scopeDisponibles($query){
		return $query->where('id','<>',1)->where('dadoDeBaja','=',0);
	}
	
	public function scopeNoDisponibles($query){
		return $query->where('id','<>',1)->where('dadoDeBaja','=',1);
	}
	
	//Restaura un registro
	//True=Si efectivamente lo hizo (xq existe), False caso contrario.
	public static function restaurar($nombre){
		return (boolean) (DB::table('etiqueta')->where('nombre','=',$nombre)->where('dadoDeBaja','=',1)->update(['dadoDeBaja'=>0]));
	}
}
?>
