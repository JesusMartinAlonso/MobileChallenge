import Foundation
import UIKit

class PaymentRouter {
    
    weak var viewController: UIViewController?
    
    var serviceLocator : ServiceLocator
    
    init(viewController : UIViewController?, serviceLocator : ServiceLocator) {
        self.viewController = viewController
        self.serviceLocator = serviceLocator
    }
    
    
    static func createPaymentViewController(serviceLocator : ServiceLocator) -> PaymentViewController {
        
        let viewController = PaymentViewController()
        let router = PaymentRouter(viewController: viewController, serviceLocator: serviceLocator)
        let presenter = PaymentPresenter(delegate: viewController,
                                         router : router,
                                         payOrderUseCase: serviceLocator.payOrderUseCase)
        viewController.presenter = presenter
        return viewController
        
    }
    
    
    func popToRootViewController() {
        
        let initialViewController = ProductListRouter.createProductListViewController(serviceLocator: serviceLocator)
        
        if let navigationController = viewController?.navigationController {
            navigationController.navigationBar.isHidden = false
            navigationController.viewControllers = [initialViewController]
        }else {
            print("Error: navigation controller of current view controller is nil")
        }
        
    }
    
    
    
    
    
    
}


