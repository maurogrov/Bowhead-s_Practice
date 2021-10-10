//
//  StartTestVC+UITableView.swift
//  Bowhead's_Practice
//
//  Created by Mauricio Guerrero on 10/10/21.
//

import UIKit

extension StartTestVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestCellTableViewCell.identifier, for: indexPath) as! TestCellTableViewCell
        let row = indexPath.row
        cell.configure(cuestions[row])
        
        cell.pressActionHandler = { id in
            for (indey, option) in cuestions[row].options.enumerated() {
                if option.id == id {
                    cuestions[row].options[indey].selected = true
                }else {
                    cuestions[row].options[indey].selected = false
                }
            }
            self.submitTestBtn.isEnabled = self.br.canSubmitBtnAct
        }
        
        return cell
    }
    
}
