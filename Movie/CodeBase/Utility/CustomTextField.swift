//
//  CustomTextField.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/08/20.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        backgroundColor = .systemGray
        textColor = .white
        borderStyle = .roundedRect
    }
    
}
