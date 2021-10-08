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
        
        for answer in item.answers {
            let cuestion = cuestions.filter({ $0.idCuestion == answer.idCuestion }).first!
            let option = cuestion.options.filter({ $0.id == answer.idOption }).first!
            let stack = confitureUI(typeAnswer: cuestion.typeAnswer, response: option.response)
            answerStack.addArrangedSubview(stack)
        }
    }
    
    func confitureUI(typeAnswer: String, response: String) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        //stackView.spacing = 10
        
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
        
        stackView.addArrangedSubview(typeAnswerLbl)
        
        return stackView
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
