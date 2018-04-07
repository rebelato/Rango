//
//  HomeViewController.swift
//  Rango
//
//  Created by Lucas Rebelato on 07/04/2018.
//  Copyright © 2018 Lucas Rebelato. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var companyTableView: UITableView!
    
    let companyName = ["Restaurante 1", "Restaurante 2", "Restaurante 3"]
    let share = ["HDUOHAOUDHWOUHDOAUWHDhuheuheuwhfuewhfuwehfuwehfuewhfuewhfuwehfuwehfuwehfuwehfuwhfuwhfuwehfuwhfuwehfuwehfuwhfuhweufhweufheuwhfuwehfuweOUAH", "jannawnawonawonxaown", "ijijciqjiqwdoqnwdoq"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyTableView.delegate = self
        companyTableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = companyTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = companyName[indexPath.row]
        cell?.detailTextLabel?.text = "\(share[indexPath.row])"
        cell?.imageView?.image = UIImage(named: "Banana")
        
        return cell!
    }
    
    
    @IBAction func btPerfil(_ sender: UIButton) {
        print(1)
    }
    
    @IBAction func btFicha(_ sender: UIButton) {
        print(1)
    }
    
    @IBAction func btHome(_ sender: UIButton) {
        print(1)
    }
    
}

