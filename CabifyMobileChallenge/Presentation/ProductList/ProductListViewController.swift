import UIKit


class ProductListViewController: BaseViewController {
    
    var presenter : ProductListPresenter!
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var checkoutButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var productsDatasource: [ProductTableViewCellItem] = []
    var shoppingCart: [String:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //TODO: Localize
        title = "Cabify's store"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self, action: #selector(refreshProducts))
        productsTableView.dataSource = self
        productsTableView.rowHeight = UITableView.automaticDimension
        presenter.setup()
    }
    
    
    @objc func refreshProducts() {
        presenter.setup()
    }
    @IBAction func checkoutButtonPressed() {
        presenter.checkout()
    }
}

extension ProductListViewController: UITableViewDelegate {
    
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = productsDatasource[indexPath.row]
        let cell = getProductCell()
        //cell.setProduct(product, quantity: shoppingCart[product.code] ?? 0)
        cell.setItem(product)
        cell.didTapAddButtonClosure = { product in
            self.presenter.addUnitToCart(ofProduct: product)
        }

        cell.didTapRemoveButtonClosure = { product in
            self.presenter.substractUnitToCart(ofProduct: product)
        }
        
        return cell
    
    }
    
    fileprivate func getProductCell() -> ProductTableViewCell {
        if let cell = productsTableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.CELL_IDENTIFIER) as? ProductTableViewCell {
            return cell
        } else {
            productsTableView.register(UINib.init(nibName: "ProductTableViewCell", bundle: nil),
                                       forCellReuseIdentifier: ProductTableViewCell.CELL_IDENTIFIER)
            return getProductCell()
        }
    }
    
    
}

extension ProductListViewController : ProductListDelegate {
    
    
    
    func showError(_ error: CustomError) {
        productsTableView.isHidden = true
        checkoutButton.isHidden = true
        
        let errorToShow: String
        switch error {
        case .NoInternetConnection:
            //TODO: Localize
            errorToShow = "There is no Internet connectivity."
        case .Unknown:
            //TODO: Localize
            errorToShow = "Unknown error. Try again"
        }
        
        errorLabel.text = errorToShow
        errorLabel.isHidden = false
    }
    
    func setCheckoutButton(numberOfItems: Int, enabled: Bool) {
        //TODO: Localize
        checkoutButton.setTitle("Checkout (\(numberOfItems) items)", for: .normal)
        checkoutButton.isEnabled = enabled
    }
    
    func update(products: [ProductTableViewCellItem]) {
        self.productsDatasource = products
        productsTableView.reloadData()
    }
    
    
//    func update(products: [Product]?, shoppingCart: [String:Int]?) {
//        var needsUpdateTableView = false
//        if let products = products {
//            self.productsDatasource = products
//            needsUpdateTableView = true
//        }
//        
//        if let shoppingCart = shoppingCart {
//             self.shoppingCart = shoppingCart
//             needsUpdateTableView = true
//        }
//        
//        if needsUpdateTableView {
//            productsTableView.reloadData()
//        }
//    }
    
    func isLoading(_ loading: Bool) {
        showLoading(loading: loading)
        productsTableView.isHidden = loading
        checkoutButton.isHidden = loading
        errorLabel.isHidden = true
    }
}
