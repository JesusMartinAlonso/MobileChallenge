import Foundation


/// Protocol to implement for the view to receive updates from the presenter
protocol ProductListDelegate : class {
    
    /// Show/hide loading view
    /// - Parameter loading: True to show a loading view. False to hide it
    func isLoading(_ loading: Bool)
    
    
    /// Updates the view with the product cells
    /// - Parameter products: Array of ProductTableViewCellItem
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
    
    //List of products of the store
    var products: [Product] = []
    
    //Shopping cart modeled as a dictionary:
    //Key -> Product
    //Value -> Quantity
    var shoppingCart: [Product:Int] = [:]
    
    let getProductsUseCase: GetProductsUseCase
    
    
    init(delegate : ProductListDelegate,
         router : ProductListRouter,
         getProductsUseCase: GetProductsUseCase) {
        self.delegate = delegate
        self.router = router
        self.getProductsUseCase = getProductsUseCase
    }
    
    
    /// Retrieve products and update view
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
    
    
    /// Helper function to update view
    fileprivate func updateView() {
        
        /// Maps products and shopping cart into array of ProductTableViewCellItem
        let productCells = products.map {
            ProductTableViewCellItem(product: $0,
                                     quantity: shoppingCart[$0, default: 0])
        }
        //Update view
        delegate.update(products: productCells)
        //Update button
        updateButton()
        
    }
    
    /// Add one unit to the shopping cart of the product passed by paramenter
    /// - Parameter product: Product to be added to the shopping cart
    func addUnitToCart(ofProduct product: Product) {
      //Specify 0 as default value is product is not yet in the shopping cart
      shoppingCart[product, default: 0] += 1
      updateView()
    }
    
    /// Substract one unit from the shopping cart
    /// - Parameter product: Product to be substracted from the shopping cart
    func substractUnitToCart(ofProduct product: Product) {
        //Retrieve current quantity of the product
        let currentQuantity = shoppingCart[product, default: 0]
        // Only substract if there is more than one item
        if currentQuantity > 1 {
             shoppingCart[product] = currentQuantity - 1
        } else { //Else remove the product of the shopping cart dictionary
            shoppingCart.removeValue(forKey: product)
        }
        updateView()
    }
    
    func checkout() {
        router.navigateToShoppingCart(shoppingCart)
    }
    
    
    fileprivate func updateButton() {
        //Calculate the total items contained in the shopping cart
        let itemsCount = shoppingCart.map { $0.value }.reduce(0,+)
        //Update button
        delegate.setCheckoutButton(numberOfItems: itemsCount,
            enabled: itemsCount > 0)
    }

    
    
}
