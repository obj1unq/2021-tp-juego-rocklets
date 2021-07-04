import wollok.game.*
import objetosConstruibles.*
import bob.*

object fabrica {
	
	const property position = game.at(8, 3)
	
	method image() {return "fabrica.png"}	
	
	method teEncontro(unConstructor){
		game.say(self,"Presione la tecla indicada.")
		game.say(self,"Mi energia es " + bob.energia())
	}
	
}

class AreaDeDescanso{
	var property position = null
	var property image = null
	
	method teEncontro(unConstructor){
		unConstructor.sumarEnergia(self.energiaQueAporta())
		game.say(self,"Recuperando energia...")
	}
	
	method energiaQueAporta()
	
}

object hotelCincoEstrellas inherits AreaDeDescanso {
	override method image()="hotel5e.png"
	override method position()= game.at(1, 9)
	override method energiaQueAporta(){
		return 40
	}
}

object hotelTresEstrellas inherits AreaDeDescanso {
	override method image()="hotel3e.png"
	override method position()= game.at(14, 8)
	override method energiaQueAporta(){
		return 20
	}
}


object hogar inherits AreaDeDescanso {
	override method image()="casa.png"
	override method position()= game.at(0, 1)
	override method energiaQueAporta(){
		return 80
	}
}