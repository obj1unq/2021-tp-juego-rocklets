import wollok.game.*
import bob.*
import materialesYExtras.*
import edificios.*
import objetosConstruibles.*


object nivelUnico {
	
	method iniciar(){
	game.addVisual(bob)

	config.configurarTeclas()
	config.configurarEdificios()
	config.configurarColisiones()
	config.configurarMaterialesAleatorios() 
	}
	
	
}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ bob.irA(bob.position().left(1))})
		keyboard.right().onPressDo({ bob.irA(bob.position().right(1))})
		keyboard.up().onPressDo({ bob.irA(bob.position().up(1))})
		keyboard.down().onPressDo({ bob.irA(bob.position().down(1))})
		keyboard.m().onPressDo({bob.construir(mesa)})
	}
	
	method configurarEdificios(){
		game.addVisual(casa)
		game.addVisual(hotelCincoEstrellas)
		game.addVisual(hotelTresEstrellas)
		game.addVisual(fabrica)
	}
	
	method configurarColisiones() {
		game.onCollideDo(bob, { algo => algo.teEncontro(bob) })
	}
	
	method configurarMaterialesAleatorios(){
		game.onTick(200, "MATERIAL", { gestorDeMateriales.agregarMaterialesSiRequiere() })
	}

}
