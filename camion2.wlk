object camion {
    const carga = []

    method cargar(unaCosa) {
        carga.add(unaCosa) 
        unaCosa.consencuenciaDeLaCarga()
    }
    method descargar(unaCosa) {carga.remove(unaCosa)}
    method pesoTotal() = 1000 + self.cargaTotal() 
    method cargaTotal() = carga.sum({c=>c.peso()})
    method todoPesoPar() = carga.all({c=>c.peso().even()})
    method algoQuePesa(unValor) = carga.any({c=>c.peso() == unValor})
    method cosaConPeligrosidad(unNivel) = carga.find({c=>c.peligrosidad() == unNivel})
    method cosasSuperanPeligrosidad(unNivel) = carga.filter({c=>c.peligrosidad() > unNivel})
    method cosasMasPeligrosasQueBis(unaCosa) = carga.filter({c=> c.peligrosidad() > unaCosa.peligrosidad()}) //no tan bonito
    method cosasMasPeligrosasQue(unaCosa) = self.cosasSuperanPeligrosidad(unaCosa.peligrosidad())
    method excedidoDePeso() = self.pesoTotal() > 2500
    method puedeCircular(unNivel) = not self.excedidoDePeso() && self.cosasSuperanPeligrosidad(unNivel).isEmpty()
    method tieneAlgoQuePesaEntre(min,max) = carga.any({c=>c.peso().between(min, max)})
    method cosaMasPesada() = carga.max({c=>c.peso()})
}