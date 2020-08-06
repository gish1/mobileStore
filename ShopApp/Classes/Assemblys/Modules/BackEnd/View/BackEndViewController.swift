//
//  BackEndViewController.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit

class BackEndViewController: UITableViewController, BackEndViewInput {
    var output: BackEndViewOutput!
    var informationArr =  [StoreFrontViewModel]()
    var index = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewLoadInformation()
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
    }
    
// MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informationArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model : StoreFrontViewModel!
        model = informationArr[indexPath.row]
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)

        if cell == nil{
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
        }
        
        cell?.textLabel?.text = model.name
        cell?.detailTextLabel?.text = "\(model.quantity)"
        
        return cell!
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        informationArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)

        print(output.save(data: informationArr))
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.informationDidTap(models: informationArr, index: indexPath.row)
    }
}

// MARK: Configure

extension BackEndViewController {
}

// MARK: - View Input

extension BackEndViewController {
    func set(title: String) {
        self.title = title
    }
    
    func set(models: Any?) {
        if let modelsArr = models {
            informationArr = modelsArr as! [StoreFrontViewModel]
        }
    }
}

// MARK: - Button Action

extension BackEndViewController {
    @IBAction func addButtonAction(_ sender: UIButton) {
        output.informationDidTap(models: informationArr)
    }
}
