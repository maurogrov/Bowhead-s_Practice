//
//  LoginVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var manSecurityImg: UIImageView!
    @IBOutlet weak var instructionLbl: UILabel!
    @IBOutlet weak var passwordTxt: AttributedTextField!
    @IBOutlet weak var startBtn: AttributedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    

    func setup(){
        manSecurityImg.image = BowHeadImage.manSecurity.image
        instructionLbl.text = "Create a Password"
        instructionLbl.font = BowHeadFont.Bold.font(ofSize: .Large)
        passwordTxt.placeholder = "Password"
        
        startBtn.setTitle("Lets Go!", for: .normal)
        
    }
}
