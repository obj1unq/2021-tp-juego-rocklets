import materialesObstaculosYExtras.*
import bob.*
import wollok.game.*
import tableroDeJuego.*

class ObjetoConstruible{
	const property position
	
	method position()
	method fuisteConstruido()
	method maderaNecesaria()
	method metalNecesario()
	method piedraNecesaria()
	method energiaRequerida()
	method construir()
}

object mesa inherits ObjetoConstruible{
	var property image = "mesaEnGris.png"

	override method position(){
		return game.at(7,11)	
	}
	
	override method fuisteConstruido(){
		return image == "mesa.png"
	}
	
	override method maderaNecesaria(){
		return 5
	}
	override method metalNecesario(){
		return 2
	}
	override method piedraNecesaria(){
		return 0
	}
	
	override method energiaRequerida(){
		return 20
	}
	
	override method construir(){
		image = "mesa.png"
	}
}

object silla inherits ObjetoConstruible{
	var property image = "silla_gris.png"
	 
	override method position(){ 
		return game.at(8,11)
	}
	
	override method fuisteConstruido(){
		return image == "silla.png"
	}
	override method maderaNecesaria(){
		return 4
	}
	override method metalNecesario(){
		return 3
	}
	override method piedraNecesaria(){
		return 0
	}
	
	override method energiaRequerida(){
		return 50
	}

	override method construir(){
		image = "silla.png"
	}
}


object martillo inherits ObjetoConstruible{
	var property image = "martillo_gris.png"
	
	override method position(){
		return game.at(9,11)
	}
	override method fuisteConstruido(){
		return image == "martillo.png"
	}
	override method maderaNecesaria(){
		return 3
	}
	override method metalNecesario(){
		return 3
	}
	override method piedraNecesaria(){
		return 3
	}
	override method energiaRequerida(){
		return 80
	}
	override method construir(){
		image = "martillo.png"
	}
}


object gestorDeObjetivos{
	var property nivelActual = primerNivel
	const inventarioDeObjetosConstruidos = #{}
	
	method seContruyeElObjeto(unObjeto){
		unObjeto.construir()
		inventarioDeObjetosConstruidos.add(unObjeto)
		self.verificarSiSeGano()
	}
	
	method verificarSiSeGano(){
		if (nivelActual.objetosAConstruirParaGanar() == inventarioDeObjetosConstruidos){ 
			self.ganarNivel()
		}
	}
	
	method ganarNivel(){
		game.say(bob, "¡GANE!")
		game.schedule(2000,{nivelActual.ganarNivel()})
		
	}
}