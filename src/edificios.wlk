import wollok.game.*
import objetosConstruibles.*

object fabrica {
	
	const property position = game.at(10, 3)
	
	method image() {return "fabrica.png"}	
	
	method teEncontro(unConstructor){
		//Abrir pantalla  que de opciones 1.construir mesa 2.construir escritorio 3.........
		unConstructor.construir(mesa)
	}
	
}

object hotelTresEstrellas {
	const property position = game.at(4, 2)
		
	method image() {return "hotel3e.png"}
	
	method energiaQueAporta(){
		return 30
	}

	method teEncontro(unConstructor){
		unConstructor.sumarEnergia(self)
		game.say(hotelTresEstrellas,"Recuperando energia...")
	}
}

object hotelCincoEstrellas {
	
	const property position = game.at(1, 9)
	
	method image() {return "hotel5e.png"}
	
	method energiaQueAporta(){
		return 50
	}

	method teEncontro(unConstructor){
		unConstructor.sumarEnergia(self)
		game.say(hotelTresEstrellas,"Recuperando energia...")
	}
}

object casa {
	
	const property position = game.at(0, 1)
	
	method image() {return "casa.png"}
	
	method energiaQueAporta(){
		return 100
	}

	method teEncontro(unConstructor){
		unConstructor.sumarEnergia(self)
		game.say(hotelTresEstrellas,"Recuperando energia...")
	}
}