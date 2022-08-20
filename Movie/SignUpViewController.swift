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
    
    func showAlert(_ message: String) {
        
        let alert = UIAlertController(title: message, message: nil , preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func tapSignUpBtn(_ sender: Any) {
        view.endEditing(true)
        if emailTextField.text == "" {
            showAlert("이메일을 입력하세요.")
        } else {
            if pwTextField.text == "" {
                showAlert("비밀번호를 입력하세요.")
            } else {
                if let pw = pwTextField.text {
                    if pw.count < 6 {
                        showAlert("비밀번호가 너무 짧습니다.")
                    } else {
                        if nameTextField.text == "" {
                            showAlert("닉네임을 입력하세요.")
                        } else {
                            if locationTextField.text == "" {
                                showAlert("위치를 입력하세요.")
                            } else {
                                if codeTextField.text == "" {
                                    showAlert("추천코드를 입력하세요.")
                                } else {
                                    if let code = codeTextField.text {
                                        if Int(code) == nil {
                                            showAlert("추천코드를 다시 입력하세요.")
                                        } else {

                                            // 화면 dismiss시키고 userdefaults로 데이터 저장
                                            if let email = emailTextField.text, let password = pwTextField.text, let nickname = nameTextField.text, let location = locationTextField.text, let code = codeTextField.text {

                                                let dataDic: [String: String] = ["email": email, "password": password, "nickname": nickname, "location": location, "code": code]

                                                UserDefaults.standard.set(dataDic, forKey: email)

                                                print(UserDefaults.standard.dictionary(forKey: email), email)

                                                // 알림
                                                let alert = UIAlertController(title: "회원가입완료", message: nil, preferredStyle: .alert)

                                                let ok = UIAlertAction(title: "확인", style: .default) { _ in
                                                    self.dismiss(animated: true)
                                                }

                                                alert.addAction(ok)

                                                present(alert, animated: true, completion: nil)

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
       
    }
    @IBAction func tapSwitch(_ sender: Any) {
        if plusSwitch.isOn {
            hiddenLabel.isHidden = false
        } else {
            hiddenLabel.isHidden = true
        }
    }
    
}
