//
//  MainView.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/08/20.
//

import UIKit
import SnapKit

class MainView: BaseView {
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "HEEFLIX"
        title.textColor = .systemPink
        title.font = .systemFont(ofSize: 30, weight: .heavy)
        title.textAlignment = .center
        
        return title
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.textAlignment = .center
        textField.keyboardType = .emailAddress
        textField.isSecureTextEntry = false
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let nameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        textField.keyboardType = .default
        textField.isSecureTextEntry = false
        
        return textField
    }()
    
    let locationTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        textField.keyboardType = .default
        textField.isSecureTextEntry = false
        
        return textField
    }()
    
    let codeTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        textField.keyboardType = .numberPad
        textField.isSecureTextEntry = false
        
        return textField
    }()
    
    let signUpButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("회원가입", for: .normal)
        
        return button
    }()
    
    let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.backgroundColor = .black
        
        return label
    }()

    let hiddenSwitch: UISwitch = {
        let hiddenSwitch = UISwitch()
        hiddenSwitch.setOn(false, animated: false)
        hiddenSwitch.onTintColor = .systemPink
        hiddenSwitch.backgroundColor = .gray
        hiddenSwitch.layer.cornerRadius = hiddenSwitch.frame.size.height / 2
        hiddenSwitch.thumbTintColor = .white
        return hiddenSwitch
    }()
    
    let hiddenLabel: UILabel = {
        let label = UILabel()
        label.text = "짜잔"
        label.isHidden = true
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        [title, emailTextField, passwordTextField, nameTextField, locationTextField, codeTextField, signUpButton, moreLabel, hiddenSwitch, hiddenLabel].forEach {
        
            self.addSubview($0)
            self.backgroundColor = .black
        }
    }
    
    override func setUpConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(40)
            make.trailing.leading.equalTo(self)
            make.height.equalTo(40)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(120)
            make.height.equalTo(self).multipliedBy(0.05)
            make.leading.equalTo(self).offset(50)
            make.trailing.equalTo(self).offset(-50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
            make.height.equalTo(self).multipliedBy(0.05)
            make.leading.equalTo(self).offset(50)
            make.trailing.equalTo(self).offset(-50)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
            make.height.equalTo(self).multipliedBy(0.05)
            make.leading.equalTo(self).offset(50)
            make.trailing.equalTo(self).offset(-50)
        }
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(25)
            make.height.equalTo(self).multipliedBy(0.05)
            make.leading.equalTo(self).offset(50)
            make.trailing.equalTo(self).offset(-50)
        }
        codeTextField.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(25)
            make.height.equalTo(self).multipliedBy(0.05)
            make.leading.equalTo(self).offset(50)
            make.trailing.equalTo(self).offset(-50)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(codeTextField.snp.bottom).offset(25)
            make.height.equalTo(self).multipliedBy(0.06)
            make.leading.equalTo(self).offset(50)
            make.trailing.equalTo(self).offset(-50)
        }
        
        moreLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(32)
            make.leading.equalTo(signUpButton.snp.leading)
            //make.width.equalTo(60)
            make.height.equalTo(32)
        }
        
        hiddenSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(moreLabel)
            make.trailing.equalTo(signUpButton)
        }
    }
}
