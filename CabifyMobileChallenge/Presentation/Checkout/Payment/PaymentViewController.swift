import UIKit


class PaymentViewController: UIViewController {
    
    var presenter : PaymentPresenter!
    
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var feedbackImageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var returnToStoreButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = true
        
        
        presenter.setup()
    }
    @IBAction func returnToStore() {
        presenter.returnToStore()
    }
}

extension PaymentViewController : PaymentDelegate {
    
    func paymentCompleted() {
        feedbackLabel.text = "Payment completed successfully"
        feedbackImageView.image = UIImage(named: "CorrectCheck")
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
        returnToStoreButton.isHidden = false
    }
    
}
