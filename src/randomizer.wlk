import wollok.game.*
import bob.*

object randomizer {
		
	method position() {
		return 	game.at( 
					(0 .. game.width()  - 4).anyOne(),
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
	
	method posicionVaciaEnInventario(columnNumber){
		return self.emptyPositionInColumn(columnNumber)
	}
	method emptyPositionInColumn(columnNumber) {
		const position = self.positionInColumn(columnNumber)
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPositionInColumn(columnNumber)
		} 
	}
	method positionInColumn(columnNumber){
		const rowNumber = (0 .. self.maxPositionInRow()).anyOne()
		return 	game.at(columnNumber,rowNumber)
	}
	method maxPositionInRow(){
		
		return game.height()-4
		
	}
}
