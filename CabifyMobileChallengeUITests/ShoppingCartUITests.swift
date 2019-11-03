//
//  ShoppingCartUITests.swift
//  CabifyMobileChallengeUITests
//
//  Created by Jesus Martin Alonso on 02/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import XCTest
import KIF
import Cuckoo
@testable import CabifyMobileChallenge

class ShoppingCartUITests: AcceptanceTestCase {

    fileprivate var serviceLocator: MockServiceLocator!
    fileprivate var discountRepository: MockDiscountRepository!
    
    
    let product1 = Product(code: "PRODUCT1", name: "Product One", price: 4.0)
    let product2 = Product(code: "PRODUCT2", name: "Product Two", price: 10.0)
    
    
    override func setUp() {
        serviceLocator = MockServiceLocator()
        discountRepository = MockDiscountRepository()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_discounts_are_shown_and_applied_to_total_price() {
        
        //Given
        givenAvailableDiscountsAre([
            "PRODUCT1": TwoForOneDiscount(),
            "PRODUCT2": BulkDiscount(minimumQuantity: 2, discountPerUnit: 2)
        ])
        
        let shoppingCart = [
            product1 : 4,
            product2 : 2
        ]
        //When
        _ = openShoppingCartViewController(withShoppingCart: shoppingCart)

        //Then
        tester().waitForView(withAccessibilityLabel: product1.name)
        tester().waitForView(withAccessibilityLabel: product2.name)
        tester().waitForView(withAccessibilityLabel: "Bulk discount: 2.00$ discount for each unit buying 2 or more")
        tester().waitForView(withAccessibilityLabel: "2 for 1 discount")
        tester().waitForView(withAccessibilityLabel: "- 4.0 $")
        tester().waitForView(withAccessibilityLabel: "- 8.0 $")
        tester().waitForView(withAccessibilityLabel: "24.0 $")
        
    }
    
    func test_no_discounts_are_applied_if_not_available() {
        //Given
        givenAvailableDiscountsAre([:])
        
        let shoppingCart = [
            product1 : 4,
            product2 : 2
        ]
        //When
        _ = openShoppingCartViewController(withShoppingCart: shoppingCart)
        
        //Then
        tester().waitForView(withAccessibilityLabel: product1.name)
        tester().waitForView(withAccessibilityLabel: product2.name)
        tester().waitForView(withAccessibilityLabel: "36.0 $")
    }
    
    func test_press_pay_button_then_go_to_payment(){
        
        givenAvailableDiscountsAre([:])
        givenMockServiceLocatorReturnPayOrderUseCase()
        
        let shoppingCart = [
            product1 : 4,
            product2 : 2
        ]
        
        //When
        _ = openShoppingCartViewController(withShoppingCart: shoppingCart)
        tester().tapView(withAccessibilityLabel: "Pay!")
        
        //Then
        tester().waitForView(withAccessibilityLabel: "Paying order...")
    }
    
    
    fileprivate func openShoppingCartViewController(withShoppingCart shoppingCart: [Product:Int]) -> ShoppingCartViewController {
        let viewController = ShoppingCartRouter.createShoppingCartViewController(withShoppingCart: shoppingCart,
                                                                                 serviceLocator: serviceLocator)
        let rootViewController = UINavigationController()
        rootViewController.isNavigationBarHidden = true
        rootViewController.viewControllers = [viewController]
        present(viewController: rootViewController)
        tester().waitForAnimationsToFinish()
        return viewController
    }
    
    
    fileprivate func givenAvailableDiscountsAre(_ discounts: [String:Discount]) {
        
        stub(discountRepository) { stub in
            when(stub.getDiscounts(forProducts: any(), result: any())).then { (_,result) in
                result(.success(discounts))
            }
            
        }
        
        stub(serviceLocator) { (stub) in
            when(stub.getDiscountUseCase.get).thenReturn(GetDiscountUseCase(discountRepository: discountRepository))
        }
    
    }
    
    fileprivate func givenMockServiceLocatorReturnPayOrderUseCase(){
        stub(serviceLocator) { (stub) in
            when(stub.payOrderUseCase.get).thenReturn(PayOrderUseCase())
        }
    }
    
    fileprivate func assertShoppingCartCell(_ cell: ShoppingCartTableViewCell,  containsInfo info: ShoppingCartItem) {
        
        XCTAssertEqual(info.productName, cell.productNameLabel.text!)
        XCTAssertEqual("\(info.quantity)", cell.quantityLabel.text!)
        XCTAssertEqual("\(info.totalPrice) $", cell.totalPriceLabel.text!)
        
        if let discount = info.discount {
            XCTAssertFalse(cell.discountView.isHidden)
            XCTAssertEqual("\(discount.description)", cell.discountDescriptionLabel.text)
            XCTAssertEqual("-\(discount.amount) $", cell.discountAmountLabel.text)
        } else {
            XCTAssertTrue(cell.discountView.isHidden)
        }
    }
    
}
