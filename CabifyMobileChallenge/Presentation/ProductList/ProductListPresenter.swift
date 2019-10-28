import Foundation


/// Protocol to implement for the view to receive updates from the presenter
protocol ProductListDelegate : class {
    
    /// Show/hide loading view
    /// - Parameter loading: True to show a loading view. False to hide it
    func isLoading(_ loading: Bool)
    
    /// Update products and shopping cart.
    /// - Parameter products: New array of products. Pass nil if no need to update it
    /// - Parameter shoppingCart: Updated shoppingCart. Pass nil if no need to update it
    func update(products: [Product]?, shoppingCart: [String:Int]?)
    
    /// Set title of checkout button with the number of items passed by argument.
    /// - Parameter numberOfItems: Int with the number of items of  to show in the checkout button
    /// - Parameter enabled: True to enable checkout button, False to disable.
    func setCheckoutButton(numberOfItems: Int, enabled: Bool)
    
    
    /// Show error to the user
    /// - Parameter error: CustomError to show to the user
    func showError(_ error: CustomError)
    
}



class ProductListPresenter  {
    
    weak var delegate : ProductListDelegate!
    var router : ProductListRouter
    
    var shoppingCart: [String:Int] = [:]
    
    let getProductsUseCase: GetProductsUseCase
    
    
    init(delegate : ProductListDelegate,
         router : ProductListRouter,
         getProductsUseCase: GetProductsUseCase) {
        self.delegate = delegate
        self.router = router
        self.getProductsUseCase = getProductsUseCase
    }
    
    
    func setup() {
        
        delegate.isLoading(true)
        
//        let products  = [Product(code: "VOUCHER", name: "Cabify Voucher", price: 5.0),
//        Product(code: "TSHIRT", name: "Cabify T-Shirt", price: 15.0),
//        Product(code: "COFFEE", name: "Cabify Coffee Mug", price: 25.0)]
        //TODO: Ask for products
        getProductsUseCase.execute { (result) in
            self.delegate.isLoading(false)
            
            switch(result) {
            case .success(let products):
                self.delegate.update(products: products, shoppingCart: nil)
                self.updateButton()
            case .failure(let error):
                self.delegate.showError(error)
            }
        }
        
        //TODO: Ask for discounts
    }
    
    func addUnitToCart(productCode: String) {
      shoppingCart[productCode, default: 0] += 1
      delegate.update(products: nil, shoppingCart: shoppingCart)
      updateButton()
    }
    
    func substractUnitToCart(productCode: String) {
        
        let currentQuantity = shoppingCart[productCode, default: 0]
        
        if currentQuantity > 0 {
             shoppingCart[productCode] = currentQuantity - 1
        }
        delegate.update(products: nil, shoppingCart: shoppingCart)
        updateButton()
        
    }
    
    func checkout() {
        //TODO: Pass shopping cart
        router.navigateToShoppingCart()
    }
    
    
    fileprivate func updateButton() {
        
        //people.compactMap { Double($0["height"]!) }.reduce(0, +)
        let itemsCount = shoppingCart.map { $0.value }.reduce(0,+)
        delegate.setCheckoutButton(numberOfItems: itemsCount,
            enabled: itemsCount > 0)
        
    }

    
    
}
