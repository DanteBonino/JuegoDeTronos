class Casa{
	var patrimonio
	const property miembros = new Set()
	
	method sePuedeCasarCon(unMiembro, otroPersonaje){
		return self.criterioDeAceptacion(unMiembro, otroPersonaje)
	}
	
	method criterioDeAceptacion(unMiembro, otroPersonaje){
		return true
	}
	
	method esRica() = patrimonio > 1000
	
	method patrimonioPorPersona() = patrimonio / miembros.size()
	
	method agregarMiembro(unMiembro){
		miembros.add(unMiembro)
	}
}

object lannister inherits Casa(patrimonio = 1000000){
	override method criterioDeAceptacion(unMiembro, _otroPersonaje) = unMiembro.estaSoltero()
}

object stark inherits Casa (patrimonio = 100000){
	override method criterioDeAceptacion(unMiembro, otroPersonaje) = not otroPersonaje.esDe(self)
}

object guardiaDeLaNoche inherits Casa (patrimonio = 900){
	override method criterioDeAceptacion(_unMiembro, _otroPersonaje) = false
}