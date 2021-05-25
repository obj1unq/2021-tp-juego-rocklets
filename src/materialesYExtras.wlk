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
		const materialesPosibles = [madera, metal, piedra]
		const materialActual = materialesPosibles.anyOne()
		if (not materialesEnJuego.contains(materialActual)){
			self.agregarMaterial(materialActual)
		}
	}
	
    method crearAleatoriamente(material){
    	return material.position(randomizer.emptyPosition())
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
		self.crearAleatoriamente(material)
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

object piedra {
	var property position
	
	method image() = "piedra.png"
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}
}

object madera {
	var property position
	
	method image() = "madera.png"	
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}

}

object metal {
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

class LugaresDeDescanso{
	const property image = null 
	const property position = null 
	const property energiaQueAporta = null
	
	method teEncontro(elConstructor) {
		elConstructor.sumarEnergia(self)
	}
}


object mesa {
	const property image = "mesa.png" 
	const property position = bob.position()
	
	const property materialesNecesarios = [madera, piedra]
	
	method puedeConstruirse() {
		return materialesNecesarios.all({material=>bob.materialesGuardados().contains(material)})
	}
	
	method teEncontro(elConstructor) {
	}
}


