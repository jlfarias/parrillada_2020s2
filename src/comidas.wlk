class Comida {
	//var property peso
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante()
}

class Provoleta inherits Comida {
	var property especias = false
	
	override method esAptoVegetariano(){ return especias }	
	method esEspecial() {return especias or self.esAbundante()}
	
	override method valoracion(){ 
		return if (self.esEspecial()) {120} else {80}
	}
}

class HamburguesaDeCarne inherits Comida {
	var property tipoDePan
	var peso = 0
	method setPeso(){ peso = 250 }
	override method peso(){return peso}
	
	override method esAptoVegetariano(){return false}
	override method valoracion(){
		return 60 + tipoDePan.valoracion()
	}
	override method esAbundante(){ return peso > 250}
}

object panIndustrial{
	method valoracion(){ return 0 }
}
object panCasero{
	method valoracion(){ return 20 }
}
object panDeMasaMadre {
	method valoracion(){ return 45 }
}

class HamburguesaVegetarinas inherits HamburguesaDeCarne {
	var property legumbre = "lentejas"
	
	override method valoracion(){
		return super() + (2 * legumbre.size()).min(17)
	}
}


class Parrillada inherits Comida {
	const property cortes = []
	
	override method peso(){
		cortes.sum({ p => p.peso() })
	}
	override method esAptoVegetariano(){ return false }
	
	method maximaCalidad(){return cortes.sum({ cal => cal.calidad() }) }
	
	override method valoracion(){ return 15 * self.maximaCalidad() - cortes.size() }
	override method esAbundante(){ return peso > 250}
}

class Cortes inherits Comida{
	var property calidad
	var peso = 0
	method setPeso(){ peso = 250 }
	override method peso(){return peso}
	override method esAptoVegetariano(){ return false}
}






