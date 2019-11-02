import UIKit


/// View controller that represents the list of the products of the store
class ProductListViewController: BaseViewController {
    
    var presenter : ProductListPresenter!
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var checkoutButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    /// Datasource of products
    var productsDatasource: [ProductTableViewCellItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = NSLocalizedString("productlist_text_title", comment: "")
        
        //Adds refresh products button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self, action: #selector(refreshProducts))
        productsTableView.dataSource = self
        //Row height is calculated automatically based on intrinsic content size of each cell
        productsTableView.rowHeight = UITableView.automaticDimension
        //Call presenter to setup view
        presenter.setup()
    }
    
    ///Method called when user taps refresh button
    @objc func refreshProducts() {
        presenter.setup()
    }
    
    /// Method called when user press checkout button
    @IBAction func checkoutButtonPressed() {
        presenter.checkout()
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = productsDatasource[indexPath.row]
        let cell = getProductCell()
        cell.setItem(product)
        //Closure executed when user press '+' button of the cell
        //Adds unowned to avoid memory leaks
        cell.didTapAddButtonClosure = { [unowned self] product in
            self.presenter.addUnitToCart(ofProduct: product)
        }
        //Closure executed when user press '-' button of the cell
        //Adds unowned to avoid memory leaks
        cell.didTapRemoveButtonClosure = { [unowned self] product in
            self.presenter.substractUnitToCart(ofProduct: product)
        }
        
        return cell
    
    }
    
    /// Get the reusable ProductTableViewCell or register if not registered yet.
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
///MARK: - ProductListDelegate
extension ProductListViewController : ProductListDelegate {
    

    func showError(_ error: CustomError) {
        productsTableView.isHidden = true
        checkoutButton.isHidden = true
        
        let errorToShow: String
        switch error {
        case .NoInternetConnection:
            errorToShow = NSLocalizedString("productlist_text_nointernet", comment: "")
        case .Unknown:
            errorToShow = NSLocalizedString("productlist_text_unknownerror", comment: "")
        }
        
        errorLabel.text = errorToShow
        errorLabel.isHidden = false
    }
    
    func setCheckoutButton(numberOfItems: Int, enabled: Bool) {
        
        let localizedTitle = NSLocalizedString("productlist_button_checkout", comment: "")
        checkoutButton.setTitle(String(format: localizedTitle, numberOfItems),
                                for: .normal)
        checkoutButton.isEnabled = enabled
    }
    
    func update(products: [ProductTableViewCellItem]) {
        self.productsDatasource = products
        productsTableView.reloadData()
    }
    
    func isLoading(_ loading: Bool) {
        showLoading(loading: loading)
        productsTableView.isHidden = loading
        checkoutButton.isHidden = loading
        errorLabel.isHidden = true
    }
}
