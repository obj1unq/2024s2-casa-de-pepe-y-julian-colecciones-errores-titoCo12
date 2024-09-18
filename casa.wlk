import cosas.* 
import cuentas.*

object casa {
	const property cosas = []
	var property cuenta = cuentaCorriente

	method comprar(cosa) {
		cuenta.extraer(cosa.precio())
		cosas.add(cosa)
	}

	method cantidadDeCosasCompradas() {
		return cosas.size()
	}

	method tieneAlgun(cat) {
		return cosas.any({cosa => cosa.categoria() == cat})
	}

	method ultimaCompra() {
		return cosas.last()
	}

	method vieneDeComprar(cat) {
		return not(cosas.isEmpty()) and ((self.ultimaCompra().categoria()) == cat) 
	}

	method esDerrochona() {
		return cosas.sum({cosa => cosa.precio()}) >= 9000
	}

	method compraMasCara() {
		return cosas.max({cosa => cosa.precio()})
	}

	method comprados(cat) {
		return cosas.filter({cosa => cosa.categoria() == cat})
	}

	method malaEpoca() {
		return cosas.all({cosa => cosa.categoria().esComestible()})
	}

	method queFaltaComprar(lista) {
		return lista.filter({elemento => not(cosas.contains(elemento))})
	}

	method faltaComida() {
		return self.cantComida() < 2
	}

		method cantComida() {
			return cosas.count({cosa => cosa.categoria().esComestible()})
		}

	method categoriasCompradas() {
		return cosas.map({cosa => cosa.categoria()}).asSet()
	}
}
