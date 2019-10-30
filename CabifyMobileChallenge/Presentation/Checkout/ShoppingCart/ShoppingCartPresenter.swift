import Foundation


protocol ShoppingCartDelegate : class {
    
    
}



class ShoppingCartPresenter  {
    
    weak var delegate : ShoppingCartDelegate!
    var router : ShoppingCartRouter
    
    
    init(delegate : ShoppingCartDelegate,  router : ShoppingCartRouter) {
        self.delegate = delegate
        self.router = router
    }
    

    
    
}
