import materialesObstaculosYExtras.*
import bob.*
import wollok.game.*
import tableroDeJuego.*


object mesa{
	
	var property image = "mesaEnGris.png"
	const property position = game.at(7,11)
	
	method fuisteConstruido(){
		return image == "mesa.png"
	}
	
	method maderaNecesaria(){
		//se necesitan 5 unidades de madera para construir la mesa
		return 5
	}
	method metalNecesario(){
		//Se necesitan 2 unidades de metal para consturir la mesa
		return 2
	}
	method piedraNecesaria(){
		return 0
	}
	
	method energiaRequerida(){
		return 20
	}
	
	method construir(){
		image = "mesa.png"
	}
}

object silla{
	var property image = "silla_gris.png"
	const property position = game.at(8,11)
	
	method fuisteConstruido(){
		return image == "silla.png"
	}
	method maderaNecesaria(){
		//se necesitan 5 unidades de madera para construir la mesa
		return 4
	}
	method metalNecesario(){
		//Se necesitan 2 unidades de metal para consturir la mesa
		return 3
	}
	method piedraNecesaria(){
		return 0
	}
	
	method energiaRequerida(){
		return 50
	}

	method construir(){
		image = "silla.png"
	}
}


object martillo{
	var property image = "martillo_gris.png"
	const property position = game.at(9,11)
	
	method fuisteConstruido(){
		return image == "martillo.png"
	}
	method maderaNecesaria(){
		//se necesitan 5 unidades de madera para construir la mesa
		return 3
	}
	method metalNecesario(){
		//Se necesitan 2 unidades de metal para consturir la mesa
		return 3
	}
	method piedraNecesaria(){
		return 3
	}
	
	method energiaRequerida(){
		return 80
	}

	method construir(){
		image = "martillo.png"
	}
}


object gestorDeObjetosConstruidos{
	var property nivelActual = primerNivel // ver tema de responsabilidad , le corresponde?
	const inventarioDeObjetosConstruidos = #{}
	
	method aniadirObjetoAlInventario(unObjeto){
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