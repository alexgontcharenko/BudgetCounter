//
//  AddAccountVC.swift
//  BudgetCounter
//
//  Created by Steew on 10.11.2021.
//

import UIKit
import CoreData

class AddAccountVC: UIViewController {

    private var appDelegate: AppDelegate =
      UIApplication.shared.delegate as! AppDelegate
    private var addAccTextField: UITextField!
    private var addCatTextField: UITextField!
    private var addAccButton: UIButton!
    private var deleteAccButton: UIButton!
    private var addCatButton: UIButton!
    private var finishButton: UIButton!
    
    private let cornerRadius: CGFloat = 5
    private let borderColor = CGColor(gray: 0, alpha: 0.5)
    private let borderWidth: CGFloat = 1.5

    override func viewDidLoad() {
        super.viewDidLoad()
        setAccTextField()
        setAccButton()
        setDeleteAccButton()
        setCatTextField()
        setCatButton()
        setFinishButton()
    }
    
    private func setAccTextField() {
        addAccTextField = UITextField()
        addAccTextField.layer.borderColor = borderColor
        addAccTextField.layer.borderWidth = borderWidth
        addAccTextField.layer.cornerRadius = cornerRadius
        addAccTextField.placeholder = "Enter account"
        addAccTextField.setLeftPaddingPoints(10)
        view.addSubview(addAccTextField)
        addAccTextField.translatesAutoresizingMaskIntoConstraints = false
        addAccTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        addAccTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        addAccTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        addAccTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setAccButton() {
        addAccButton = UIButton()
        addAccButton.setTitle("Add", for: .normal)
        addAccButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        addAccButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .highlighted)
        view.addSubview(addAccButton)
        addAccButton.translatesAutoresizingMaskIntoConstraints = false
        addAccButton.topAnchor.constraint(equalTo: addAccTextField.bottomAnchor, constant: 20).isActive = true
        addAccButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -35).isActive = true
        addAccButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addAccButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addAccButton.addTarget(self, action: #selector(addAccButtonClicked), for: .touchUpInside)
    }
    
    private func setDeleteAccButton() {
        deleteAccButton = UIButton()
        deleteAccButton.setTitle("Delete", for: .normal)
        deleteAccButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        deleteAccButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .highlighted)
        view.addSubview(deleteAccButton)
        deleteAccButton.translatesAutoresizingMaskIntoConstraints = false
        deleteAccButton.topAnchor.constraint(equalTo: addAccTextField.bottomAnchor, constant: 20).isActive = true
        deleteAccButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 30).isActive = true
        deleteAccButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        deleteAccButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        deleteAccButton.addTarget(self, action: #selector(deleteAccButtonClicked), for: .touchUpInside)
    }
    
    private func setCatTextField() {
        addCatTextField = UITextField()
        addCatTextField.layer.borderColor = borderColor
        addCatTextField.layer.borderWidth = borderWidth
        addCatTextField.layer.cornerRadius = cornerRadius
        addCatTextField.placeholder = "Enter category"
        addCatTextField.setLeftPaddingPoints(10)
        view.addSubview(addCatTextField)
        addCatTextField.translatesAutoresizingMaskIntoConstraints = false
        addCatTextField.topAnchor.constraint(equalTo: addAccButton.bottomAnchor, constant: 50).isActive = true
        addCatTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        addCatTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        addCatTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setCatButton() {
        addCatButton = UIButton()
        addCatButton.setTitle("Add", for: .normal)
        addCatButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        addCatButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .highlighted)
        view.addSubview(addCatButton)
        addCatButton.translatesAutoresizingMaskIntoConstraints = false
        addCatButton.topAnchor.constraint(equalTo: addCatTextField.bottomAnchor, constant: 20).isActive = true
        addCatButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        addCatButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addCatButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addCatButton.addTarget(self, action: #selector(addCatButtonClicked), for: .touchUpInside)
    }
    
    private func setFinishButton() {
        finishButton = UIButton()
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        finishButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .highlighted)
        view.addSubview(finishButton)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        finishButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        finishButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        finishButton.addTarget(self, action: #selector(finishButtonClicked), for: .touchUpInside)
    }
    
    @objc func finishButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addAccButtonClicked() {
        let account = Account(
            entity: Account.entity(), insertInto: appDelegate.persistentContainer.viewContext
        )
        account.currency = "USD"
        account.name = "\(addAccTextField.text!)"
        appDelegate.saveContext()
        
        addAccTextField.resignFirstResponder()
    }
    
    @objc func deleteAccButtonClicked() {
        let fetchRequest: NSFetchRequest<Account> = Account.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name LIKE %@", "\(addAccTextField.text!)")
        guard let accounts = try? appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
        else { return }
        for account in accounts {
            account.removeFromTransactions(account.transactions!)
            appDelegate.persistentContainer.viewContext.delete(account)
        }
        appDelegate.saveContext()
        
        let alert = UIAlertController(title: "Succes!", message: "Account deleted.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func addCatButtonClicked() {
        let category = Category(
            entity: Category.entity(), insertInto: appDelegate.persistentContainer.viewContext
        )
        category.details = "Some details"
        category.name = "\(addCatTextField.text!)"
        appDelegate.saveContext()
        
        addCatTextField.endEditing(true)
    }

}
