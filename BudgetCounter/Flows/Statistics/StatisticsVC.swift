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
    private var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
        setTotalLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
        updateTotal()
        tableView.reloadData()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5129564404, green: 0.5324382186, blue: 0.5864207149, alpha: 1)
        self.navigationController?.navigationBar.topItem?.title = "Expenses"
    }
    
    func setTableView() {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight-100))
        tableView.register(StatCell.self, forCellReuseIdentifier: "StatCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    func setTotalLabel() {
        totalLabel = UILabel()
        totalLabel.textAlignment = .right
        totalLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0).isActive = true
        totalLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        totalLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0) .isActive = true
        totalLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func updateTotal() {
        let total = transactions
            .map { $0.amount }
            .reduce(0, +)
        
        totalLabel.text = "Total: \(total)"
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "StatCell", for: indexPath) as? StatCell {
            cell.catLabel.text = transactions[indexPath.row].category
            cell.amountLabel.text = "\(transactions[indexPath.row].amount)"
            
            return cell
        }
        fatalError("could not dequeueReusableCell")
    }
    
    
}
