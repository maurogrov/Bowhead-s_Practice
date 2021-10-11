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
    
    @IBOutlet weak var notFoundView: UIView!
    @IBOutlet weak var noDataLbl: UILabel!
    
    var answers : [Answers] = []
    var answerFilter : [Answers]?
    var br : TestControlBR = TestControlBR()
    
    
    deinit {
        //print("testControl end")
    }
    
    var dateSelected : Date? {
        didSet {
            if dateSelected != nil {
                answerFilter = answers.filter(
                    { $0.dateTime.stringFormat() == dateSelected?.stringFormat() }
                )
            }
            else {
                answerFilter = nil
            }
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConfig()
        getData()
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
        
        noDataLbl.text = "No data"
        noDataLbl.font = BowHeadFont.Light.font(ofSize: .Normal)
        
    }
    
    func setupConfig(){
        
        
        tableView.register(
            UINib(nibName: AnswerLogCell.identifier, bundle: nil),
            forCellReuseIdentifier: AnswerLogCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goTo(_:)))
        backBtn.addGestureRecognizer(gesture)
        
    }
    
    func getData(){
        br = TestControlBR()
        
        let data = AnswersDB.shared.getAnswers()
        if  data.count > 0 {
            answers = data.sorted(by: { $0.dateTime.compare($1.dateTime) == .orderedDescending })
            tableView.reloadData()
        }
    }
    
    //MARK: -ACTIONS
    
    @objc func goTo(_ : UITapGestureRecognizer) {
        
        let vc = StartTestVC.instantiate(fromStoryboard: .Main)
        NotificationCenter.default.post(
            name: BowInternalNotification.hijoControlador.name,
            object: nil,
            userInfo: ["child": vc, "tag": "0"])
    }
    
    @objc func buscarBtnAct(_ : UITapGestureRecognizer){

        let datePicker = br.datePicker
        datePicker.frame = CGRect(
            x: 10, y: 15, width: self.view.frame.width - 20, height: 200
        )
        let alertPicker = br.alertPicker
        let actions : [UIAlertAction] = [
            UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.dateSelected = datePicker.date
            }),
            UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                self.dateSelected = nil
            })
        ]
        
        alertPicker.view.addSubview(datePicker)
        actions.forEach({ alertPicker.addAction($0)})
        present(alertPicker, animated: true)
    }
    
    @objc func cancelSearchBtnAct(_ : UITapGestureRecognizer){
        dateSelected = nil
    }
    
}
