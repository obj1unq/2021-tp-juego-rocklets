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
		if (self.estaDentroDeLaPantalla(nuevaPosicion)){
			position = nuevaPosicion
		}
	}
	
	method estaDentroDeLaPantalla(nuevaPosicion) {
		return 	nuevaPosicion.x().between(0, game.width() - 1) 
		    and nuevaPosicion.y().between(0, game.height() - 1)
	}
	
	method guardarMaterial(material){
			materialesGuardados.add(material)
	}
	
	method agarrarYQuitarMaterialDelCamino(material){
			self.guardarMaterial(material)
			gestorDeMateriales.removerMaterial(material)
	}
		
	method gastarMaterial(material){
		materialesGuardados.remove(material)
	}
	
	method sumarEnergia(lugarDeDescanso){
		energia += lugarDeDescanso.energiaQueAporta()
	}
	
	method restarEnergia(lugarDeDescanso){
		energia -= lugarDeDescanso.energiaQueQuita()
	} 
	
	method construir(unObjeto){
		/*Construir un objeto
		Al construir voy a tener mas cansancio y perder ciertos materiales
		Hay que ver antes de construir si tengo suficiente energia, aca podemos lanzar excepcion si
		la energia no alcanza
		*/ // Aca deberia validar, segun el objeto que es lo que requiere, osea que material necesito para construir "unObjeto" y ahi deberia descontar,.
		
		self.validarMateriasParaConstruir(unObjeto)
		 //poner mesa 
		
		
		
	}

	method validarMaterialesParaConstruir(unObjeto){
		
		if !(unObjeto.materialesNecesarios().contains.materialesGuardados()){
			self.error("no tenes materiales")
			
		}
		
		
	}

	method contieneEn(list1,list2){
		
		
		
		
		
	}
	
	
	

}


