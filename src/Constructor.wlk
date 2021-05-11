import wollok.game.*

object bob {
	
	var property position = game.at(3, 3)
	const materialesGuardados = []

	method image() {
		return "bob.png"
	}
	
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	}
	
	method guardarMaterial(unMaterial){
		//Me guardo un material que encontre
	}
	
	method gastarMaterial(unMaterial){
		/*Se gasta un material, pero hay que ver si materialesGuardados es un conjunto o una lista, a ver
		si repetimos los materiales o tienen que ser todos distintos, o como hacemos.
		La idea seria que se repitan supongo, para tener muchas piedras, muchas maderas
		Pero hay que ver como se comporta la coleccion al querer borrar por ejemplo 5 maderas, y no todas las que tengo
		*/
	}
	
	method construir(unObjeto){
		/*Construir un objeto
		Al construir voy a tener mas cansancio y perder ciertos materiales
		Hay que ver antes de construir si tengo suficiente energia, aca podemos lanzar excepcion si
		la energia no alcanza
		*/
	}

}

