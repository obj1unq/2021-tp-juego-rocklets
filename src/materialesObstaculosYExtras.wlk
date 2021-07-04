import wollok.game.*
import randomizer.*
import bob.*
import objetosConstruibles.*

class Material{
	const property tipo
	var property position
	
	method image(){
		return tipo.image()
	}
	
	method teEncontro(elConstructor) {
		elConstructor.agarrarYQuitarMaterialDelCamino(self)
	}
	method serRecogidoPorConstructor(){
		gestorDeMaterialesAdquiridos.recoger(self)
	}
	method ubicacarEnInventario(){
		position = randomizer.emptyPositionInColumn(tipo.columnaEnElInventario())
	}
}

object piedra{
	method image() = "piedra.png"
	
	method columnaEnElInventario(){
		return 17
	}
}

object madera { 
	method image() = "madera.png"
	method columnaEnElInventario(){
		return 16
	}
}

object metal { 
	method image() = "metal.png"
	method columnaEnElInventario(){
		return 15
	}
}

class Obstaculo {	
	var property image= null
	var property position = randomizer.emptyPosition()
	var property energiaQueQuita = bob.energia()
	
	method teEncontro(elConstructor) {
		elConstructor.restarEnergia(self)
	}
	
}

class Agua inherits Obstaculo{
	override method image()= "agua.png"
	
	override method teEncontro(elConstructor){
		game.say(bob,"No se nadar")
		super(elConstructor)
	}
}

class Hongo inherits Obstaculo{
	
	override method energiaQueQuita(){
		return 10
	}
	
	override method image()="hongo.png"
	
	override method teEncontro(elConstructor){
		game.say(bob,"No debí comer eso.")
		game.removeVisual(self)
		super(elConstructor) 
	}
}

object gestorDeLadrillos{

	const property ladrillosGenerados = [] 
	
	method agregarNuevoLadrilloSiRequiere() {
		if (ladrillosGenerados.isEmpty()) {
			self.generarNuevosLadrillos()
		}
	}
	
	method generarNuevosLadrillos() {
		const nuevosLadrillos = 
		[new Ladrillo (position=game.at(3,11)),new  Ladrillo(position=game.at(6,11)), new Ladrillo(position=game.at(10,11))]
		nuevosLadrillos.forEach({ladrillo=>ladrillosGenerados.add(ladrillo)})
		nuevosLadrillos.forEach({ladrillo=> game.addVisual(ladrillo)})
	 }

	method avanzar(){
		ladrillosGenerados.forEach( {ladrillo => ladrillo.caerSiEstaEnElAire()})
	}
}

class Ladrillo inherits Obstaculo{
    
    override method energiaQueQuita(){
    	 return 25	 
    }
    
	override method image() = "ladrillo.png"	
	
	override method teEncontro(elConstructor) {
		game.say(bob,"Ouch, eso dolió.")
		super(elConstructor)
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

object gestorDeMaterialesEnTablero {
	const materialesEnJuego = []

	method agregarMaterialesSiRequiere() {
		if (not self.estaLlenoDeMateriales()) {
			self.agregarNuevoMaterial()
		}
    }
	method clear(){
	   materialesEnJuego.clear()	
	}
	
	method agregarNuevoMaterial() {
		const materialesPosibles = [madera,metal,piedra]
		const materialPorAgregar = materialesPosibles.anyOne()
		self.agregarMaterial(new Material(tipo = materialPorAgregar, position = randomizer.emptyPosition()))
	}
	
	method estaLlenoDeMateriales() {
		return self.cantidadDeMateriales() >= 10
	}
	
	method cantidadDeMateriales() {
		return materialesEnJuego.size() 
	}
	
	method agregarMaterial(material) {
		materialesEnJuego.add(material)
		game.addVisual(material) 
	}
	
	method removerMaterial(material) {
		materialesEnJuego.remove(material)
		game.removeVisual(material) 
	}
}

object gestorDeMaterialesAdquiridos{
	
	var property  materialesAdquiridos = []
	
	method clear(){
		materialesAdquiridos.clear()
	}
	
	method cantidadDePiezasDe(unTipoDeMaterial){
		return materialesAdquiridos.count({material => material.tipo() == unTipoDeMaterial})
	}

	method remover(unTipoDeMaterial) {
		const materialARemover = materialesAdquiridos.find({material => material.tipo() == unTipoDeMaterial}) 
		game.removeVisual(materialARemover)
		materialesAdquiridos.remove(materialARemover)
	}
	
	method recoger(unMaterial){
		unMaterial.ubicacarEnInventario()  // agregar el material al panel derecho
		materialesAdquiridos.add(unMaterial)
		game.addVisual(unMaterial)
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

	method construir(unObjeto){
		self.validarSiElObjetoYaFueConstruido(unObjeto)
		self.gastarMaterialesNecesariosPara(unObjeto)
		gestorDeObjetivos.seContruyeElObjeto(unObjeto)
	}
	method hayEspacioParaMas(unMaterial){
		return self.cantidadDe(unMaterial) != self.cantidadMaximaDeUnidadesPorMaterial()
	}
	
	method cantidadDe(unMaterial){
		return materialesAdquiridos.count({material => material.tipo() == unMaterial.tipo()})
	}
	method cantidadMaximaDeUnidadesPorMaterial(){
		return game.height() - 3 //el inventario son las posiciones de una columna menos los encabezados
	}
	method validarSiElObjetoYaFueConstruido(objeto) {
		if (objeto.fuisteConstruido()){
			bob.error("ya está construido")
		}
	}
}