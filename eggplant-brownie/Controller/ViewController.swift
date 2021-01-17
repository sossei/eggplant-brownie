//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Vinicius SosseiSakugawa on 17/01/21.
//

import UIKit
protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItemDelegate {
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),
                         Item(nome: "Queijo", calorias: 50.0),
                         Item(nome: "Molho qpimentado", calorias: 25.0),
                         Item(nome: "Manjericão", calorias: 35.0), ]
    var itensSelecionados: [Item] = []
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        let btAdd = UIBarButtonItem(title: "Adicionar", style: .plain, target:self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = btAdd
    }
    
    // MARK: - Functions
    @objc func adicionarItem(){
        let adicionarViewController = AdicionaItensController(delegate: self)
        navigationController?.pushViewController(adicionarViewController, animated: true)
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var happynesTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - IBActions
    @IBAction func add(_ sender: Any) {
        guard let nomeRefeicao = nameTextField?.text else {
            print("Campo nome vazio")
            return
        }
        guard let felicidadeRefeicao = happynesTextField?.text, let felicidade = Int(felicidadeRefeicao) else {
            print("Campo felicdade vaziou ou inválido")
            return
        }
        let refeicao = Refeicao(nome: nomeRefeicao, felicidade: felicidade, itens: itensSelecionados)
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let item = itens[indexPath.row]
        cell.textLabel?.text = "\(item.nome), \(item.calorias) cal"
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        let item = itens[indexPath.row]
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            itensSelecionados.append(item)
        } else {
            if let position = itensSelecionados.firstIndex(where: { (itemList) -> Bool in
                return item.nome == itemList.nome
            }){
                itensSelecionados.remove(at: position)
            }
            cell.accessoryType = .none
        }
    }
    
    // MARK: - Adiciona item delegate
    func add(_ item: Item) {
        itens.append(item)
        tableView.reloadData()
    }
    
    
}   

