//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Vinicius SosseiSakugawa on 17/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var happynesTextField: UITextField!

    @IBAction func add(_ sender: Any) {
        guard let nomeRefeicao = nameTextField?.text else { return  }
        guard let felicidadeRefeicao = happynesTextField?.text, let felicidade = Int(felicidadeRefeicao) else { return }
        let refeicao = Refeicao(nome: nomeRefeicao, felicidade: felicidade)
        print("comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
    }
    
}   

