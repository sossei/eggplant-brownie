import Foundation
class Refeicao {
    let nome: String
    var felicidade: Int
    var itens: Array<Item> = []
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
    func totalCalorias() -> Double {
        var total: Double = 0.0
        for item in itens {
            total += item.calorias
        }
        return total
    }
}
