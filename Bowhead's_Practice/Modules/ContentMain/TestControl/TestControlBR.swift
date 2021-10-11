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
    
    var datePicker : UIDatePicker {
        
        let datePicker = UIDatePicker()
        
        datePicker.maximumDate = Date()
        datePicker.minimumDate = Calendar.current.date(
            byAdding: .month, value: -1, to: Date())
        datePicker.datePickerMode = .date
        datePicker.timeZone = NSTimeZone.local
        datePicker.preferredDatePickerStyle = .wheels
        
        return datePicker
    }
    
    var alertPicker : UIAlertController {
        let alertController = UIAlertController(
            title: "\n\n\n\n\n\n\n\n\n\n\n",
            message: nil, preferredStyle: .actionSheet)
        return alertController
    }
    
   
    
    func createBuscarBtn() -> UIButton {
        
        let searchBtn = UIButton()
      
        searchBtn.titleLabel?.font = BowHeadFont.Light.font(ofSize: .Normal)
        
        searchBtn.setTitleColor(.black, for: .normal)
        searchBtn.backgroundColor = .white
        
     
        searchBtn.tintColor = BowHeadColor.GreenAqua.color
        searchBtn.layer.cornerRadius = 20.0
        searchBtn.layer.borderWidth = 1.0
        searchBtn.layer.borderColor = UIColor.lightGray.cgColor
    
        return searchBtn
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
