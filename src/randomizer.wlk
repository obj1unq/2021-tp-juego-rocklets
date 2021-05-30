import wollok.game.*

object randomizer {
		
	method position() {
		return 	game.at( 
					(0 .. game.width()  - 1).anyOne(),
					(0 .. game.height() - 2).anyOne() //-2 porque hay un banner superior que no es parte del tablero de juego
		) 
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
	
}