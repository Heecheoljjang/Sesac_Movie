//
//  MainViewController.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/08/20.
//

import UIKit

class MainViewController: BaseViewController {
    
    var mainView = MainView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        
    }
}
