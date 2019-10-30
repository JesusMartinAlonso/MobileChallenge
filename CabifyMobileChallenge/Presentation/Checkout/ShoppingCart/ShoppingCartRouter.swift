import Foundation
import UIKit

class ShoppingCartRouter {
    
    weak var viewController: UIViewController?
    
    var serviceLocator : ServiceLocator
    
    init(viewController : UIViewController?, serviceLocator : ServiceLocator) {
        self.viewController = viewController
        self.serviceLocator = serviceLocator
    }
    
    
    static func createShoppingCartViewController(serviceLocator : ServiceLocator) -> ShoppingCartViewController {
        
        let viewController = ShoppingCartViewController()
        let router = ShoppingCartRouter(viewController: viewController, serviceLocator: serviceLocator)
        let presenter = ShoppingCartPresenter(delegate: viewController, router : router)
        viewController.presenter = presenter
        return viewController
        
    }
    
    
    /*
    func navigateToVC(){
        
        let secondVC = SecondRouter.createSecondViewController(serviceLocator: serviceLocator)
        
        if let navigationController = viewController?.navigationController {
            navigationController.pushViewController(secondVC, animated: true)
        }else{
            print("Error: navigation controller of current view controller is nil")
            
    }*/
        
        
}
    

