import wollok.game.*
import bob.*
import materialesYExtras.*
import edificios.*
import objetosConstruibles.*


object primerNivel {
	
	method iniciar(){
	game.addVisual(bob)
	config.configurarTeclas()
	config.configurarEdificios()
	config.configurarObstaculos()
	config.configurarColisiones()
	config.configurarMaterialesAleatorios() 
	}
	
	method terminar() {
		game.clear()
		segundoNivel.iniciar()
	}
	
}

object segundoNivel {

	method iniciar() {
	game.addVisual(bob)
	config.configurarTeclas()
	config.configurarEdificios()
	config.configurarObstaculos()
	config.configurarColisiones()
	config.configurarMaterialesAleatorios() 
	config.configurarCaidaDeLadrillo()
	}

	method terminar() {
		game.stop()
	}

}


object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ bob.irA(bob.position().left(1))})
		keyboard.right().onPressDo({ bob.irA(bob.position().right(1))})
		keyboard.up().onPressDo({ bob.irA(bob.position().up(1))})
		keyboard.down().onPressDo({ bob.irA(bob.position().down(1))})
		keyboard.a().onPressDo({bob.construir(mesa)})
		keyboard.s().onPressDo({bob.construir(silla)})
		keyboard.d().onPressDo({bob.construir(martillo)})
	}
	
	method configurarEdificios(){
		game.addVisual(new AreaDeDescanso (image="hotel3e.png",position = game.at(12, 10), energiaQueAporta=10))
		game.addVisual(new AreaDeDescanso (image="hotel5e.png",position = game.at(1, 9), energiaQueAporta=50))
		game.addVisual(new AreaDeDescanso (image="casa.png",position = game.at(0, 1), energiaQueAporta=80))
		game.addVisual(fabrica)
	}
	
	method configurarColisiones() {
		game.onCollideDo(bob, { algo => algo.teEncontro(bob) })
	}
	
	method configurarMaterialesAleatorios(){
		game.onTick(200, "MATERIAL", { gestorDeMateriales.agregarMaterialesSiRequiere() })
	}
	method configurarObstaculos() {
		game.addVisual(new Obstaculo(image="agua.png",position=game.at(6,3) ,energiaQueQuita=bob.energia()))
	}
	
	method configurarCaidaDeLadrillo() {
		game.onTick(1000, "ApareceLadrillo", {gestorDeLadrillos.generarNuevosLadrillos()})
		game.onTick(100, "GravedadLadrillo",{gestorDeLadrillos.avanzar()})
	}
}
