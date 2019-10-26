import Foundation


protocol ProductListDelegate : class {
    
    
}



class ProductListPresenter  {
    
    weak var delegate : ProductListDelegate!
    var router : ProductListRouter
    
    
    init(delegate : ProductListDelegate,  router : ProductListRouter) {
        self.delegate = delegate
        self.router = router
    }
    

    
    
}
