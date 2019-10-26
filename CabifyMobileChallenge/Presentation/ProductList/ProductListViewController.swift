import UIKit


class ProductListViewController: UIViewController {
    
    var presenter : ProductListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ProductListViewController : ProductListDelegate {


    
}
