import lugares.*

class VendedorFijo {
	var property ciudadEnQVive
	const property certificaciones=[]
	
	method agregarCertif(certif) {
		certificaciones.add(certif)
	}
	method cantSobreProducto() {
		return certificaciones.filter{ c => c.esSobreProducto() }.size()
	}
	method puedeTrabajarEn(ciudad) {
		return ciudad==ciudadEnQVive
	}
	method esVersatil() {
		return certificaciones.size()==3 and certificaciones.any{ c => not c.esSobreProducto() }
	}
	method puntajeTotal() {
		return certificaciones.sum{ c => c.puntos() }
	}
	method esFirme() {
		return self.puntajeTotal()>30
	}
	method esInfluyente() { return false }
	method esGenerico() {
		return certificaciones.any{ c => not c.esSobreProducto() }
	}
	method tieneAfinidadX(centro) {
		return self.puedeTrabajarEn(centro.ciudadOrigen())
	}
	method esCandidatoAl(centro) {
		return self.esVersatil() and self.tieneAfinidadX(centro)
	}
	method esPersonaFisica() { return true }
}

class VendedorViajante inherits VendedorFijo {
	const property provincias = []
	
	method cargarProvincia(provincia){
		provincias.add(provincia)
	}
	override method puedeTrabajarEn(ciudad) {
		return provincias.any{ p => p == ciudad.provincia() }
	}
	override method esInfluyente() {
		return provincias.sum{ p => p.poblacion() } >= 1000000
	}
}

class ComercioCorresponsal inherits VendedorFijo {
	const property ciudades = []
	
	method cargarCiudades(ciudad) {
		ciudades.add(ciudad)
	}
	override method puedeTrabajarEn(ciudad) {
		return ciudades.any{ c => c == ciudad }
	}
	method cantCiudades() {
		return ciudades.size()
	}
	method cantProvincias() {
		return ciudades.map{ c => c.provincia() }.asSet().size()
	}
	override method esInfluyente() {
		return self.cantCiudades()>=5 or self.cantProvincias()>=3
	}
	override method tieneAfinidadX(centro) {
		return super(centro) and ciudades.any{ c => not centro.cubreCiudad(c) }
	}
	override method esPersonaFisica() { return false }
}

class Certificacion {
	var property puntos
	var property esSobreProducto=true
}



