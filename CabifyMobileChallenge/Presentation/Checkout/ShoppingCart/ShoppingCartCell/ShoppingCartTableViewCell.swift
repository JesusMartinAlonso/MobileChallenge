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
    @IBOutlet weak var unitPriceTitleLabel: UILabel!
    @IBOutlet weak var unitPriceLabel: UILabel!
    @IBOutlet weak var quantityTitleLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var discountView: UIView!
    @IBOutlet weak var discountDescriptionLabel: UILabel!
    @IBOutlet weak var discountAmountLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        unitPriceTitleLabel.text = NSLocalizedString("shoppingcartcell_text_unitprice", comment: "")
        quantityTitleLabel.text = NSLocalizedString("shoppingcartcell_text_quantity", comment: "")
    }
    
    /// Sets the information of the ShoppingCartItem passed by argument
    /// - Parameter item: ShoppingCartItem
    func setItem(_ item: ShoppingCartItem) {
        productNameLabel.text = item.productName
        unitPriceLabel.text = CurrencyHelper.format(amount: item.unitPrice)
        quantityLabel.text = "\(item.quantity)"
        totalPriceLabel.text = CurrencyHelper.format(amount: item.totalPrice)
        //We show the available discount and the discount amount if meets the requirements
        if let discount = item.discount {
            discountView.isHidden = false
            discountDescriptionLabel.text = discount.description
            discountAmountLabel.text = "- \(CurrencyHelper.format(amount: discount.amount))"
        } else {
            discountView.isHidden = true
        }
    }
    
}
