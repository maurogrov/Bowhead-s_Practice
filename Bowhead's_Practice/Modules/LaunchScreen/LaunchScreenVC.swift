//
//  LaunchScreenVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 09/10/21.
//

import UIKit

class LaunchScreenVC: UIViewController, Storyboarded {

    @IBOutlet weak var animationImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationImg.image = BowHeadImage.iconMain.image
        setupAnimation()
    }
    
    func setupAnimation(){
        
        let duration = 0.4
        UIView.animate(withDuration: duration, animations: {
            self.animationImg.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: {_ in
            UIView.animate(withDuration: duration, animations: {
                self.animationImg.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: {_ in
                UIView.animate(withDuration: duration, animations: {
                    self.animationImg.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                }, completion: { _ in
                    UIView.animate(withDuration: duration, animations: {
                        self.animationImg.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }, completion: { _ in
                        self.goto()
                    } )
                })
            })
        })
        
    }
    
    func goto(){
        if let _ = UserAccountDB.shared.getCuenta() {
            let vc = ContainerMainVC.instantiate(fromStoryboard: .Main)
            let controladorActual = StartTestVC.instantiate(fromStoryboard: .Main)
            vc.currentController = controladorActual
            
            self.navigationController?.setViewControllers([vc], animated: false)
        }else {
            let vc = StartVC.instantiate(fromStoryboard: .Main)
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
}
