//
//  AttributedButton.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//

import UIKit

class AttributedButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                layer.backgroundColor = BowHeadColor.GreenAqua.cgColor
            }
            else {
                layer.backgroundColor = BowHeadColor.ButtonDisabled.cgColor
            }
        }
    }
    
    override init(frame :CGRect)  {
        super.init(frame : frame)
        self.awakeFromNib()
        
        self.layoutSubviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.awakeFromNib()
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override func awakeFromNib()
    {
        layer.cornerRadius = 10.0
        layer.backgroundColor = BowHeadColor.GreenAqua.cgColor
        titleLabel?.font = BowHeadFont.Regular.font(ofSize: .Large)
        setTitleColor(BowHeadColor.Background.color, for: .normal)
    }
}


    
