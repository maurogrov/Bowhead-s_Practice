//
//  AttibutedTabBar.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 08/10/21.
//

import UIKit

class AttributedTabBar: UITabBar {
    
  
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
        
        
        let tabGradientView = UIView(frame: bounds)
        tabGradientView.backgroundColor = UIColor.white
        tabGradientView.translatesAutoresizingMaskIntoConstraints = false;
        
        
        addSubview(tabGradientView)
        sendSubviewToBack(tabGradientView)
        //self.bounds.aurt
        //bounds.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.6
        clipsToBounds = false
        backgroundImage = UIImage()
        shadowImage = UIImage()
    }
}


    
