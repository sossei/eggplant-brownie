//
//  AdicionaRefeicaoController.swift
//  eggplant-brownie
//
//  Created by Vinicius SosseiSakugawa on 17/01/21.
//

import UIKit

protocol AdicionaItemDelegate{
    func add(_ item: Item)
}
class AdicionaItensController: UIViewController {

    // MARK: - Atributtos
    var delegate: AdicionaItemDelegate?
    
    init(delegate: AdicionaItemDelegate) {
        super.init(nibName: "AdicionaItensController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    //MARK: - IBACtions
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeTxt = nomeTextField?.text else {
            print("Campo Nome inválido")
            return
        }
        guard let caloriasTxt = caloriasTextField?.text, let calorias = Double(caloriasTxt) else{
            print("Campo Calorias invlaido")
            return
        }
        let item = Item(nome: nomeTxt, calorias: calorias)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
}
