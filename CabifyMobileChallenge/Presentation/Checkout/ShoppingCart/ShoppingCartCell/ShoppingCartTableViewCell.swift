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
    
}
