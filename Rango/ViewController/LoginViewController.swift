//
//  ViewController.swift
//  Rango
//
//  Created by Lucas Rebelato on 07/04/2018.
//  Copyright © 2018 Lucas Rebelato. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var senhaText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logar(_ sender: UIButton) {
        print(1)
    }
    
}

