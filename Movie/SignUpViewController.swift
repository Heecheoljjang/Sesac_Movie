//
//  SignUpViewController.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/07/06.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var plusSwitch: UISwitch!
    @IBOutlet weak var hiddenLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFieldUI(textField: emailTextField, placeholderText: "이메일 주소 또는 전화번호", keyboard: .emailAddress, security: false)
        
        setTextFieldUI(textField: pwTextField, placeholderText: "비밀번호", keyboard: .default, security: true)
        
        setTextFieldUI(textField: nameTextField, placeholderText: "닉네임", keyboard: .default, security: false)
        
        setTextFieldUI(textField: locationTextField, placeholderText: "위치", keyboard: .default, security: false)
        
        setTextFieldUI(textField: codeTextField, placeholderText: "추천 코드 입력", keyboard: .numberPad, security: false)
        
        setSignUpBtn(signUpBtn, title: "회원가입")
        
        
        plusLabel.text = "추가 정보 입력"
        plusLabel.font = .boldSystemFont(ofSize: 18)
        plusLabel.backgroundColor = .black
        plusLabel.textColor = .white
        
        plusSwitch.setOn(false, animated: false)
        plusSwitch.onTintColor = .systemPink
        plusSwitch.backgroundColor = .gray
        plusSwitch.layer.cornerRadius = plusSwitch.frame.height / 2
        plusSwitch.thumbTintColor = .white
        
        hiddenLabel.isHidden = true
        hiddenLabel.text = "짜잔"
        hiddenLabel.font = UIFont.boldSystemFont(ofSize: 18)
        hiddenLabel.textColor = .white
        
        titleLabel.textAlignment = .center
        
    }
    
    func setTextFieldUI(textField: UITextField, placeholderText: String, keyboard: UIKeyboardType, security: Bool) {
        
        textField.textAlignment = .center
        textField.backgroundColor = .systemGray
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.5)])
        textField.keyboardType = keyboard
        textField.textColor = .white
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = security
    }
    
    func setSignUpBtn(_ button: UIButton, title: String) {
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func tapSignUpBtn(_ sender: Any) {
        view.endEditing(true)
        if emailTextField.text == "" {
            print("이메일 또는 전화번호를 입력하세요.")
        } else {
            if pwTextField.text == "" {
                print("비밀번호를 입력하세요.")
            } else {
                if let pw = pwTextField.text {
                    if pw.count < 6 {
                        print("비밀번호가 너무 짧습니다.")
                    } else {
                        if nameTextField.text == "" {
                            print("닉네임을 입력하세요.")
                        } else {
                            if locationTextField.text == "" {
                                print("위치를 입력하세요.")
                            } else {
                                if codeTextField.text == "" {
                                    print("추천코드를 입력하세요.")
                                } else {
                                    if let code = codeTextField.text {
                                        if Int(code) == nil {
                                            print("추천 코드를 다시 입력하세요.")
                                        } else {
                                            print("회원가입완료")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    @IBAction func tapSwitch(_ sender: Any) {
        if plusSwitch.isOn {
            hiddenLabel.isHidden = false
        } else {
            hiddenLabel.isHidden = true
        }
    }
    
}
