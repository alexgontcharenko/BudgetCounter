//
//  ViewController.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    private var appDelegate: AppDelegate =
      UIApplication.shared.delegate as! AppDelegate
    private var accounts: [Account]!
    private var transactions: [Transaction]!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
        setTabBar()
        fillUpData()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        tableView.reloadData()
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.5129564404, green: 0.5324382186, blue: 0.5864207149, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.topItem?.title = "Dashboard"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTransaction))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add Acc/Cat", style: .done, target: self, action: #selector(addCategory))
    }
    
    func setTabBar() {
        self.tabBarController?.tabBar.barTintColor = #colorLiteral(red: 0.5129564404, green: 0.5324382186, blue: 0.5864207149, alpha: 1)
        self.tabBarController?.tabBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tabBarController?.tabBar.unselectedItemTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @objc func addTransaction() {
        guard let vc = storyboard?.instantiateViewController(identifier: "AddTransactionVC") else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addCategory() {
        guard let vc = storyboard?.instantiateViewController(identifier: "AddAccountVC")
            else { return }
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func setTableView() {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MainCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
// MARK: - Core Data
    private func fillUpData() {
        if UserDefaults.standard.bool(forKey: "isPrefilledData") == false {
            DataManager.shared.createPrefilledData()
            UserDefaults.standard.set(true, forKey: "isPrefilledData")
            UserDefaults.standard.synchronize()
        } else {
            print("The data is prefilled")
        }
    }
    
    private func getData() {
        accounts = try? appDelegate.persistentContainer.viewContext.fetch(Account.fetchRequest()) as? [Account]
    }
    
}

// MARK: - Extension

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(accounts[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts[section].transactions?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 30))
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = accounts[section].name
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath as IndexPath)
        let account = accounts[indexPath.section]
        let transactionArray = account.transactions!.allObjects as! [Transaction]
        let transaction = transactionArray[indexPath.row]
        cell.textLabel?.text = "\(transaction.amount)"
        
        return cell
    }
    
    
}

