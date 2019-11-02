//
//  ShoppingCartTableViewCell.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 28/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {

    static let CELL_IDENTIFIER = "ShoppingCartTableViewCell"
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var unitPriceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var discountSeparatorView: UIView!
    @IBOutlet weak var discountView: UIView!
    @IBOutlet weak var discountDescriptionLabel: UILabel!
    @IBOutlet weak var discountAmountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //TODO: Refactor currency
    func setItem(_ item: ShoppingCartItem) {
        productNameLabel.text = item.productName
        unitPriceLabel.text = "\(item.unitPrice) $"
        quantityLabel.text = "\(item.quantity)"
        totalPriceLabel.text = "\(item.totalPrice) $"
        if let discount = item.discount {
            discountSeparatorView.isHidden = false
            discountView.isHidden = false
            discountDescriptionLabel.text = discount.description
            discountAmountLabel.text = "- \(discount.amount) $"
        } else {
            discountSeparatorView.isHidden = true
            discountView.isHidden = true
        }
    }
    
}
