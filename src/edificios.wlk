import wollok.game.*
import objetosConstruibles.*

object fabrica {
	
	const property position = game.at(8, 3)
	
	method image() {return "fabrica.png"}	
	
	method teEncontro(unConstructor){
		game.say(fabrica,"Presione la tecla indicada.")
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
