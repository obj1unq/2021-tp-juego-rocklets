import wollok.game.*
import bob.*
import materialesYExtras.*
import edificios.*
import objetosConstruibles.*


object nivelUnico {
	
	method iniciar(){
	game.addVisual(bob)
	game.addVisual(new LugaresDeDescanso (position=game.at(0,0), image="casa.png"))
	game.addVisual(new LugaresDeDescanso (position=game.at(12,10), image="hotel5e.png"))
	game.addVisual(fabrica)
	config.configurarTeclas()
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
	
	method configurarColisiones() {
		game.onCollideDo(bob, { algo => algo.teEncontro(bob) })
	}
	
	method configurarMaterialesAleatorios(){
		game.onTick(200, "MATERIAL", { gestorDeMateriales.agregarMaterialesSiRequiere() })
	}

}
