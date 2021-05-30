import wollok.game.*
import randomizer.*
import bob.*

object gestorDeMateriales {
	const materialesEnJuego = []

	method agregarMaterialesSiRequiere() {
		if (not self.estaLlenoDeMateriales()) {
			self.agregarNuevoMaterial()
		}
    }
	
	method agregarNuevoMaterial() {
		const materialesPosibles = [self.crearMaderaAleatoriamente(),self.crearMetalAleatoriamente(), self.crearPiedraAleatoriamente()]
		const materialActual = materialesPosibles.anyOne()
		self.agregarMaterial(materialActual)
	}
	
    method crearMaderaAleatoriamente(){
    	return new Madera(position = randomizer.emptyPosition())
    }
    method crearMetalAleatoriamente(){
    	return new Metal(position = randomizer.emptyPosition())
    }
    method crearPiedraAleatoriamente(){
    	return new Piedra(position = randomizer.emptyPosition())
    }
    
	method estaLlenoDeMateriales() {
		return self.cantidadDeMateriales() >= 10
	}
	
	method cantidadDeMateriales() {
		return materialesEnJuego.size() 
	}
	
	method materialExistente() {
		return materialesEnJuego.anyOne() 
	}
	
	method agregarMaterial(material) {
		materialesEnJuego.add(material)
		game.addVisual(material) 
	}
	
	method removerMaterial(material) {
		materialesEnJuego.remove(material)
		game.removeVisual(material) 
	}
	
	method existeMaterial(material) {
		return materialesEnJuego.contains(material) 
	}
}

class Piedra {
	
	var property position
	
	method image() = "piedra.png"
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}
	
	method serRecogidoPorConstructor(){
		gestorDeMaterialesAdquiridos.recogerPiedra(self)
	}
	method serRemovido(){
		gestorDeMaterialesAdquiridos.removerPiedra(self)
	}
}

class Madera {
	var property position
	
	method image() = "madera.png"	
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}
	method serRecogidoPorConstructor(){
		gestorDeMaterialesAdquiridos.recogerMadera(self)
	}
	method serRemovido(){
		gestorDeMaterialesAdquiridos.removerMadera(self)
	}

}

class Metal {
    var property position 
    
	method image() = "metal.png"	
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}
	method serRecogidoPorConstructor(){
		gestorDeMaterialesAdquiridos.recogerMetal(self)
	}
	method serRemovido(){
		gestorDeMaterialesAdquiridos.removerMetal(self)
	}

}

class Obstaculo {	
	const property image = null 
	const property position = null 
	const property energiaQueQuita = null
	method teEncontro(elConstructor) {
		elConstructor.restarEnergia(self)
	}
}

object gestorDeLadrillos{
	const ladrillo1 = new Ladrillo (position=game.at(3,12))
	const ladrillo2 = new Ladrillo(position=game.at(6,12))
	const ladrillo3 = new Ladrillo(position=game.at(10,12))
	
	const property ladrillos = [ladrillo1, ladrillo2, ladrillo3]
	const property ladrillosGenerados = [] 
	
	method agregarNuevoLadrilloSiRequiere() {
		if ( ladrillosGenerados.isEmpty()) {
			self.generarNuevosLadrillos()
		}
	}
	
	method generarNuevosLadrillos() {
		const ladrillosPosibles = 
		[new Ladrillo (position=game.at(3,12)),new  Ladrillo(position=game.at(6,10)), new Ladrillo(position=game.at(10,12))]
		ladrillosPosibles.forEach({ladrillo=>ladrillosGenerados.add(ladrillo)})
		ladrillosPosibles.forEach({ladrillo=> game.addVisual(ladrillo)})
	 }

	method avanzar(){
		ladrillosGenerados.forEach( {ladrillo => ladrillo.caerSiEstaEnElAire()})
	}
}

class Ladrillo{
	var property position 
    const property energiaQueQuita = 25
    
	method image() = "ladrillo.png"	
	
	method teEncontro(elConstructor) {
		elConstructor.restarEnergia(self)
	}

	method caerSiEstaEnElAire() {
		if (not self.estaEnElPiso()) {
			position = position.down(1) 
		}
		else{
			game.removeVisual(self)
			gestorDeLadrillos.ladrillosGenerados().remove(self)
		}
		
	}

	method estaEnElPiso() {
		return position.y() == 0 
	}
	
}

object gestorDeMaterialesAdquiridos{
	
	const piezasDeMadera = []
	const piezasDePiedra = []
	const piezasDeMetal = []
	
	method cantidadDePiezasDeMetal(){
		return piezasDeMetal.size()
	}
	method cantidadDePiezasDeMadera(){
		return piezasDeMadera.size()
	}
	method cantidadDePiezasDePiedra(){
		return piezasDePiedra.size()
	}
	method recogerPiedra(unaPiedra){
		piezasDePiedra.add(unaPiedra)
	}
	method recogerMadera(unaMadera){
		piezasDeMadera.add(unaMadera)
	}
	method recogerMetal(unMetal){
		piezasDeMetal.add(unMetal)
	}
	method removerMetal(unMetal) {
		piezasDeMetal.remove(unMetal) 
	}
	method removerPiedra(unaPiedra) {
		piezasDePiedra.remove(unaPiedra) 
	}
	method removerMadera(unaMadera) {
		piezasDeMadera.remove(unaMadera) 
	}
	
	method puedoConstruir(unObjeto) {
		return (self.cantidadDePiezasDeMetal()>=unObjeto.metalNecesario() and
			self.cantidadDePiezasDeMadera()>=unObjeto.maderaNecesaria() and
			self.cantidadDePiezasDePiedra()>=unObjeto.piedraNecesaria()
		)
	}
	method gastarMaterialesNecesariosPara(param1) {
		
	}
}
