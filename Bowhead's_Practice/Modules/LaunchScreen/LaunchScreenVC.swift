//
//  LaunchScreenVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 09/10/21.
//

import UIKit

class LaunchScreenVC: UIViewController, Storyboarded {

    @IBOutlet weak var animationImg: UIImageView!
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer?.invalidate()
        timer = nil
        self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.animationView), userInfo: nil, repeats: false)

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    @objc func animationView(){
//        UIView.animate(withDuration: 0.5, delay: 0, options: [ .allowUserInteraction], animations: {
//            self.meInteresaBtn.alpha = 1.0
//        })
        
        goto()
        
                
    }
    
    func goto(){
        if let _ = UserAccountDB.shared.getCuenta() {
            let vc = ContenedorPrincipalVC.instantiate(fromStoryboard: .Main)
            let controladorActual = StartTestVC.instantiate(fromStoryboard: .Main)
            vc.controladorActual = controladorActual
            
            self.navigationController?.setViewControllers([vc], animated: true)
        }else {
            let vc = StartVC.instantiate(fromStoryboard: .Main)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
