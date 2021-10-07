//
//  TestCellTableViewCell.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 07/10/21.
//

import UIKit

class TestCellTableViewCell: UITableViewCell {
    
    public static let identifier = "TestCellTableViewCell"
    @IBOutlet weak var nameCuestion: UILabel!
    @IBOutlet weak var optionsStack: UIStackView!
    
    var optionsButtons : [CheckBox] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    var pressActionHandler: ((Int) -> Void)?
    
    func configure(_ item : Cuestion){
        setupUI()
        nameCuestion.text = item.name
        
        
        
        for option in item.options {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = 5
            
            let button = CheckBox()
            button.tintColor = BowHeadColor.GreenAqua.color
            stackView.addArrangedSubview(button)
            button.widthAnchor.constraint(equalToConstant: 30).isActive = true
            
            let gesture = TagTapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            gesture.tag = option.id
            button.tag = option.id
            button.addGestureRecognizer(gesture)
            button.pressActionHandler = { isActive in
                //print(isActive)
                button.isChecked = isActive
            }
            optionsButtons.append(button)
            
            
            let label = UILabel()
            label.text = option.name
            label.font = BowHeadFont.Regular.font(ofSize: .Normal)

            stackView.addArrangedSubview(label)

            optionsStack.addArrangedSubview(stackView)
        }
    }
    
    @objc func handleTap(_ item: TagTapGestureRecognizer) {
        pressActionHandler?(item.tag)
        for button in optionsButtons {
            if button.tag == item.tag {
                button.pressActionHandler?(true)
            }else {
                button.pressActionHandler?(false)
            }
        }
        
    }
    
    func setupUI(){
        nameCuestion.font = BowHeadFont.Medium.font(ofSize: .Medium)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

class TagTapGestureRecognizer : UITapGestureRecognizer {
    var tag: Int = 0
}
