class CentroDistrib {
	var property ciudadOrigen
	const property vendedores=[]
	
	method agregarVendedor(vendedor){
		if(self.estaRegistrado(vendedor)) {
			self.error("ya esta registrado")
		}
		else { vendedores.add(vendedor) }
	}
	method estaRegistrado(vendedor) {
		return vendedores.any{ v => v == vendedor }
	}
	method vendedorEstrella() {
		return vendedores.max{ v => v.puntajeTotal() }
	}
	method cubreCiudad(ciudad) {
		return vendedores.any{ v => v.puedeTrabajarEn(ciudad) }
	}
	method genericos() {
		return vendedores.filter{ v => v.esGenerico() }
	}
	method esRobusto() {
		return vendedores.count{ v => v.esFirme() } >= 3
	}
	method repartirCertificacion(certif) {
		vendedores.forEach{ v => v.agregarCertif(certif) }
	}
}
