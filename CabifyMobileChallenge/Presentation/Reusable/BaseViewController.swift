//
//  BaseViewController.swift
//  iOS architecture
//
//  Created by Jesus Martin Alonso on 27/10/2019.
//

import UIKit

class BaseViewController: UIViewController {

    var loadingView: UIView!
    var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureLoadingView()
    }

    fileprivate func configureLoadingView() {
        //Adds loading view
        loadingView = UIView(frame: view.bounds)
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        loadingView.isHidden = true
        loadingView.isAccessibilityElement = true
        loadingView.accessibilityLabel = "LoadingView"
        loadingIndicator.isAccessibilityElement = true
        loadingIndicator.accessibilityLabel = "LoadingIndicator"
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.color = UIColor.blue
        self.view.addSubview(loadingView)
        self.view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        view.bringSubviewToFront(loadingIndicator)
    }

    func showLoading(loading: Bool) {
        if loading {
            loadingIndicator.startAnimating()
            loadingView.isHidden = false
            view.bringSubviewToFront(loadingView)
            view.bringSubviewToFront(loadingIndicator)
        } else {
            self.loadingIndicator.stopAnimating()
            self.loadingView.isHidden = true
        }
    }

}
