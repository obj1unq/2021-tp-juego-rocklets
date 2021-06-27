import wollok.game.*
import bob.*
import materialesObstaculosYExtras.*
import edificios.*
import objetosConstruibles.*
import randomizer.*


class Nivel {
	
	method iniciar() {
		game.addVisual(bob)
		config.configurarTeclas()
		config.configurarEdificios()
		config.configurarObstaculos()
		config.configurarColisiones()
		self.configuracionesPropiasDelNivel()
	}

	method configuracionesPropiasDelNivel()// metodo abstracto
	method ganarNivel()
}

object nivelCero inherits Nivel{
	
	method image() = "nivelCero.png"
	method position() = game.origin()
	
	override method configuracionesPropiasDelNivel(){
		sonidos.playMusic("musicaInicial.mp3")
		game.addVisual(self)
	}
	
	override method ganarNivel() {
		game.clear()
		sonidos.stopMusic()
		primerNivel.iniciar()
	}
	
	
}

object primerNivel inherits Nivel {

	override method ganarNivel() {
		sonidos.playMusic("musica.mp3")
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
		sonidos.playMusic("musica.mp3")
		config.configurarMaterialesAleatorios()
		self.mostrarObjetivos()
	}
	method mostrarObjetivos(){
		game.addVisual(mesa)
	}
	
	

}
object segundoNivel inherits Nivel {

	override method configuracionesPropiasDelNivel() {
		sonidos.playMusic("musica.mp3")
		config.configurarMaterialesAleatorios()
		bob.position(game.at(1,6))
		config.configurarParaNivelDos()
		config.configurarCaidaDeLadrillo()
		self.mostrarObjetivos()
	}
	
	override method ganarNivel() {
		fondoGanador.finDeJuego()
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

	method configurarTeclas() {
		keyboard.enter().onPressDo({nivelCero.ganarNivel()})
		keyboard.left().onPressDo({ bob.irA(bob.position().left(1))})
		keyboard.right().onPressDo({ bob.irA(bob.position().right(1))})
		keyboard.up().onPressDo({ bob.irA(bob.position().up(1))})
		keyboard.down().onPressDo({ bob.irA(bob.position().down(1))})
		keyboard.a().onPressDo({bob.construir(mesa)})
		
	}
	
	method configurarParaNivelDos(){
		keyboard.s().onPressDo({bob.construir(silla)})
		keyboard.d().onPressDo({bob.construir(martillo)})
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
		game.addVisual(new Obstaculo(image="agua.png",position= randomizer.emptyPosition() ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="agua.png",position= randomizer.emptyPosition() ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="agua.png",position= randomizer.emptyPosition() ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="agua.png",position= randomizer.emptyPosition() ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="agua.png",position= randomizer.emptyPosition() ,energiaQueQuita=bob.energia()))
		game.addVisual(new Obstaculo(image="hongo.png",position= randomizer.emptyPosition() ,energiaQueQuita=10))
		game.addVisual(new Obstaculo(image="hongo.png",position= randomizer.emptyPosition() ,energiaQueQuita=10))	
	}
	
	method configurarCaidaDeLadrillo() {
		game.onTick(1000, "ApareceLadrillo", {gestorDeLadrillos.generarNuevosLadrillos()})
		game.onTick(100, "GravedadLadrillo",{gestorDeLadrillos.avanzar()})
	}
}

<<<<<<< HEAD
object sonidos {
	var property musica
	var property soundOff=false
	
	method play(unSonido){
		if(not soundOff){
			game.sound(unSonido).play()}
	}
	
	method stopMusic(){
		musica.stop()
	}
	
	method playMusic(unaMusica){
		if(not soundOff){
			musica=game.sound(unaMusica)
			musica.shouldLoop(false)
			game.schedule(1000, {musica.play()})	
		}
	}

	
	method soundOff(booleano){
		soundOff=booleano
	}

}
=======
class Fondo {
	const property position = game.origin()
	const property image 
	method finDeJuego(){
		game.clear()
		game.addVisual(self)
		game.schedule(3000,{game.stop()})
	}
}
	const fondoGanador = new Fondo(image="win.png",position=game.origin())
	const fondoPerdedor = new Fondo(image="lose.png",position=game.origin())
>>>>>>> branch 'master' of https://github.com/obj1unq/2021-tp-juego-rocklets.git
