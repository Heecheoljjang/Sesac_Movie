//
//  BaseViewController.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/08/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    func configure() {}
        
    func showAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .cancel)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
}
