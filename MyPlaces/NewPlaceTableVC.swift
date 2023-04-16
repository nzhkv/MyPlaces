//
//  NewPlaceTableVC.swift
//  MyPlaces
//
//  Created by Nikolay Zhukov on 16.04.2023.
//

import UIKit

class NewPlaceTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true )
        }
    }
}

extension NewPlaceTableVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
