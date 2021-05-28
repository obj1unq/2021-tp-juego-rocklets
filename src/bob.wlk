import wollok.game.*
import materialesYExtras.*

object bob {
	
	var property position = game.at(3, 3)
	var property energia = 100

	method image() {
		return "bob.png"
	}
	
	method irA(nuevaPosicion) {
		if (self.estaDentroDeLaPantalla(nuevaPosicion)){
			//ver si tiene energia, sino no se mueve y perdes.
			//mostrar la energia en algun lado
			energia -= 2
			position = nuevaPosicion
		}
	}
	
	method estaDentroDeLaPantalla(nuevaPosicion) {
		return 	nuevaPosicion.x().between(0, game.width() - 1) 
		    and nuevaPosicion.y().between(0, game.height() - 1)
	}
	
	method guardarMaterial(material){
			material.serRecogidoPorConstructor()
	}
	
	method agarrarYQuitarMaterialDelCamino(material){
			self.guardarMaterial(material)
			gestorDeMateriales.removerMaterial(material)
	}
		
	method gastarMaterial(material){
		material.serRemovido()
	}
	
	method sumarEnergia(lugarDeDescanso){
		energia += lugarDeDescanso.energiaQueAporta()
	}
	
	method restarEnergia(obstaculo){
		//cambiar imagen si esta por debaje de X energia
		//fijarte si se murio, no puede tener energia negativa
		energia -= obstaculo.energiaQueQuita()
	} 
	
	method construir(unObjeto){
		self.validarSiTieneMaterialesNecesarios(unObjeto)
		self.validarSiTieneEnergiaNecesaria(unObjeto)
		game.addVisual(unObjeto) // quisiera mostrarlo en alguna parte especial de la pantalla donde se muestren
								// los objetos que vamos construyendo, como un inventario de objetos construidos
		gestorDeMaterialesAdquiridos.gastarMaterialesNecesariosPara(unObjeto) 
		}
			
    method validarSiTieneMaterialesNecesarios(unObjeto){
    	if (not gestorDeMaterialesAdquiridos.puedoConstruir(unObjeto)) {
			self.error("No tengo los materiales necesarios")
		}
    }
    
	method validarSiTieneEnergiaNecesaria(unObjeto) {
		if (energia <= unObjeto.energiaRequerida()){
			self.error("No tengo energia")
		}
	}
	
	method pasarDeNivel() {
		//TODO: Autogenerated Code ! 
	}
}


