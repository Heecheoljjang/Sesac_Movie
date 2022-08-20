//
//  CustomButton.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/08/20.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpButton() {
        setTitleColor(.gray, for: .highlighted)
        setTitleColor(.black, for: .normal)
        backgroundColor = .white
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
        
}
