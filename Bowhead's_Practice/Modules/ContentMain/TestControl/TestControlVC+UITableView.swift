//
//  TestControlVC+UITableView.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 10/10/21.
//

import UIKit

extension TestControlVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))
        headerView.backgroundColor = BowHeadColor.BackGroundLight.color
        
        let stack = UIStackView(frame: CGRect.init(x: 20, y: 10, width: tableView.frame.width - 40, height: headerView.frame.height - 20))
        
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 20
        
        let button = createSearchBtn()
        stack.addArrangedSubview(button)
        
        if answerFilter != nil {
            let cancelBtn = self.createCancelBtn()
            stack.addArrangedSubview(cancelBtn)
            cancelBtn.widthAnchor.constraint(equalToConstant: 45).isActive = true
        }
        
        headerView.addSubview(stack)
        
        return headerView
    }

    func createSearchBtn() -> UIButton {
        
        let buscarBtn = br.createBuscarBtn()
        
        if dateSelected != nil {
            buscarBtn.setTitle("\(dateSelected!.stringFormat())", for: .normal)
            buscarBtn.setImage(nil, for: .normal)
        }else {
            buscarBtn.setTitle("Search", for: .normal)
            buscarBtn.setImage(br.magnifyingglass, for: .normal)
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(buscarBtnAct(_:)))
        buscarBtn.addGestureRecognizer(gesture)
        
        return buscarBtn
    }
    
    func createCancelBtn() -> UIButton {
        
        let btn = br.createCancelBtn()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(cancelSearchBtnAct(_:)))
        btn.addGestureRecognizer(gesture)
        
        return btn
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = answerFilter != nil ? answerFilter!.count : answers.count
        notFoundView.isHidden = count == 0 ? false : true
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnswerLogCell.identifier, for: indexPath) as! AnswerLogCell
        
        let row = indexPath.row
        let item = answerFilter != nil ? answerFilter![row] : answers[row]
        cell.configure(item)
        
        return cell
    }
}
