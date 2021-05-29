import materialesYExtras.*
import bob.*
import wollok.game.*

object mesa{
	
	const property image = "mesa.png"
	const property position = bob.position()
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
	
	method materialesNecesarios(){
		//siempre se devuelve en este orden
		return [self.maderaNecesaria(),self.metalNecesario(),self.piedraNecesaria()]
	}
	
	method teEncontro(unConstructor){
		//nada, la mesa se va a guardar en un lugar aparte, luego esto se borra, pero por ahora lo necesitamos
		//podria ser, guardarme la mesa tambien
	}
}

object silla{
	const property image = "silla.png"
}

object martillo{
	const property image = "martillo.png"
}

object gestorDeObjetosContruidos{
	
	//lista o algo para guararme los objetos
	
	method aniadirObjetoAlInventario(unObjeto){
	//guardarse las cosas que contruí.
	//me fijo si ya gane, o sea si ya contrui todo lo que necesitaba contruir para ganar.
		//self.ganarNivel()
	}
	
	method ganarNivel(){
		game.say(bob, "¡GANE!")
		game.schedule(2000, { bob.pasarDeNivel() })
	}
}