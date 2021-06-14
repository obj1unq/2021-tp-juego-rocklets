import wollok.game.*
import objetosConstruibles.*

object fabrica {
	
	const property position = game.at(8, 3)
	
	method image() {return "fabrica.png"}	
	
	method teEncontro(unConstructor){
		game.say(self,"Presione la tecla indicada.")
	}
	
}

class AreaDeDescanso{
	const property position = null
	const property image = null
	
	method teEncontro(unConstructor){
		unConstructor.sumarEnergia(self.energiaQueAporta())
		game.say(self,"Recuperando energia...")
	}
	
	method energiaQueAporta()
	
}

class HotelCincoEstrellas inherits AreaDeDescanso {
	
	override method energiaQueAporta(){
		return 40
	}
}

class HotelTresEstrellas inherits AreaDeDescanso {
	
	override method energiaQueAporta(){
		return 20
	}
}

class Hogar inherits AreaDeDescanso {
	
	override method energiaQueAporta(){
		return 80
	}
	override method teEncontro(unConstructor){
		unConstructor.tomarSiestaReparadora()
		game.say(self,"Recuperando energia...")
	}
}