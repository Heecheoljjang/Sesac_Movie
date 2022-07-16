//
//  LoginViewController.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/07/16.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTextFieldUI(textField: emailTextField, placeholderText: "아이디", keyboard: .emailAddress, security: false)
        setTextFieldUI(textField: pwTextField, placeholderText: "비밀번호", keyboard: .default, security: true)
        
        setSignUpBtn(loginBtn, title: "로그인")
        setSignUpBtn(signUpBtn, title: "회원가입")
        
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
    
    
    @IBAction func tapSignUpBtn(_ sender: UIButton) {
        
        // 회원가입화면 띄우기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true)
    }
    
    @IBAction func tapLoginBtn(_ sender: UIButton) {
    
        //UserDefaults에 데이터가 저장되어있는지 확인 후 있으면 화면 전환, 없으면 Alert.
        if let email = emailTextField.text, let password = pwTextField.text {

            print(UserDefaults.standard.dictionary(forKey: email))
            
            if UserDefaults.standard.dictionary(forKey: email) != nil {
                if let data = UserDefaults.standard.dictionary(forKey: email) {
                    
                    print("data: \(data)")
                    
                    if data["password"] as! String == password {
                        //화면 전환
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        
                        guard let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
                        vc.modalPresentationStyle = .fullScreen
                        
                        self.present(vc, animated: true)

                    } else {
                        //alert띄우기
                        let alert = UIAlertController(title: "오류", message: "이메일 또는 비밀번호를 다시 입력하세요.", preferredStyle: .alert)

                        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

                        alert.addAction(ok)

                        present(alert, animated: true)
                    }
                }
            } else {
                let alert = UIAlertController(title: "오류", message: "존재하지 않는 아이디입니다.", preferredStyle: .alert)

                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

                alert.addAction(ok)

                present(alert, animated: true)
            }
        }
    }
    @IBAction func tapBackgroundView(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    @IBAction func emailTFReturn(_ sender: UITextField) {
    }
    @IBAction func pwTFReturn(_ sender: UITextField) {
    }
    
}
