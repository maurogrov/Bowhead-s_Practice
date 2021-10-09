//
//  StartVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//

import UIKit

class StartVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var walleImg: UIImageView!
    @IBOutlet weak var manSecurityImg: UIImageView!
    @IBOutlet weak var leyendLbl: UILabel!
    @IBOutlet weak var startBtn: AttributedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup(){
        
        walleImg.image = BowHeadImage.walle.image
        manSecurityImg.image = BowHeadImage.manSecurity.image
        
        
        let title = NSMutableAttributedString(
            string: "Welcome to:\n",
            attributes: [NSAttributedString.Key.font: BowHeadFont.Regular.font(ofSize: .Large)])
        title.append(
            NSMutableAttributedString(
                string: "Bowhead's",
                attributes: [NSAttributedString.Key.font: BowHeadFont.Bold.font(ofSize: .Big)]))
        titleLbl.attributedText = title
        
        leyendLbl.text = "Wellness logger"
        leyendLbl.font = BowHeadFont.Medium.font(ofSize: .Medium)
        
        startBtn.setTitle("START", for: .normal)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goTo(_:)))
        startBtn.addGestureRecognizer(gesture)
    }
    
    @objc func goTo(_ : UITapGestureRecognizer) {
        
        let vc = LoginVC.instantiate(fromStoryboard: .Main)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

