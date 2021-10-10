//
//  AnswerLogCell.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 07/10/21.
//

import UIKit

class AnswerLogCell: UITableViewCell {
    
    public static let identifier = "AnswerLogCell"
    @IBOutlet weak var answerStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configure(_ item: Answers){
        
        answerStack.subviews.forEach({
            answerStack.removeArrangedSubview($0)
            $0.removeFromSuperview()
        })
        
        let header = configureHeader(text: item.dateTime.stringFormat())
        answerStack.addArrangedSubview(header)
        
        for answer in item.answers {
            let cuestion = cuestions.filter({ $0.idCuestion == answer.idCuestion }).first!
            let option = cuestion.options.filter({ $0.id == answer.idOption }).first!
            let rowRegister = setRowRegister(typeAnswer: cuestion.typeAnswer, response: option.response)
            answerStack.addArrangedSubview(rowRegister)
        }
    }
    
    func configureHeader(text : String) -> UILabel {
        
        let headerLbl = UILabel()
        headerLbl.textColor = .black
        headerLbl.font = BowHeadFont.Light.font(ofSize: .Minus)
        headerLbl.textAlignment = .right
       
        headerLbl.text = text
        
        return headerLbl
        
    }
    
    func setRowRegister(typeAnswer: String, response: String) -> UILabel {
        
        let typeAnswerLbl = UILabel()
        typeAnswerLbl.textColor = .black
        
        let title = NSMutableAttributedString(
            string: "\(typeAnswer):  ",
            attributes: [NSAttributedString.Key.font: BowHeadFont.Medium.font(ofSize: .Medium)])
        title.append(
            NSMutableAttributedString(
                string: "\(response)",
                attributes: [NSAttributedString.Key.font: BowHeadFont.Light.font(ofSize: .Medium)]))
        typeAnswerLbl.attributedText = title
        
        
        return typeAnswerLbl
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
