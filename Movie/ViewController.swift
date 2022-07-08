//
//  ViewController.swift
//  Movie
//
//  Created by HeecheolYoon on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var thirdImg: UIImageView!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImg.layer.cornerRadius = firstImg.frame.height / 2
        secondImg.layer.cornerRadius = firstImg.frame.height / 2
        thirdImg.layer.cornerRadius = firstImg.frame.height / 2
        
        firstImg.layer.borderWidth = 3
        secondImg.layer.borderWidth = 3
        thirdImg.layer.borderWidth = 3
        
        firstImg.layer.borderColor = UIColor.green.cgColor
        secondImg.layer.borderColor = UIColor.brown.cgColor
        thirdImg.layer.borderColor = UIColor.gray.cgColor
        
    }

    @IBAction func tapPlayBtn(_ sender: Any) {
        firstImg.image = UIImage(named: "\(Int.random(in: 1...20))")
        secondImg.image = UIImage(named: "\(Int.random(in: 1...20))")
        thirdImg.image = UIImage(named: "\(Int.random(in: 1...20))")
        mainImg.image = UIImage(named: "\(Int.random(in: 1...20))")
    }
    @IBAction func tapBorderBtn(_ sender: Any) {
        firstImg.layer.borderWidth = CGFloat(slider.value)
        secondImg.layer.borderWidth = CGFloat(slider.value)
        thirdImg.layer.borderWidth = CGFloat(slider.value)

        
    }
    
    
}

