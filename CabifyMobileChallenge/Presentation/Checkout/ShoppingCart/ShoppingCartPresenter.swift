import Foundation


protocol ShoppingCartDelegate : class {
    /// Show/hide loading view
    /// - Parameter loading: True to show a loading view. False to hide it
    func isLoading(_ loading: Bool)

    /// Update the view with a list of shopping cart items and the total amount to pay
    /// - Parameter shoppingCart: List of shopping cart items
    /// - Parameter totalAmount: Total amount of the order
    func update(shoppingCart: [ShoppingCartItem], totalAmount: Double)
}



class ShoppingCartPresenter  {
    
    weak var delegate : ShoppingCartDelegate!
    var router : ShoppingCartRouter
    
    //Shopping cart modeled as a dictionary:
    //Key -> Product
    //Value -> Quantity
    let shoppingCart: [Product:Int]
    
    let getDiscountUseCase: GetDiscountUseCase
    
    init(delegate : ShoppingCartDelegate,
         router : ShoppingCartRouter,
         shoppingCart: [Product:Int],
         getDiscountUseCase: GetDiscountUseCase) {
        self.delegate = delegate
        self.router = router
        self.shoppingCart = shoppingCart
        self.getDiscountUseCase = getDiscountUseCase
    }
    
    /// Calculate the subtotal and total amounts of the order applying the available discounts
    func setup() {
        
        delegate.isLoading(true)
        
        let arrayOfProductsCode = shoppingCart.compactMap {
            (keyValue) -> String in
            return keyValue.key.code
        }
        
        //Get discounts for the products in the shopping cart. In this way, we avoid to retrieve all the discounts of all products
        getDiscountUseCase.execute(productCodes: arrayOfProductsCode) { (result) in
            self.delegate.isLoading(false)
            switch result {
            case .success(let discounts):
                self.calculateTotal(withDiscounts: discounts)
            case .failure(_):
                //For this MVP version, I haven't implemented error management because getDiscountUseCase always succeed.
                print("NO IMPLEMENTED")
            }
        }
    }
    
    func payOrder() {
        router.navigateToPayment()
    }
    
    
    /// Calculate total amount to pay
    /// - Parameter discounts: Discounts to apply
    fileprivate func calculateTotal(withDiscounts discounts: [String:Discount]) {
        
        var totalAmount = 0.0
        let shoppingCartCells: [ShoppingCartItem] =  shoppingCart.compactMap { (keyValue) -> ShoppingCartItem in

            let (product, quantity) = keyValue
            
            //Calculate discount
            let discountInfo: ShoppingCartItem.DiscountInfo?
            if let discount = discounts[product.code] {
                let amountToDiscount = discount.amountToDiscount(quantity: quantity,
                                                                 unitPrice: product.price)
                           
                discountInfo = ShoppingCartItem.DiscountInfo(discount.description,
                                                             amountToDiscount)
            } else {
                discountInfo = nil
            }
            
            let itemSubTotal = product.price * Double(quantity)
            totalAmount += itemSubTotal - (discountInfo?.amount ?? 0.0)
            
            return ShoppingCartItem(productName: product.name,
                                    unitPrice: product.price,
                                    quantity: quantity,
                                    totalPrice: itemSubTotal,
                                    discount: discountInfo)
        }
        
        //Update view
        delegate.update(shoppingCart: shoppingCartCells, totalAmount: totalAmount)
        
    }
}
