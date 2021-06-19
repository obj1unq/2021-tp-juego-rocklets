import wollok.game.*
import bob.*
import materialesObstaculosYExtras.*
import edificios.*
import objetosConstruibles.*


class Nivel {

	method iniciar() {
		game.addVisual(bob)
		config.configurarTeclas()
		config.configurarEdificios()
		config.configurarObstaculos()
		config.configurarColisiones()
		config.configurarMaterialesAleatorios()
		self.configuracionesPropiasDelNivel()
	}

	method configuracionesPropiasDelNivel()// metodo abstracto
	method ganarNivel()
}

object primerNivel inherits Nivel {

	override method ganarNivel() {
		game.clear()
		segundoNivel.iniciar()
		gestorDeMaterialesEnTablero.clear()
		gestorDeMaterialesAdquiridos.clear()
		gestorDeObjetosConstruidos.nivelActual(segundoNivel)
	}

	method objetosAConstruirParaGanar() {
		return #{mesa}
	}
	override method configuracionesPropiasDelNivel() {
		self.mostrarObjetivos()
	}
	method mostrarObjetivos(){
		game.addVisual(mesa)
	}

}
object segundoNivel inherits Nivel {

	override method configuracionesPropiasDelNivel() {
		bob.position(game.at(1,6))
		config.configurarParaNivelDos()
		config.configurarCaidaDeLadrillo()
		self.mostrarObjetivos()
	}
	
	override method ganarNivel() {
		game.schedule(2000,{game.stop()})
	}

	method objetosAConstruirParaGanar() {
		return #{ mesa, silla, martillo }
	}
	method mostrarObjetivos(){
		game.addVisual(mesa)
		game.addVisual(silla)
		game.addVisual(martillo)
	}
}


object config {
	method configurarParaNivelDos(){
		keyboard.s().onPressDo({bob.construir(silla)})
		keyboard.d().onPressDo({bob.construir(martillo)})
	}
	method configurarTeclas() {
		keyboard.left().onPressDo({ bob.irA(bob.position().left(1))})
		keyboard.right().onPressDo({ bob.irA(bob.position().right(1))})
		keyboard.up().onPressDo({ bob.irA(bob.position().up(1))})
		keyboard.down().onPressDo({ bob.irA(bob.position().down(1))})
		keyboard.a().onPressDo({bob.construir(mesa)})
	}
	
	method configurarEdificios(){
		game.addVisual(new HotelTresEstrellas (image="hotel3e.png",position = game.at(14, 8)))
		game.addVisual(new HotelCincoEstrellas (image="hotel5e.png",position = game.at(1, 9)))
		game.addVisual(new Hogar (image="casa.png",position = game.at(0, 1)))
		game.addVisual(fabrica)
	}
	
	method configurarColisiones() {
		game.onCollideDo(bob, { algo => algo.teEncontro(bob) })
	}
	
	method configurarMaterialesAleatorios(){
		game.onTick(200, "MATERIAL", { gestorDeMaterialesEnTablero.agregarMaterialesSiRequiere() })
	}
	method configurarObstaculos() {
		game.addVisual(new Obstaculo(image="agua.png",position=game.at(11,8) ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="agua.png",position=game.at(10,8) ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="agua.png",position=game.at(9,8) ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="agua.png",position=game.at(6,9) ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="agua.png",position=game.at(6,10) ,energiaQueQuita=bob.energia()))
	}
	
	method configurarCaidaDeLadrillo() {
		game.onTick(1000, "ApareceLadrillo", {gestorDeLadrillos.generarNuevosLadrillos()})
		game.onTick(100, "GravedadLadrillo",{gestorDeLadrillos.avanzar()})
	}
}
