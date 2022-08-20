//
//  CodeViewController.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/08/20.
//

import UIKit

class CodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = MainViewController()
        
        present(vc, animated: true)
    }
    

}
