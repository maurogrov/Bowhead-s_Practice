//
//  CheckBox.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 07/10/21.
//

import UIKit

class CheckBox: UIButton {
    
    var pressActionHandler: ((Bool) -> Void)?
    
    // Images
    let checkedImage = UIImage(systemName: "circle.dashed.inset.fill")
    let uncheckedImage = UIImage(systemName: "circle.dashed")
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 30, height: 30)
    }
    
    // Bool property
    @objc dynamic var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    @IBInspectable var shouldKeepCheck: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    var checkHandler: ((Bool)->Void)?
        
    override func awakeFromNib() {
        setup()
    }
    
    func setup() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
        self.setTitle("", for: .normal)
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            if shouldKeepCheck {
                if !isChecked {
                    isChecked = !isChecked
                    checkHandler?(isChecked)
                }
            } else {
                isChecked = !isChecked
                checkHandler?(isChecked)
            }
        }
    }
}

