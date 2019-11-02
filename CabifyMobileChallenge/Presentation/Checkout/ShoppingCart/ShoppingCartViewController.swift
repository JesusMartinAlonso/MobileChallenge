import UIKit


class ShoppingCartViewController: BaseViewController {
    
    var presenter : ShoppingCartPresenter!
    
    @IBOutlet weak var orderTableView: UITableView!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!
    
    /// Shopping cart items datasource
    var shoppingCartDatasource: [ShoppingCartItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = NSLocalizedString("shoppingcart_text_title", comment: "")
        totalAmountTitleLabel.text = NSLocalizedString("shoppingcart_text_totalamount", comment: "")
        payButton.setTitle(NSLocalizedString("shoppingcart_button_pay", comment: ""), for: .normal)
        orderTableView.dataSource = self
        //Set up data
        presenter.setup()
    }
    
    
    @IBAction func pay() {
        presenter.payOrder()
    }
}

extension ShoppingCartViewController : ShoppingCartDelegate {
    func isLoading(_ loading: Bool) {
        showLoading(loading: loading)
    }
    
    func update(shoppingCart: [ShoppingCartItem], totalAmount: Double) {
        totalAmountLabel.text = CurrencyHelper.format(amount: totalAmount)
        shoppingCartDatasource = shoppingCart
        orderTableView.reloadData()
    }
}

extension ShoppingCartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingCartDatasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getShoppingCartCell()
        cell.setItem(shoppingCartDatasource[indexPath.row])
        return cell
    }
    
    
    fileprivate func getShoppingCartCell() -> ShoppingCartTableViewCell{
        if let cell = orderTableView.dequeueReusableCell(withIdentifier: ShoppingCartTableViewCell.CELL_IDENTIFIER) as? ShoppingCartTableViewCell{
            return cell
        } else {
            orderTableView.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil), forCellReuseIdentifier: ShoppingCartTableViewCell.CELL_IDENTIFIER)
            return getShoppingCartCell()
        }
    }
    
}
