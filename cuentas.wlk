object cuentaCorriente {
    var property saldo = 0

    method depositar(monto) {
        saldo += monto
    }

    method extraer(monto) {
       self.validarExtraccion(monto)
       saldo -= monto
    }

    method validarExtraccion(monto) {
        if (saldo < monto) {self.error("El saldo es insuficiente")}
    }
}



object cuentaGastos {
    var property saldo = 0 
    var property costoOperacion = 0

    method depositar(monto) {
        saldo += (monto - costoOperacion).max(0)
    }

    method extraer(monto) {
        saldo -= monto 
    }
}



object cuentaCombinada {
    var property primaria = cuentaCorriente
    var property secundaria = cuentaGastos

    method depositar(monto) {
        primaria.depositar(monto)
    }

    method extraer(monto) {
       const cuenta = if (primaria.saldo() >= monto ) primaria else secundaria
       cuenta.extraer(monto)
    }

    method saldo() {
        return primaria.saldo() + secundaria.saldo()
    }
}



