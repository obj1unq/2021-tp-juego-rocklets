import wollok.game.*
import materialesObstaculosYExtras.*
import tableroDeJuego.*

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
			energia -= 2
			position = nuevaPosicion
		}
	}
	
	method esUnaPosicionValida(unaPosicion){
		return self.estaDentroDeLaPantalla(unaPosicion) and not self.esUnaPosicionProhibida(unaPosicion)
	}
	
	method validarQueEstaVivo(){
		if(self.estaMuerto()){
			fondoPerdedor.finDeJuego()
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
			self.verificarSiPuedeAgarrarMaterial(material)
			gestorDeMaterialesEnTablero.removerMaterial(material)
			self.guardarMaterial(material)
	}
	method sumarEnergia(unaCantidadDeEnergia){
		energia += unaCantidadDeEnergia
	}
	
	method restarEnergia(obstaculo){
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
	method esUnaPosicionProhibida(unaPosicion){
		return self.esUnaPosicionDelPanelSuperior(unaPosicion) or self.esUnaPosicionDelInventario(unaPosicion)
	}
	
	method esUnaPosicionDelPanelSuperior(unaPosicion) {
		return unaPosicion.y() == game.height()-1
	}
	method esUnaPosicionDelInventario(unaPosicion) {
		return unaPosicion.x() == 17 or unaPosicion.x() == 16 or unaPosicion.x() == 15
	}
	method tomarSiestaReparadora(){
		energia = 200
	}
	method verificarSiPuedeAgarrarMaterial(unMaterial) {
		if (not gestorDeMaterialesAdquiridos.hayEspacioParaMas(unMaterial)){
			self.error("No hay espacio para tomar este material.")
		}
	}
}