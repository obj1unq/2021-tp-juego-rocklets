import wollok.game.*
import materialesYExtras.*

object bob {
	
	var property position = game.at(1, 6)
	var property energia = 100

	method image() {
		return if (self.estaMuerto())
			"tumba.png"
		else if (self.tienePocaEnergia())
		    "bob_gris.png" 
		 else "bob.png"
	}
	
	method irA(nuevaPosicion) {
		self.validarQueEstaVivo()
		if (self.esUnaPosicionValida(nuevaPosicion)){
			//ver si tiene energia, sino no se mueve y perdes.
			//mostrar la energia en algun lado
			energia -= 2
			position = nuevaPosicion
		}
	}
	
	method esUnaPosicionValida(unaPosicion){
		return self.estaDentroDeLaPantalla(unaPosicion) and not self.esUnaPosicionDelPanelSuperior(unaPosicion)
	}
	
	method validarQueEstaVivo(){
		if(self.estaMuerto()){
			self.error("Bob murió")
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
			gestorDeMaterialesEnTablero.removerMaterial(material)
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
		gestorDeMaterialesAdquiridos.construir(unObjeto)
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
	
	method tienePocaEnergia() {
		return self.energia().between(1,30)
	}
	
	method estaMuerto(){
		return self.energia()<=0
	}
	method esUnaPosicionDelPanelSuperior(unaPosicion) {
		return unaPosicion.y() == game.height()-1
	}
}


