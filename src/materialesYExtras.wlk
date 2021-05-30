import wollok.game.*
import randomizer.*
import bob.*

object gestorDeMaterialesEnTablero {
	const materialesEnJuego = []

	method agregarMaterialesSiRequiere() {
		if (not self.estaLlenoDeMateriales()) {
			self.agregarNuevoMaterial()
		}
    }
	
	method agregarNuevoMaterial() {
		const materialesPosibles = [madera,metal,piedra]
		const materialPorAgregar = materialesPosibles.anyOne()
		self.agregarMaterial(new Material(tipo = materialPorAgregar, position = randomizer.emptyPosition(), image = materialPorAgregar.image()))
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

class Material{
	const property tipo
	var property position
	const property image 
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}
	method serRecogidoPorConstructor(){
		gestorDeMaterialesAdquiridos.recoger(self)
	}
	method serRemovido(){
		gestorDeMaterialesAdquiridos.remover(self)
	}
}

object piedra {method image() = "piedra.png"}

object madera { method image() = "madera.png"}

object metal { method image() = "metal.png"}

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
		[new Ladrillo (position=game.at(3,12)),new  Ladrillo(position=game.at(6,12)), new Ladrillo(position=game.at(10,12))]
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
		game.say(bob,"Ouch, eso dolió.")
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
	
	const materialesAdquiridos = []
	
	method cantidadDePiezasDe(unTipoDeMaterial){
		return materialesAdquiridos.count({material => material.tipo() == unTipoDeMaterial})
	}

	method remover(unTipoDeMaterial) {
		const materialARemover = materialesAdquiridos.find({material => material.tipo() == unTipoDeMaterial}) 
		materialesAdquiridos.remove(materialARemover)
	}
	
	method recoger(unMaterial){
		materialesAdquiridos.add(unMaterial)
	}

	method puedoConstruir(unObjeto) {
		return (self.cantidadDePiezasDe(metal)>=unObjeto.metalNecesario() and
			self.cantidadDePiezasDe(madera)>=unObjeto.maderaNecesaria() and
			self.cantidadDePiezasDe(piedra)>=unObjeto.piedraNecesaria()
		)
	}
	method gastarMaterialesNecesariosPara(unObjeto) {
		unObjeto.metalNecesario().times({ iteracion => self.remover(metal)})
		unObjeto.piedraNecesaria().times({ iteracion => self.remover(piedra)})
		unObjeto.maderaNecesaria().times({ iteracion => self.remover(madera)})
	}
}
