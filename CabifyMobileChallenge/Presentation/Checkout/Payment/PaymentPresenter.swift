import Foundation


protocol PaymentDelegate : class {
    func paymentCompleted()
}

class PaymentPresenter  {
    
    weak var delegate : PaymentDelegate!
    var router : PaymentRouter
    
    let payOrderUseCase: PayOrderUseCase
    
    
    init(delegate : PaymentDelegate,
         router : PaymentRouter,
         payOrderUseCase: PayOrderUseCase) {
        self.delegate = delegate
        self.router = router
        self.payOrderUseCase = payOrderUseCase
    }
    
    func setup() {
        payOrderUseCase.execute { (result) in
            switch result {
            case .success:
                self.delegate.paymentCompleted()
            case .failure:
                print("NOT SUPPORTED")
            }
        }
    }
    
    func returnToStore() {
        router.popToRootViewController()
    }
}
