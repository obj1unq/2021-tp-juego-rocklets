import wollok.game.*
import materialesYExtras.*

object bob {
	
	var property position = game.at(3, 3)
	var property energia = 100
	const property materialesGuardados = []

	method image() {
		return "bob.png"
	}
	
	method irA(nuevaPosicion) {
		position = nuevaPosicion
	}
	
	method guardarMaterial(material){
		    self.validarSiEsMaterial(material)	
			materialesGuardados.add(material.nombre())
	}
	
	method agarrarYQuitarMaterialDelCamino(){
			const material = game.uniqueCollider(self)
			self.guardarMaterial(material)
			game.removeVisual(material)
		//Me guardo un material que encontre
	}
	
	method validarSiEsMaterial(_material){
		const imagenesDeMaterialesValidos = ["metal.png", "madera.png","piedra.png"]
		if (not imagenesDeMaterialesValidos.contains(_material.image())){
			self.error("no se puede guardar, no es un material ")
		}
	}	
	
	
	method gastarMaterial(material){
		materialesGuardados.remove(material)
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


