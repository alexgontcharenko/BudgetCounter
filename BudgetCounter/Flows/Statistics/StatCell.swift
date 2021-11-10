//
//  StatCell.swift
//  BudgetCounter
//
//  Created by Steew on 07.11.2021.
//

import UIKit

class StatCell: UITableViewCell {
    var amountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(amountLabel)
        amountLabel.textColor = .black
        amountLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        amountLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        amountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        amountLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
