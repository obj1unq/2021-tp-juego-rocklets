import wollok.game.*
import bob.*

object randomizer {
		
	method position() {
		return 	game.at( 
					(0 .. game.width()  - 4).anyOne(),
					(0 .. game.height() - 2).anyOne()) //-2 por el banner superior 
	}
	
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}
	
	method posicionVaciaEnInventarioDe(unTipoDeMaterial) {
		const position = self.posicionEnColumna(unTipoDeMaterial.columnaEnElInventario())
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.posicionVaciaEnInventarioDe(unTipoDeMaterial)
		} 
	}
	
	method posicionEnColumna(numeroDeColumna){
		const numeroDeFila = (0 .. self.maximaPosicionDeFila()).anyOne()
		return 	game.at(numeroDeColumna,numeroDeFila)
	}
	
	method maximaPosicionDeFila(){	
		return game.height()-4	
	}
}
