import Foundation
import UIKit

class ProductListRouter {
    
    weak var viewController: UIViewController?
    
    var serviceLocator : ServiceLocator
    
    init(viewController : UIViewController?, serviceLocator : ServiceLocator) {
        self.viewController = viewController
        self.serviceLocator = serviceLocator
    }
    
    
    /// Assemble ProductListViewController
    /// - Parameter serviceLocator: ServiceLocator instance that provides dependencies
    static func createProductListViewController(serviceLocator : ServiceLocator) -> ProductListViewController {
        
        let viewController = ProductListViewController()
        let router = ProductListRouter(viewController: viewController, serviceLocator: serviceLocator)
        let presenter = ProductListPresenter(delegate: viewController,
                                             router : router,
                                             getProductsUseCase: serviceLocator.getProductsUseCase)
        viewController.presenter = presenter
        return viewController
        
    }
    
    /// Navigate to ShoppingCart screen with the shopping cart passed by parameter
    /// - Parameter shoppingCart: ShoppingCart dictionary
    func navigateToShoppingCart(_ shoppingCart: [Product: Int]){
        
        let shoppingCart = ShoppingCartRouter.createShoppingCartViewController(withShoppingCart: shoppingCart,
                                                                               serviceLocator: serviceLocator)
        
        if let navigationController = viewController?.navigationController {
            navigationController.pushViewController(shoppingCart, animated: true)
        } else {
             print("Error: navigation controller of current view controller is nil")
        }
            
    }
        
        
}
    

