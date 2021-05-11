object mesa{
	
	method contruir(){
		//
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
	
	method materialesNecesarios(){
		//siempre se devuelve en este orden
		return [self.maderaNecesaria(),self.metalNecesario(),self.piedraNecesaria()]
	}
	
}

object silla{
	//idem mesa
	
	method contruir(){
		
	}
	
	method metalNecesario(){}
	method maderaNecesaria(){}
	method piedraNecesaria(){}
	method materialesNecesarios(){
		//siempre se devuelve en este orden
		return [self.maderaNecesaria(),self.metalNecesario(),self.piedraNecesaria()]
	}
}
