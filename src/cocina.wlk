import comidas.*
import comensales.*

		/*>>> #{1,2,3,4}.difference(#{2,3})
				#{1, 4}
		*/

// provoleta, provoletaEspecial, hamburguesaDeCarne, hamburguesaVegetariana
// parrillada
object cocina{
	const property comidas = []

	method comidas(unaComida){comidas.add(unaComida)}
	method comidasTodas(lista){comidas.addAll(lista)}
	method SacarComidas(unaComida){comidas.remove(unaComida)}
	
	method comidasVegetarianas(){return comidas.filter({c => c.esAptoVegetariano() }).asSet()}
	
	method tieneBuenaOfertaVegetariana(){
		return self.comidasVegetarianas().difference(not self.comidasVegetarianas()).size()<= 2
	}
	method platoFuerteCarnivoro(){}
	method comidasQueLeGustan(){}
	method platoRandom(){}
	
	
}