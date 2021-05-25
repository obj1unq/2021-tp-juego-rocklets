import materialesYExtras.*
import bob.*

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
	
	method puedeConstruirseCon(materiales){
		const cantidadDeMaderaRecogida = materiales.count{material => material.toString() == 'a Madera'}
		const cantidadDePiedraRecogida = materiales.count{material => material.toString() == 'a Piedra'}
		const cantidadDeMetalRecogida = materiales.count{material => material.toString() == 'a Metal'}
		
		return (cantidadDeMaderaRecogida >= self.maderaNecesaria() and 
			cantidadDePiedraRecogida >= self.piedraNecesaria() and 
			cantidadDeMetalRecogida  >= self.metalNecesario())
		
	}
	method teEncontro(unConstructor){
		//nada, la mesa se va a guardar en un lugar aparte, luego esto se borra, pero por ahora lo necesitamos
		//podria ser, guardarme la mesa tambien
	}
}
/* 
object silla{
	//idem mesa
	
	method metalNecesario(){}
	method maderaNecesaria(){}
	method piedraNecesaria(){}
	method materialesNecesarios(){
		//siempre se devuelve en este orden
		return [self.maderaNecesaria(),self.metalNecesario(),self.piedraNecesaria()]
	}
	method energiaRequerida(){
		return 40
	}
}
*/