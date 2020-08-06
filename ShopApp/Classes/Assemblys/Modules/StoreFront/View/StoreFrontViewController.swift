//
//  StoreFrontViewController.swift
//  ShopApp
//
//  Created by Пк on 24.07.2020
//  Copyright © 2020 Пк. All rights reserved.
//

import UIKit
import MXPagerView

class StoreFrontViewController: UIViewController, StoreFrontViewInput {

    @IBOutlet var pagerView: MXPagerView!
    
    var output: StoreFrontViewOutput!
    var filterModelsArr =  [StoreFrontViewModel]()
    var allModelsArr =  [StoreFrontViewModel]()
    var secondModel : StoreFrontViewModel!
    var number : Int!
    var isPageLoad : Bool!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        pagerView.register(UITableView.self, forPageReuseIdentifier: "TablePage")
        isPageLoad = false
    }
    
    func reloadView() {
        output.viewLoadInformation()
        pagerView.reloadData()
    }
    
    func setupBuyButton() -> UIButton {
        let buyButton = UIButton(frame: CGRect(x: 110, y: 20, width: 200, height: 45))
        buyButton.backgroundColor = #colorLiteral(red: 0.9182453156, green: 0.9182668328, blue: 0.9182552695, alpha: 1)
        buyButton.setTitle("Купить", for: .normal)
        buyButton.setTitleColor(.black, for: .normal)
        buyButton.cornerRadius = 5
        buyButton.borderColor = .black
        buyButton.borderWidth = 1
        buyButton.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
        
        return buyButton
    }
}

// MARK:  Configure
extension StoreFrontViewController: MXPagerViewDelegate, MXPagerViewDataSource, UITableViewDelegate, UITableViewDataSource {

// MARK: - Pager view data source

    func numberOfPages(in pagerView: MXPagerView) -> Int {
        return filterModelsArr.count
    }

    func pagerView(_ pagerView: MXPagerView, viewForPageAt index: Int) -> UIView? {
        if !isPageLoad {
            isPageLoad = true
            
            secondModel = filterModelsArr[index]
            let tableView = pagerView.dequeueReusablePage(withIdentifier: "TablePage") as! UITableView
            tableView.delegate = self
            tableView.dataSource = self
            tableView.isScrollEnabled = false
            tableView.reloadData()
            
            return tableView
        }
        return nil
    }

// MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)

        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
        }
        
        isPageLoad = false
        
        if indexPath.row == 0 {
            cell?.textLabel?.text = secondModel.name
        } else if indexPath.row == 1 {
            cell?.textLabel?.text = "Цена"
            cell?.detailTextLabel?.text = "\(secondModel.price) р."
        } else if indexPath.row == 2 {
            cell?.textLabel?.text = "Количество"
            cell?.detailTextLabel?.text = "\(secondModel.quantity) шт."
        } else if indexPath.row == 3 {
            cell?.addSubview(setupBuyButton())
        }
        
        return cell!
    }

// MARK: - Table view delegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - View Input

extension StoreFrontViewController {
    func set(title: String) {
        self.title = title
    }
    
    func set(models: Any?) {
        if let item = models {
            var secondArr = [StoreFrontViewModel]()
            secondArr = item as! [StoreFrontViewModel]
            allModelsArr = secondArr
            filterModelsArr = secondArr.filter({ $0.quantity > 0 })
        }
    }
}

// MARK: - Button Action

extension StoreFrontViewController {
    @objc func buyButtonAction(sender: UIButton) {
        var model = secondModel
        
        model!.name = secondModel.name
        model!.price = secondModel.price
        model!.quantity = secondModel.quantity - 1
        
        if allModelsArr.replaceElement(secondModel, withElement: model!) {
            print(output.save(data: allModelsArr))
            output.showAlert(title: "Успешно!", message: "Вы совершили покупку")
            reloadView()
        }
    }
}
