//
//  TestControlVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 07/10/21.
//

import UIKit

class TestControlVC: UIViewController, Storyboarded {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let answers = [
        Answers(dateTime: Date(), answers: [
            Answer(idCuestion: 1, idOption: 1),
            Answer(idCuestion: 2, idOption: 4)
        ])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setup()
    }
    
}

extension TestControlVC {
    
    func setupUI(){
        
        backView.backgroundColor = BowHeadColor.BackGroundLight.color
        titleLbl.text = "Answer Logs"
        titleLbl.font = BowHeadFont.Bold.font(ofSize: .Large)
        backBtn.layer.cornerRadius = 20.0
        backBtn.layer.borderWidth = 1.0
        backBtn.layer.borderColor = UIColor.lightGray.cgColor
        backBtn.clipsToBounds = true
        
    }
    
    func setup(){
        tableView.register(
            UINib(nibName: AnswerLogCell.identifier, bundle: nil),
            forCellReuseIdentifier: AnswerLogCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension TestControlVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerLogCell.identifier, for: indexPath) as! AnswerLogCell
        let row = indexPath.row
        
        cell.configure(answers[row])
        
        return cell
    }
    
}
