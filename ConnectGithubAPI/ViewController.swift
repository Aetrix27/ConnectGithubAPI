//
//  ViewController.swift
//  ConnectGithubAPI
//
//  Created by David Guerrero on 9/25/21.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ToTableView(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "tableViewVC") as! TableViewController
        present(vc, animated:true)
    }
    
    
}


