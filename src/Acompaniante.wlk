import excepciones.*

class Acompaniante{
	
	method formarAlianza(unAcompaniante){
		self.agregarAcompaniante(unAcompaniante)
		unAcompaniante.agregarAcompaniante(self)
	}
	
	method agregarAcompaniante(unAcompaniante)
	
	method patrimonio()
	
	method esPeligroso()
}

class Animal{
	method patrimonio() = 0
	method esPeligroso() = false
	
	method agregarAcompaniante(){
		/* No hace nada */
	}
}


class AnimalPeligroso inherits Animal{
	override method esPeligroso() = true
}

class Dragon inherits AnimalPeligroso{
	
}

class LoboGuargo inherits AnimalPeligroso{}

/* Preguntas a Juli:
 * Está bien la clase acompaniante? Necesito que la lógica de formar una alianza, el tema es que no te dice nada de los animales y sus acompañiantes, entonces no sé si tomarlos como que pueden tener acompñiantes
 * o que sólo entiendan el mensaje agregarAcompañiante que no haga nada y listo. Si es asi no tiene sentido la clase pq no hay comportamiento compartid, sólo la interfaz
 */