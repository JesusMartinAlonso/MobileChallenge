import UIKit


class ShoppingCartViewController: UIViewController {
    
    var presenter : ShoppingCartPresenter!
    
    @IBOutlet weak var orderTableView: UITableView!
    
    var productsDatasource: [Product] = []
    var shoppingCart: [String:Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Shopping Cart"
        orderTableView.dataSource = self
    }
}

extension ShoppingCartViewController : ShoppingCartDelegate {


}

extension ShoppingCartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //shoppingCart.count
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getShoppingCartCell()
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
