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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

            if let data = UserDefaults.standard.dictionary(forKey: email) {

                if data[password] as! String == password {
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
        }
    }
}
