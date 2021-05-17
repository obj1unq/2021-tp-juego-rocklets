import wollok.game.*
import bob.*
import materialesYExtras.*

const madera1 = new Material (nombre="madera",position=game.at(1, 9), image="madera.png")
const madera2 = new Material (nombre="madera",position=game.at(5, 9), image="madera.png")
const madera3 = new Material (nombre="madera",position=game.at(2, 7), image="madera.png")
const piedra1 = new Material (nombre="piedra",position=game.at(2, 4), image="piedra.png")
const piedra2 = new Material (nombre="piedra",position=game.at(3, 14), image="piedra.png")
const piedra3 = new Material (nombre="piedra",position=game.at(12, 5), image="piedra.png")
const metal1 = new Material (nombre="metal",position=game.at(8, 13), image="metal.png")
const metal2 = new Material (nombre="metal",position=game.at(7, 5), image="metal.png")
const metal3 = new Material (nombre="metal",position=game.at(9, 5), image="metal.png")
const hongo1 = new Obstaculos (nombre="hongo", position=game.at(5, 5), image="hongo.png")
const hongo2 = new Obstaculos (nombre="hongo", position=game.at(8, 8), image="hongo.png")
const agua1 = new Obstaculos (nombre="agua", position=game.at(8, 2), image="agua.png")
const agua2 = new Obstaculos (nombre="agua", position=game.at(4, 10), image="agua.png")	
	

object nivelUnico {
	
	method iniciar(){
	game.addVisual(madera1)
	game.addVisual(madera2)
	game.addVisual(madera3)
	game.addVisual(piedra1)
	game.addVisual(piedra2)
	game.addVisual(piedra3)
	game.addVisual(metal1)
	game.addVisual(metal2)
	game.addVisual(metal3)
	game.addVisual(hongo1)
	game.addVisual(hongo2)
	game.addVisual(agua1)
	game.addVisual(agua2)
	game.addVisual(bob)
	config.configurarTeclas()
	
	}
}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ bob.irA(bob.position().left(1))})
		keyboard.right().onPressDo({ bob.irA(bob.position().right(1))})
		keyboard.up().onPressDo({ bob.irA(bob.position().up(1))})
		keyboard.down().onPressDo({ bob.irA(bob.position().down(1))})
		keyboard.space().onPressDo({bob.agarrarYQuitarMaterialDelCamino()})
		
	}

}
