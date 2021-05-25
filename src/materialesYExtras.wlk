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
}

class Madera {
	var property position
	
	method image() = "madera.png"	
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}

}

class Metal {
    var property position 
    
	method image() = "metal.png"	
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}

}

class Obstaculos {	
	const property image = null 
	const property position = null 
	const property energiaQueQuita = null
	
	method teEncontro(elConstructor) {
		elConstructor.restarEnergia(self)
	}
}


