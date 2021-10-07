//
//  AttributedTextField.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 06/10/21.
//

import UIKit

class AttributedTextField: UITextField {
    
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
        font = BowHeadFont.Regular.font(ofSize: .Normal)
    }
    
}
