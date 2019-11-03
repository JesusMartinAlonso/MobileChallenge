//
//  AcceptanceTestCase.swift
//  KataSuperHeroes
//
//  Created by Pedro Vicente Gomez on 13/01/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//
import Foundation
import KIF

class AcceptanceTestCase: KIFTestCase {

    fileprivate var originalRootViewController: UIViewController?
    fileprivate var rootViewController: UIViewController? {
        get {
            return UIApplication.shared.keyWindow?.rootViewController
        }

        set(newRootViewController) {
            UIApplication.shared.keyWindow?.rootViewController = newRootViewController
        }
    }

    override func tearDown() {
        super.tearDown()
        if let originalRootViewController = originalRootViewController {
            rootViewController = originalRootViewController
        }
    }

    func present(viewController: UIViewController) {
        originalRootViewController = rootViewController
        rootViewController = viewController
    }
    
    /// Util function to know if an element with a given accesibility
    /// label is tapable
    ///
    /// - Parameter label: The accesibility label of the item
    /// - Returns: True if the element is tapable. False otherwise
    func isElementTapable(withAccesibilityLabel label: String) -> Bool {
        do {
            try tester().tryFindingTappableView(withAccessibilityLabel: label)
            return true
        } catch {
            return false
        }
    }
}
