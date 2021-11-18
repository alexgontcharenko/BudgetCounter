//
//  MainCell.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//

import UIKit

class MainCell: UITableViewCell {
    var catLabel: UILabel!
    var dateLabel: UILabel!
    var amountLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCatLabel()
        setupDateLabel()
        setupAmountLabel()
    }

    private func setupCatLabel() {
        catLabel = UILabel()
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(catLabel)
        catLabel.textColor = .black
        catLabel.font = .systemFont(ofSize: 20)
        catLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        catLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        catLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        catLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setupDateLabel() {
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateLabel)
        dateLabel.textColor = .black
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.topAnchor.constraint(equalTo: catLabel.bottomAnchor, constant: 0).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setupAmountLabel() {
        amountLabel = UILabel()
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(amountLabel)
        amountLabel.textColor = .black
        amountLabel.textAlignment = .right
        amountLabel.font = .systemFont(ofSize: 20)
        amountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        amountLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        amountLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
