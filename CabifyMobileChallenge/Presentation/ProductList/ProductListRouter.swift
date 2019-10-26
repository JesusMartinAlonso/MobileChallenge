import Foundation
import UIKit

class ProductListRouter {
    
    weak var viewController: UIViewController?
    
    var serviceLocator : ServiceLocator
    
    init(viewController : UIViewController?, serviceLocator : ServiceLocator) {
        self.viewController = viewController
        self.serviceLocator = serviceLocator
    }
    
    
    static func createProductListViewController(serviceLocator : ServiceLocator) -> ProductListViewController {
        
        let viewController = ProductListViewController()
        let router = ProductListRouter(viewController: viewController, serviceLocator: serviceLocator)
        let presenter = ProductListPresenter(delegate: viewController, router : router)
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
    

