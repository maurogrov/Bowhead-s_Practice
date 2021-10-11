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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    
    
    func setup(){
        self.dismissKeyboardWhenTapped()
        
        manSecurityImg.image = BowHeadImage.manSecurity.image
        instructionLbl.text = "Create a Password"
        instructionLbl.font = BowHeadFont.Bold.font(ofSize: .Large)
        passwordTxt.placeholder = "Password"
        passwordTxt.isSecureTextEntry = true
        
        startBtn.setTitle("Lets Go!", for: .normal)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(log(_:)))
        startBtn.addGestureRecognizer(gesture)
        
        let notifier = NotificationCenter.default
        notifier.addObserver(self,
                             selector: #selector(self.keyboardWillShowNotification(_:)),
                             name: UIWindow.keyboardWillShowNotification,
                             object: nil)
        notifier.addObserver(self,
                             selector: #selector(self.keyboardWillHideNotification(_:)),
                             name: UIWindow.keyboardWillHideNotification,
                             object: nil)
    }
    
    
    //MARK: ACTIONS
    @objc func log(_ : UITapGestureRecognizer) {
        
        guard let password = passwordTxt.text, password != "" else {
            let alert = AlertBuilder.getMessageAlert(
                message: "Create a password", completion: nil)
            self.present(alert, animated: true, completion: nil)
            return
        }
        try? UserAccountDB.shared.set(cuenta: UserAccount(name: "Anonymous", password: "\(password)"))
        goto()
    }
    
    @objc func keyboardWillShowNotification(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= (keyboardSize.height / 2)
        }
    }

    @objc func keyboardWillHideNotification(_ notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    
    func goto(){
        let vc = ContainerMainVC.instantiate(fromStoryboard: .Main)
        let controladorActual = StartTestVC.instantiate(fromStoryboard: .Main)
        vc.currentController = controladorActual
        
        self.navigationController?.setViewControllers([vc], animated: true)
    }
}
