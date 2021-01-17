//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Vinicius SosseiSakugawa on 17/01/21.
//

import UIKit
class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    // MARK: - Atributos
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 4),
                     Refeicao(nome: "Comida Japonesa", felicidade: 5)]
    
    // MARK: - Delegates TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        cell.textLabel?.text = refeicao.nome
        return cell
    }
    
    // MARK: - Functions
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    // MARK: - Delegate Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
}
