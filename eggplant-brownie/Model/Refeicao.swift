import Foundation
class Refeicao {
    let nome: String
    let felicidade: Int
    let itens: [Item]
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    func totalCalorias() -> Double {
        var total: Double = 0.0
        for item in itens {
            total += item.calorias
        }
        return total
    }
}
