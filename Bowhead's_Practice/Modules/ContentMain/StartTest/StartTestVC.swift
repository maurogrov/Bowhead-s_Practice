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
    @IBOutlet weak var boxDataBtn: UIButton!
    
    //MARK: -PROPERTIES
    internal enum GoToEnum {
        case start
        case controlTest
    }
    internal let br = StartTestBR()
    internal var answers = AnswersDB.shared.getAnswers()
    
    //MARK: -LIFE CICLE
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        br.formatCuestions()
        
    }
    
    private func setupUI(){
        
        doctorsImg.image = BowHeadImage.doctors.image
        introductionLbl.text = "Track your wellness"
        introductionLbl.font = BowHeadFont.SemiBold.font(ofSize: .Large)
        submitTestBtn.setTitle("Submit", for: .normal)
        submitTestBtn.isEnabled = false
        closeBtn.setImage(UIImage(systemName: "power"), for: .normal)
        closeBtn.tintColor = BowHeadColor.GreenAqua.color
        boxDataBtn.tintColor = BowHeadColor.GreenAqua.color
        
    }
    
    private func setup(){
        
        let gesture =       UITapGestureRecognizer(target: self, action: #selector(closeSession(_:)))
        let gestureBoxData = UITapGestureRecognizer(target: self, action: #selector(createBoxData(_:)))
        let gestureSubmit = UITapGestureRecognizer(target: self, action: #selector(submit(_:)))
        
        tableView.register(
            UINib(nibName: TestCellTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: TestCellTableViewCell.identifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
        closeBtn.addGestureRecognizer(gesture)
        boxDataBtn.addGestureRecognizer(gestureBoxData)
        submitTestBtn.addGestureRecognizer(gestureSubmit)
        
        evaluateboxData()
    }
      
    private func evaluateboxData(){
        answers = AnswersDB.shared.getAnswers()
        let image = answers.count > 1 ? br.trashImage : br.boxImage
        boxDataBtn.setImage(image, for: .normal)
    }
    
    //MARK: -ACTIONS
    @objc func submit(_ : UITapGestureRecognizer){
        saveAnsewrsToday(br.createAnswerToday())
    }
    
    @objc func closeSession(_ : UITapGestureRecognizer) {
        
        UserAccountDB.shared.deleteCuenta()
        if UserAccountDB.shared.getCuenta() == nil {
            goto(.start)
        }
    }
    
    @objc func createBoxData(_ : UITapGestureRecognizer) {
        
        let alert: UIAlertController!
        
        if answers.count > 1 {
            alert = AlertBuilder.getConfirmationAlert(message: br.deleteBox, successFunc: {
                AnswersDB.shared.deleteAllAnswers()
                self.evaluateboxData()
            })
            self.present(alert, animated: true, completion: nil)
            return
        }else {
            alert = AlertBuilder.getConfirmationAlert(message: br.createBox, successFunc: {
                self.br.createCuestionsRandom()
                self.evaluateboxData()
                self.goto(.controlTest)
            })
        }
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func saveAnsewrsToday(_ answers : Answers){
        
        do{
            try AnswersDB.shared.setAnswers(answers: answers, completionHandler: {
                let alert = AlertBuilder.getMessageAlert(
                    message: self.br.saveSuccess, completion: nil) {
                    
                    self.goto(.controlTest)
                    
                }
                self.present(alert, animated: true, completion: nil)
                
            })
        }
        catch {
            //#AlertApiService
            let alert = AlertBuilder.getMessageAlert(message: br.error)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func goto(_ option: GoToEnum){
        
        switch option {
        case .start:
            let vc = StartVC.instantiate(fromStoryboard: .Main)
            self.navigationController?.setViewControllers([vc], animated: true)
            break
        case .controlTest:
            let vc = TestControlVC.instantiate(fromStoryboard: .Main)
            NotificationCenter.default.post(
                name: BowInternalNotification.hijoControlador.name,
                object: nil,
                userInfo: ["child": vc, "tag": "1"])
            break
        }
    }
}


