//
//  StatCell.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//

import UIKit

class StatCell: UITableViewCell {
    var catLabel: UILabel!
    var amountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCatLabel()
        setupAmountLabel()
    }
    
    private func setupCatLabel() {
        catLabel = UILabel()
        catLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(catLabel)
        catLabel.textColor = .black
        catLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        catLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        catLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        catLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
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
        amountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        amountLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
