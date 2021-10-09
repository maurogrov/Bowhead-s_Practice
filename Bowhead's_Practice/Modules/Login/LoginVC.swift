//
//  LoginVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//

import UIKit

class LoginVC: UIViewController, Storyboarded {

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
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(log(_:)))
        startBtn.addGestureRecognizer(gesture)
    }
    
    @objc func log(_ : UITapGestureRecognizer) {
        
        guard let password = passwordTxt.text, password != "" else {
            #warning("Create Alert")
            return
        }
        try? UserAccountDB.shared.set(cuenta: UserAccount(name: "Anonymous", password: "\(password)"))
        goto()
    }
    
    
    func goto(){
        let vc = ContenedorPrincipalVC.instantiate(fromStoryboard: .Main)
        let controladorActual = StartTestVC.instantiate(fromStoryboard: .Main)
        vc.controladorActual = controladorActual
        
        self.navigationController?.setViewControllers([vc], animated: true)
    }
}
