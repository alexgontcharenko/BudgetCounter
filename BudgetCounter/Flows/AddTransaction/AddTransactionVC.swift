//
//  AddTransactionVC.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//

import UIKit
import SearchTextField
import CoreData

class AddTransactionVC: UIViewController {
    private var appDelegate: AppDelegate =
      UIApplication.shared.delegate as! AppDelegate
    private var segmentedTransaction: UISegmentedControl!
    private var accountTextField: UITextField!
    private var categoryTextField: SearchTextField!
    private var amountTextField: UITextField!
    private var picker = UIPickerView()
    private var toolBar: UIToolbar!
    private var accounts: [Account]!
    
    private let cornerRadius: CGFloat = 5
    private let borderColor = CGColor(gray: 0, alpha: 0.5)
    private let borderWidth: CGFloat = 1.5
    
    private let secArray = ["Bank", "Card", "Cash"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPickerView()
        setSegmentedTransaction()
        setAccountTextField()
        setCategoryTextField()
        setAmountTextField()
        setNavigationBar()
        getData()
    }
    
    func setSegmentedTransaction() {
        segmentedTransaction = UISegmentedControl(items: ["Income", "Expence"])
        segmentedTransaction.selectedSegmentIndex = 0
        segmentedTransaction.selectedSegmentTintColor = #colorLiteral(red: 0.6109809279, green: 0.7377621531, blue: 0.9289018512, alpha: 1)
        let xPosition:CGFloat = view.center.x / 2
        let yPosition:CGFloat = 100
        let elementWidth:CGFloat = 200
        let elementHeight:CGFloat = 30
        segmentedTransaction.frame = CGRect(x: xPosition, y: yPosition, width: elementWidth, height: elementHeight)
        view.addSubview(segmentedTransaction)
    }
    
    func setAccountTextField() {
        accountTextField = UITextField()
        accountTextField.layer.borderColor = borderColor
        accountTextField.layer.borderWidth = borderWidth
        accountTextField.layer.cornerRadius = cornerRadius
        accountTextField.placeholder = "Select account"
        accountTextField.setLeftPaddingPoints(10)
        accountTextField.inputView = picker
        accountTextField.inputAccessoryView = toolBar
        view.addSubview(accountTextField)
        accountTextField.translatesAutoresizingMaskIntoConstraints = false
        accountTextField.topAnchor.constraint(equalTo: segmentedTransaction.bottomAnchor, constant: 30).isActive = true
        accountTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        accountTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        accountTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setCategoryTextField() {
        categoryTextField = SearchTextField()
        categoryTextField.layer.borderColor = borderColor
        categoryTextField.layer.borderWidth = borderWidth
        categoryTextField.layer.cornerRadius = cornerRadius
        categoryTextField.placeholder = "Select category"
        categoryTextField.setLeftPaddingPoints(10)
        categoryTextField.filterStrings(secArray)
        view.addSubview(categoryTextField)
        categoryTextField.translatesAutoresizingMaskIntoConstraints = false
        categoryTextField.topAnchor.constraint(equalTo: accountTextField.bottomAnchor, constant: 20).isActive = true
        categoryTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        categoryTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        categoryTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setAmountTextField() {
        amountTextField = UITextField()
        amountTextField.layer.borderColor = borderColor
        amountTextField.layer.borderWidth = borderWidth
        amountTextField.layer.cornerRadius = cornerRadius
        amountTextField.placeholder = "Enter amount"
        amountTextField.setLeftPaddingPoints(10)
        view.addSubview(amountTextField)
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.topAnchor.constraint(equalTo: categoryTextField.bottomAnchor, constant: 20).isActive = true
        amountTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        amountTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        amountTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setNavigationBar() {
        self.title = "Add Transaction"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTransaction))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTransaction))
    }
    
    func setPickerView() {
        picker.delegate = self
        picker.dataSource = self
        toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
    }
    
    @objc func donePicker() {
        accountTextField.resignFirstResponder()
    }
    
    @objc func saveTransaction() {
        
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelTransaction() {
        navigationController?.popViewController(animated: true)
    }
    
//   MARK: Core Data
    
    private func getData() {
      accounts = try? appDelegate.persistentContainer.viewContext.fetch(Account.fetchRequest()) as? [Account]
    }
    
}

//   MARK: Extension

extension AddTransactionVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return accounts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return accounts[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        accountTextField.text = accounts[row].name
    }
    
}
