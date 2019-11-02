import Foundation
import UIKit

class ShoppingCartRouter {
    
    weak var viewController: UIViewController?
    
    var serviceLocator : ServiceLocator
    
    init(viewController : UIViewController?, serviceLocator : ServiceLocator) {
        self.viewController = viewController
        self.serviceLocator = serviceLocator
    }
    
    /// Assemble ShoppingCart module
    static func createShoppingCartViewController(withShoppingCart shoppingCart: [Product:Int],
                                                 serviceLocator : ServiceLocator) -> ShoppingCartViewController {
        
        let viewController = ShoppingCartViewController()
        let router = ShoppingCartRouter(viewController: viewController, serviceLocator: serviceLocator)
        let presenter = ShoppingCartPresenter(delegate: viewController,
                                              router : router,
                                              shoppingCart: shoppingCart,
                                              getDiscountUseCase: serviceLocator.getDiscountUseCase)
        viewController.presenter = presenter
        return viewController
        
    }
    
    /// Navigate to payment view controller
    func navigateToPayment() {
        let paymentViewController = PaymentRouter.createPaymentViewController(serviceLocator: serviceLocator)
        
        if let navigationController = viewController?.navigationController {
            navigationController.pushViewController(paymentViewController, animated: true)
        } else {
            print("Error: navigation controller of current view controller is nil")
        }
    }
}


