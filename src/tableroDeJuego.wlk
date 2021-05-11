import wollok.game.*
import materiales.*
import Constructor.*

object nivelUnico {
	
	method iniciar(){
	game.addVisual(metal)
	game.addVisual(madera)
	game.addVisual(piedra)
	
	config.configurarTeclas()
	
	}
}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ bob.irA(bob.position().left(1))})
		keyboard.right().onPressDo({ bob.irA(bob.position().right(1))})
		keyboard.up().onPressDo({ bob.irA(bob.position().up(1))})
		keyboard.down().onPressDo({ bob.irA(bob.position().down(1))})
		
	}

}