//
//  TestControlBR.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 10/10/21.
//

import UIKit

class TestControlBR {
    
    var magnifyingglass : UIImage {
        UIImage(systemName: "magnifyingglass")!
    }
    
   
    
    func createBuscarBtn() -> UIButton {
        
        let buscarBtn = UIButton()
      
        buscarBtn.titleLabel?.font = BowHeadFont.Light.font(ofSize: .Normal)
        
        buscarBtn.setTitleColor(.black, for: .normal)
        buscarBtn.backgroundColor = .white
        
     
        buscarBtn.tintColor = BowHeadColor.GreenAqua.color
        buscarBtn.layer.cornerRadius = 20.0
        buscarBtn.layer.borderWidth = 1.0
        buscarBtn.layer.borderColor = UIColor.lightGray.cgColor
    
        return buscarBtn
    }
    
    func createCancelBtn() -> UIButton {
        let cancelBtn = UIButton()
        
        cancelBtn.backgroundColor = .white
        cancelBtn.tintColor =  .red
        cancelBtn.layer.cornerRadius = 20.0
        cancelBtn.layer.borderWidth = 1.0
        cancelBtn.layer.borderColor = UIColor.lightGray.cgColor
        let image = UIImage(systemName: "xmark")!
        cancelBtn.setImage(image, for: .normal)
        
        return cancelBtn
      
    }
    
    
    
}
