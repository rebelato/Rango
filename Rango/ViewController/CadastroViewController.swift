//
//  CadastroViewController.swift
//  Rango
//
//  Created by Lucas Rebelato on 07/04/2018.
//  Copyright © 2018 Lucas Rebelato. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {

    @IBOutlet weak var nomeTextCadastro: UITextField!
    @IBOutlet weak var emailTextCadastro: UITextField!
    @IBOutlet weak var senhaTextCadastro: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cadastrarCliente(_ sender: UIButton) {
        print(1)
    }
}
