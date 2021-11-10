//
//  StatisticsVC.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//

import UIKit
import CoreData

class StatisticsVC: UIViewController {
    
    private var appDelegate: AppDelegate =
      UIApplication.shared.delegate as! AppDelegate
    private var transactions: [Transaction]!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
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

//  MARK: - Core Data
    
    private func getData() {
        let fetchRequest: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "amount BEGINSWITH '-'")
        transactions = try? appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
    }
    
}

//  MARK: - Extension

extension StatisticsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(transactions[indexPath.row].category ?? "null")"+"            \(transactions[indexPath.row].amount) "
        
        return cell
    }
    
    
}
