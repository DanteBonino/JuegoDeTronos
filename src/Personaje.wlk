import excepciones.*
import Acompaniante.*

class Personaje inherits Acompaniante{
	const acompaniantes = new Set()
	const casa
	const conyuges = new List()
	var estaVivo = true
	
	/* Parte 1 */
	method estaSoltero() = conyuges.isEmpty()
	
	method esDe(unaCasa) = casa == unaCasa
	
	method casarseCon(otroPersonaje){
		self.validarQueSePuedanCasar(otroPersonaje)
		self.efectuarCasamientoCon(otroPersonaje)
	}
	
	method efectuarCasamientoCon(otroPersonaje){
		self.agregarConyuge(otroPersonaje)
		otroPersonaje.agregarConyuge(self)
	}
	
	method agregarConyuge(unPersonaje){
		conyuges.add(unPersonaje)
	}
	
	method validarQueSePuedanCasar(otroPersonaje){
		if(not (self.sePuedeCasarCon(otroPersonaje) and otroPersonaje.sePuedeCasarCon(self))) throw noSePuedeConsumarElCasamientoException
	}
	
	method sePuedeCasarCon(unPersonaje) = casa.sePuedeCasarCon(self, unPersonaje)
	
	/* Parte 2 */
	method  estaSolo() = acompaniantes.isEmpty()
	
	/* Test methods */
	method estaCasadoCon(unPersonaje) = conyuges.contains(unPersonaje)
	
	override method patrimonio() = casa.patrimonioPorPersona()
	
	override method agregarAcompaniante(unPersonaje){
		acompaniantes.add(unPersonaje)
	}
	
	method aliados() = self.armarListaDeAliados().asSet()
	
	method armarListaDeAliados() = [conyuges, acompaniantes, casa.miembros()].flatten()
	
	override method esPeligroso() = self.estaVivo() and self.cumpleAlgunaCondicionDePeligrosidad()
	
	method estaVivo() = estaVivo
	
	method cumpleAlgunaCondicionDePeligrosidad() = self.alianzaRica() or self.matrimonioBeneficiosoEconomicamente() or self.tieneAliadoPeligroso()
	
	method alianzaRica() = self.patrimonioDeAliados() >= 10000
	
	method patrimonioDeAliados() = self.aliados().sum{unAliado => unAliado.patrimonio()}
	
	method matrimonioBeneficiosoEconomicamente() = conyuges.all{unConyuge => unConyuge.perteneceACasaRica()}
	
	method perteneceACasaRica() = casa.esRica()
	
	method tieneAliadoPeligroso() = self.aliados().any{unAliado => unAliado.esPeligroso()}
	
	/* Parte 3 */
	method esAliado(unPersonaje) = self.aliados().contains(unPersonaje)
	
	method complotarContra(otroPersonaje)
	
	method morir(){
		estaVivo = false
	}
}

class Sutil inherits Personaje{
	override method complotarContra(otroPersonaje){
		
	}
}

class Asesino inherits Personaje{
	override method complotarContra(otroPersonaje){
		if(self.esObjetivoValido(otroPersonaje))
		self.matarA(otroPersonaje)
	}
	
	method esObjetivoValido(otroPersonaje)
	
	method matarA(otroPersonaje){
		otroPersonaje.morir()
	}
}

class AsesinoEstandar inherits Asesino{
	override method esObjetivoValido(otroPersonaje) = true
}

class AsesinoPrecavido inherits Asesino{
	override method esObjetivoValido(otroPersonaje) = otroPersonaje.estaSolo()
}

class Disipado inherits Personaje{
	
}

class Miedoso inherits Personaje{
	override method complotarContra(otroPersonaje){
		/* No hace nada */
	}
}

/* Preguntas a Juli:
 * 1) Método para conseguir aliados
 */