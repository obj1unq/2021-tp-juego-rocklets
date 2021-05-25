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
			energia -= 2
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
	
	method restarEnergia(obstaculo){
		energia -= obstaculo.energiaQueQuita()
	} 
	
	method construir(unObjeto){
		self.validarSiTieneMaterialesNecesarios(unObjeto)
		self.validarSiTieneEnergiaNecesaria(unObjeto)
		game.addVisual(unObjeto) // quisiera mostrarlo en alguna parte especial de la pantalla donde se muestren
								// los objetos que vamos construyendo, como un inventario de objetos construidos
		unObjeto.materialesNecesarios().forEach({material=> self.gastarMaterial(material)}) 
		}
			
    method validarSiTieneMaterialesNecesarios(unObjeto){
    	if (not unObjeto.puedeConstruirseCon(materialesGuardados)) {
			self.error("No tengo los materiales necesarios")
		}
    }
    
	method validarSiTieneEnergiaNecesaria(unObjeto) {
		if (energia <= unObjeto.energiaRequerida()){
			self.error("No tengo energia")
		}
	}
}


