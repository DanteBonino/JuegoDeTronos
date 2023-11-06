class Conspiracion{
	const objetivo
	const complotadores
	var seEjecuto = false
	
	method cantidadDeTraidores() = complotadores.count{unComplotador => objetivo.esAliado(unComplotador)}
	
	method ejecutarse(){
		complotadores.forEach{unComplotado => unComplotado.complotarContra(objetivo)}
		seEjecuto = true
	}
	
	method seCumplioObjetivo() = seEjecuto and not objetivo.esPeligroso()
}

object constructorConspiraciones{
	method create(unPersonaje, complotados){
		return new Conspiracion(objetivo = unPersonaje, complotadores = complotados)
	}
}
/* Preguntas a Juli:
 * 1) Método para conseguir aliados
 */