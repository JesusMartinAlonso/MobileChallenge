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
    
    var productCode: String?
    
    var didTapAddButtonClosure: ((String) -> Void)?
    var didTapRemoveButtonClosure: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProduct(_ product: Product, quantity: Int = 0){
        productCode = product.code
        nameLabel.text = product.name
        priceLabel.text = "\(product.price) $"
        quantityLabel.text = "\(quantity)"
    }
    
    @IBAction func addItem() {
        if let productCode = productCode {
            didTapAddButtonClosure?(productCode)
        }
    }
    
    @IBAction func removeItem() {
        if let productCode = productCode {
            didTapRemoveButtonClosure?(productCode)
        }
    }
}
