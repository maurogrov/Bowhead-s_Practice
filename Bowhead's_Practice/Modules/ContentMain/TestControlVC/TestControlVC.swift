//
//  TestControlVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 07/10/21.
//

import UIKit

class TestControlVC: UIViewController {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
}

extension TestControlVC {
    
    func setup(){
        backView.backgroundColor = BowHeadColor.BackGroundLight.color
        titleLbl.text = "Answer Logs"
        titleLbl.font = BowHeadFont.Bold.font(ofSize: .Large)
        backBtn.layer.cornerRadius = 20.0
        backBtn.layer.borderWidth = 1.0
        backBtn.layer.borderColor = UIColor.lightGray.cgColor
        backBtn.clipsToBounds = true
        
    }
}
