import wollok.game.*
import objetosConstruibles.*

object fabrica {
	
	const property position = game.at(12, 3)
	
	method image() {return "fabrica.png"}	
	
	method teEncontro(elConstructor){
		//Abrir pantalla  que de opciones 1.construir mesa 2.construir escritorio 3.........
		elConstructor.contruir(mesa)
	}
	
}

object hotelTresEstrellas {
	
	//recupera algo de energia
	
	method descansar(){
		//TODO	
	}
}

object hotelCincoEstrellas {
	
	//recupera mucha energia (mas que la que recupera en el hotel de 3 estrellas)
	method descansar(){
		//TODO	
	}
}

object casa {
	
	//recupera toda la energia, porque no hay como dormir en casa (?)
	method descansar(){
		//TODO	
	}
}