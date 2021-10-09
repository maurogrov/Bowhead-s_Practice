//
//  StartTestVC.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero Vega on 07/10/21.
//

import UIKit


class StartTestVC: UIViewController, Storyboarded{

    @IBOutlet weak var doctorsImg: UIImageView!
    @IBOutlet weak var introductionLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitTestBtn: AttributedButton!
    @IBOutlet weak var closeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setup()
        
//        if let x = AnswersDB.shared.getAnswers() {
//            print(x)
//            try? AnswersDB.shared.deleteAnswers()
//        }
//        else {
//            let x = Answers(dateTime: Date(), answers: [])
//            try? AnswersDB.shared.setAnswers(answers: x)
//            let y = AnswersDB.shared.getAnswers()
//            print(y!)
//        }
//
        
//        let user = UserAccountDB.shared.getCuenta()
//        try? UserAccountDB.shared.set(cuenta: UserAccount(name: "Anonimous", password: "123123"))
//        let user2 = UserAccountDB.shared.getCuenta()
//        print(user2)
//
//        UserAccountDB.shared.deleteCuenta()
//        let user3 = UserAccountDB.shared.getCuenta()
//
        print("finished")
        
    
        
    }
    
    func setupUI(){
        
        doctorsImg.image = BowHeadImage.doctors.image
        introductionLbl.text = "Track your wellness"
        introductionLbl.font = BowHeadFont.SemiBold.font(ofSize: .Large)
        submitTestBtn.setTitle("Submit", for: .normal)
        submitTestBtn.isEnabled = false
        closeBtn.setImage(UIImage(systemName: "power"), for: .normal)
        closeBtn.tintColor = BowHeadColor.GreenAqua.color
        
    }
    
    func setup(){
        tableView.register(UINib(nibName: TestCellTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: TestCellTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeSession(_:)))
        closeBtn.addGestureRecognizer(gesture)
    }
    
    func evaluateSubmit() -> Bool {
        
        var isEnable = true
        for cuestion in cuestions {
            if cuestion.options.filter({ $0.selected }).count == 0 {
                isEnable = false
                break
            }
        }
        return isEnable
    }
    
    func submit(){
        
        var answersToday = Answers(dateTime: Date(), answers: [])
        
        for cuestion in cuestions {
            let optionSelected = cuestion.options.filter({ $0.selected }).first!
            answersToday.answers.append(
                Answer(idCuestion: cuestion.idCuestion, idOption: optionSelected.id)
            )
        }
        
        #warning("Save Answers")
    }
    
    @objc func closeSession(_ : UITapGestureRecognizer) {
        
        UserAccountDB.shared.deleteCuenta()
        if UserAccountDB.shared.getCuenta() == nil {
            goto()
        }
    }
    
    func goto(){
        let vc = StartVC.instantiate(fromStoryboard: .Main)
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
}

extension StartTestVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuestions.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestCellTableViewCell.identifier, for: indexPath) as! TestCellTableViewCell
        let row = indexPath.row
        cell.configure(cuestions[row])
        
        cell.pressActionHandler = { id in
            //print("\(id)")
            for (indey, option) in cuestions[row].options.enumerated() {
                if option.id == id {
                    cuestions[row].options[indey].selected = true
                }else {
                    cuestions[row].options[indey].selected = false
                }
            }
            self.submitTestBtn.isEnabled = self.evaluateSubmit()
        }
        
        
        return cell
    }
    
    
    
    
    
}
