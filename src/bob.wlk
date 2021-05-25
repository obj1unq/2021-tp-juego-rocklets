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
			materialesGuardados.add(material)
	}
	
	method agarrarYQuitarMaterialDelCamino(material){
			self.guardarMaterial(material)
			gestorDeMateriales.removerMaterial(material)
		//Me guardo un material que encontre
	}
		
	
	method gastarMaterial(material){
		materialesGuardados.remove(material)
		/*Se gasta un material, pero hay que ver si materialesGuardados es un conjunto o una lista, a ver
		si repetimos los materiales o tienen que ser todos distintos, o como hacemos.
		La idea seria que se repitan supongo, para tener muchas piedras, muchas maderas
		Pero hay que ver como se comporta la coleccion al querer borrar por ejemplo 5 maderas, y no todas las que tengo
		*/
	}
	
	method sumarEnergia(lugarDeDescanso){
		energia += lugarDeDescanso.energiaQueAporta()
	}
	
	method restarEnergia(obstaculo){
		energia -= obstaculo.energiaQueQuita()
	} 
	
	method construir(unObjeto){
		self.validarSiPuedeConstruirse(unObjeto)
		game.addVisual(unObjeto)
		unObjeto.materialesNecesarios().forEach({material=> self.gastarMaterial(material)}) 
		/*Construir un objeto
		Al construir voy a tener mas cansancio y perder ciertos materiales
		Hay que ver antes de construir si tengo suficiente energia, aca podemos lanzar excepcion si
		la energia no alcanza
		*/
	
		}
			
    method validarSiPuedeConstruirse(unObjeto){
    	if (not unObjeto.puedeConstruirse()) {
			self.error("No puedo construirlo, no tengo los materiales necesarios")
		}
    }
		


   
   
}


