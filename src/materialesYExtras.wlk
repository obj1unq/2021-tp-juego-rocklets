import wollok.game.*

class Material{
	const property nombre = null 
	const property image = null 
	const property position = null 

}

class Obstaculos {	
	const property nombre = null 
	const property image = null 
	const property position = null 
}

object hotel5e{
	method image() = "hotel5e.png"

	method position() = game.at(12, 10)
	
}

object casa{
	method image() = "casa.png"

	method position() = game.at(0, 0)
	
}
