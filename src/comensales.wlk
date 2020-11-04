import comidas.*

class Comensal {
	var property comidas = []
	var property peso = 0
	
	method leAgrada(unaComida)
	method comidasQueComio(){return comidas}
	method comer(unaComida){ comidas.add(unaComida)}
	
	method cantidadComida(){ return comidas.sum({ c => c.peso() })}
	method satisfecho(){ return self.cantidadComida() >= peso * 0.01 }
}

class Vegetariano inherits Comensal{
	
	override method leAgrada(unaComida){
		return unaComida.esAptoVegetariano() 
			and unaComida.valoracion() > 85
	}
	
	override method satisfecho(){
		return super() and not comidas.all({ a => a.esAbundante()})
	}
}

class HambrePopular inherits Comensal{
	override method leAgrada(unaComida){
		unaComida.peso().between(150,300)
	}
}

class DePaladarFino inherits Comensal{
		override method leAgrada(unaComida){
		unaComida.esAbundante()
	}
		
		override method satisfecho(){
		return super() and comidas.size().even()
	}
}