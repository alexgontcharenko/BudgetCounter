//
//  StatisticsVC.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//

import UIKit

class StatisticsVC: UIViewController {
    private let myArray = ["First","Second","Third"]
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5129564404, green: 0.5324382186, blue: 0.5864207149, alpha: 1)
        self.navigationController?.navigationBar.topItem?.title = "Expenses"
    }
    
    func setTableView() {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight-100))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StatCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
}

extension StatisticsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        
        return cell
    }
    
    
}
