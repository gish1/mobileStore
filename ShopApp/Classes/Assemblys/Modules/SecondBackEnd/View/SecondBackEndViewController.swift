//
//  SecondBackEndViewController.swift
//  ShopApp
//
//  Created by Пк on 30.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class SecondBackEndViewController: UITableViewController, SecondBackEndViewInput {

    
    var output: SecondBackEndViewOutput!
    var nameTextField: UITextField!
    var priceTextField: UITextField!
    var quantityTextField: UITextField!
    
    @IBOutlet var arrTextFields: [UITextField]!
    
    var modelsArr =  [StoreFrontViewModel]()
    var secondModel : StoreFrontViewModel!
    var arrIndex : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        output.viewDidLoad()
        
        for textField in arrTextFields {
            if textField.tag == 1 {
                nameTextField = textField
            } else if textField.tag == 2 {
                priceTextField = textField
            } else if textField.tag == 3 {
                quantityTextField = textField
            }
            textField.delegate = self
        }
        
        if secondModel != nil {
            nameTextField.text = secondModel.name
            priceTextField.text = "\(secondModel.price)"
            quantityTextField.text = "\(secondModel.quantity)"
        } else {
            secondModel = StoreFrontViewModel(name: "", price: "", quantity: 0)
        }
    }
}

// MARK: Configure

extension SecondBackEndViewController: UITextFieldDelegate {
    
// MARK: - Text Field Delegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag != arrTextFields.count {
            let nextFiels = arrTextFields[textField.tag]
            nextFiels.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.priceTextField || textField == self.quantityTextField {
            let invalidCharSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@!#$%&'*+-/=?^_`{|}~():;[],").inverted
            let filtered = string.components(separatedBy: invalidCharSet)
            
            for item in filtered  {
                if item != string {
                    return true
                } else if string == "" {
                    return true
                } else {
                    return false
                }
            }
        }
        return true
    }
}

// MARK: - View Input

extension SecondBackEndViewController {
    func set(title: String) {
        self.title = title
    }
    
    func set(models: [StoreFrontViewModel]) {
        modelsArr = models
    }
    
    func set(models: [StoreFrontViewModel], index: Int) {
        secondModel = models[index]
        arrIndex = index
        modelsArr = models
    }
}

// MARK: - Button Action

extension SecondBackEndViewController {
    @IBAction func saveButtonAction(_ sender: UIButton) {
        if nameTextField.text == "" || priceTextField.text == ""  || quantityTextField.text == "" {
            output.showAlert(title: "Внимание!", message: "Необходимо заполнить все поля.")
        } else {
            secondModel.name = nameTextField.text ?? ""
            secondModel.price = priceTextField.text ?? ""
            secondModel.quantity = (quantityTextField.text! as NSString).integerValue
        
            if arrIndex != nil  {
                modelsArr.replaceElement(modelsArr[arrIndex], withElement: secondModel)
                print(output.save(data: modelsArr))
            } else {
                modelsArr.append(secondModel)
                print(output.save(data:modelsArr))
            }
        }
        output.cancelDidTap()
    }
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        output.cancelDidTap()
    }
}
