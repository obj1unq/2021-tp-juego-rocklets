import materialesObstaculosYExtras.*
import bob.*
import wollok.game.*
import tableroDeJuego.*


object mesa{
	
	var property image = "mesaEnGris.png"
	const property position = game.at(7,11)
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

	method fuisteConstruido(){
		image = "mesa.png"
	}
}

object silla{
	const property image = "silla.png"
}

object martillo{
	const property image = "martillo.png"
}

object gestorDeObjetosContruidos{
	
	const inventarioDeObjetosConstruidos = #{}
	
	method aniadirObjetoAlInventario(unObjeto){
		unObjeto.fuisteConstruido()
		inventarioDeObjetosConstruidos.add(unObjeto)
		self.verificarSiSeGano()
	}
	
	method verificarSiSeGano(){
		if (primerNivel.objetosAContruirParaGanar() == inventarioDeObjetosConstruidos){ //aca iria el nivel actual.. no el primer nivel
			self.ganarNivel()
		}
	}
	
	method ganarNivel(){
		game.say(bob, "¡GANE!")
		game.schedule(3000, { primerNivel.ganarNivel() })
	}
}