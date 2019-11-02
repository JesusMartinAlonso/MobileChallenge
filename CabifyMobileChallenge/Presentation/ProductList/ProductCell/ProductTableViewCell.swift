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
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var product: Product?
    
    var didTapAddButtonClosure: ((Product) -> Void)?
    var didTapRemoveButtonClosure: ((Product) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
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
