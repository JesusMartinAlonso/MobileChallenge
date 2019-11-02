//
//  ProductTableViewCell.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    static let CELL_IDENTIFIER = "ProductTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    /// Product to show in the cell
    var product: Product?
    
    /// Closure to be executed when the user taps '+' button
    var didTapAddButtonClosure: ((Product) -> Void)?
    /// Closure to be executed when the user taps '-' button
    var didTapRemoveButtonClosure: ((Product) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        priceTitleLabel.text = NSLocalizedString("productcell_text_price", comment: "")
    }

    
    /// Set the info of the ProductTableViewCellItem passed by argument
    /// - Parameter item: ProductTableViewCellItem to be set in the cell
    func setItem(_ item: ProductTableViewCellItem) {
        product = item.product
        nameLabel.text = item.product.name
        priceLabel.text = CurrencyHelper.format(amount: item.product.price)
        quantityLabel.text = "\(item.quantity)"
    }
    
    @IBAction func addItem() {
        if let product = product {
            didTapAddButtonClosure?(product)
        }
    }
    
    @IBAction func removeItem() {
        if let product = product {
            didTapRemoveButtonClosure?(product)
        }
    }
}
