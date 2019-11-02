import Foundation


/// Protocol to implement for the view to receive updates from the presenter
protocol ProductListDelegate : class {
    
    /// Show/hide loading view
    /// - Parameter loading: True to show a loading view. False to hide it
    func isLoading(_ loading: Bool)
    
    /// Update products and shopping cart.
    /// - Parameter products: New array of products. Pass nil if no need to update it
    /// - Parameter shoppingCart: Updated shoppingCart. Pass nil if no need to update it
    //func update(products: [Product]?, shoppingCart: [String:Int]?)
    func update(products: [ProductTableViewCellItem])
    
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
    
    var products: [Product] = []
    var shoppingCart: [Product:Int] = [:]
    
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
        getProductsUseCase.execute { (result) in
            self.delegate.isLoading(false)
            
            switch(result) {
            case .success(let products):
                self.products = products
                self.updateView()
                self.updateButton()
            case .failure(let error):
                self.delegate.showError(error)
            }
        }
        
    }
    
    
    fileprivate func updateView() {
        
        let productCells = products.map {
            ProductTableViewCellItem(product: $0,
                                     quantity: shoppingCart[$0, default: 0])
        }
        
        delegate.update(products: productCells)
        updateButton()
        
    }
    
    func addUnitToCart(ofProduct product: Product) {
      shoppingCart[product, default: 0] += 1
      updateView()
    }
    
    func substractUnitToCart(ofProduct product: Product) {
        
        let currentQuantity = shoppingCart[product, default: 0]
        
        if currentQuantity > 1 {
             shoppingCart[product] = currentQuantity - 1
        } else {
            shoppingCart.removeValue(forKey: product)
        }
        updateView()
    }
    
    func checkout() {
        router.navigateToShoppingCart(shoppingCart)
    }
    
    
    fileprivate func updateButton() {
        let itemsCount = shoppingCart.map { $0.value }.reduce(0,+)
        delegate.setCheckoutButton(numberOfItems: itemsCount,
            enabled: itemsCount > 0)
    }

    
    
}
