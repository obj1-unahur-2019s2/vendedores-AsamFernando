class Cliente {
	method puedeSerAtendidoX(vendedor)
}

class Inseguro inherits Cliente {
	override method puedeSerAtendidoX(vendedor) {
		return vendedor.esVersatil() and vendedor.esFirme()
	}
}
class Detallista inherits Cliente {
	override method puedeSerAtendidoX(vendedor) {
		return vendedor.cantSobreProducto() >= 3
	}
}
class Humanista inherits Cliente {
	override method puedeSerAtendidoX(vendedor) {
		return vendedor.esPersonaFisica()
	}
}
