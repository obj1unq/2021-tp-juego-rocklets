import wollok.game.*
import randomizer.*

object gestorDeMateriales {
	const materialesEnJuego = []
	
	method agregarMaterialesSiRequiere() {
		if (not self.estaLlenoDeMateriales()) {
			self.agregarNuevoMaterial()
		}
	}
	
	method agregarNuevoMaterial() {
		const materialesPosibles = [
			self.crearPiedraAleatoria(),
			self.crearMetalAleatorio(),
			self.crearMaderaAleatoria()
		]
		const nuevoMaterial = materialesPosibles.anyOne()
		self.agregarMaterial(nuevoMaterial)
	}
	
	method crearPiedraAleatoria() {
		return new Piedra(position = randomizer.emptyPosition())
	}
	
	method crearMetalAleatorio() {
		return new Metal(position = randomizer.emptyPosition())
	}
	
	method crearMaderaAleatoria() {
		return new Madera (position = randomizer.emptyPosition())
	}
	
	method estaLlenoDeMateriales() {
		return self.cantidadDeComidas() >= 10
	}
	
	method cantidadDeComidas() {
		return materialesEnJuego.size() 
	}
	
	method comidaExistente() {
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
	const property position

	method image() = "piedra.png"

	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}
}

class Madera {
	const property position

	method image() = "madera.png"	
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}

}

class Metal {
	const property position

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

