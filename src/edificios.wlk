import wollok.game.*
import objetosConstruibles.*

object fabrica {
	
	const property position = game.at(9, 3)
	
	method image() {return "fabrica.png"}	
	
	method teEncontro(unConstructor){
		//Abrir pantalla  que de opciones 1.construir mesa 2.construir escritorio 3.........
		unConstructor.construir(mesa)
	}
	
}

class AreaDeDescanso{
	const property position = null
	const property image = null
	const property energiaQueAporta = null
	
	method teEncontro(unConstructor){
		unConstructor.sumarEnergia(self)
		game.say(self,"Recuperando energia...")
	}
}

