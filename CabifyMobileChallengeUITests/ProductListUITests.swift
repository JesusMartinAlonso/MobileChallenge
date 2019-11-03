//
//  ProductListUITests.swift
//  CabifyMobileChallengeUITests
//
//  Created by Jesus Martin Alonso on 02/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import XCTest
import KIF
import Cuckoo
@testable import CabifyMobileChallenge


class ProductListUITests: AcceptanceTestCase {
    
    
    fileprivate var serviceLocator: MockServiceLocator!
    fileprivate var productRepository: MockProductRepository!
    
    let products = [
        Product(code: "PRODUCT1", name: "Product One", price: 4.0),
        Product(code: "PRODUCT2", name: "Product Two", price: 10.0)
    ]
    
    
    override func setUp() {
        serviceLocator = MockServiceLocator()
        productRepository = MockProductRepository()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
    func test_nointernetconnection_then_show_message() {
        //Given
        givenGetProductsReturnsError(CustomError.NoInternetConnection)
        //When
        _ = openProductListViewController()
        //Then
        tester().waitForView(withAccessibilityLabel: "There is no Internet connectivity.")
    }
    
    func test_unknownerror_then_show_message() {
        //Given
        givenGetProductsReturnsError(CustomError.Unknown)
        //When
        _ = openProductListViewController()
        //Then
        tester().waitForView(withAccessibilityLabel: "Unknown error. Try again")
    }
    
    func test_products_are_shown_and_checkout_button_is_disabled() {
        //Given
        givenGetProductsReturns(products)
        //When
        let viewController = openProductListViewController()
        
        //Then
        for i in 0..<products.count {
            let cell = tester().waitForCell(at: IndexPath(row: i, section: 0), in: viewController.productsTableView) as? ProductTableViewCell
            
            XCTAssertNotNil(cell)
            assertCell(cell!, hasData: ProductTableViewCellItem(product: products[i], quantity: 0))
        }
        
        XCTAssertFalse(isElementTapable(withAccesibilityLabel: "Checkout (0 items)"))
    }
    
    func test_add_product_then_view_is_updated() {
        //Given
        givenGetProductsReturns([products[0]])
        //When
        _ = openProductListViewController()
        tester().tapView(withAccessibilityLabel: "+")
        
        //Then
        tester().waitForView(withAccessibilityLabel: "1")
        tester().waitForView(withAccessibilityLabel: "Checkout (1 items)")
        XCTAssertTrue(isElementTapable(withAccesibilityLabel: "Checkout (1 items)"))
    }
    
    func test_substract_product_of_cell_with_zero_units_added(){
        //Given
        givenGetProductsReturns([products[0]])
        //When
        _ = openProductListViewController()
        tester().tapView(withAccessibilityLabel: "-")
        
        //Then
        tester().waitForView(withAccessibilityLabel: "0")
        tester().waitForView(withAccessibilityLabel: "Checkout (0 items)")
        XCTAssertFalse(isElementTapable(withAccesibilityLabel: "Checkout (0 items)"))
    }
    
    func test_substract_product_of_cell_with_more_than_one_unit(){
        //Given
        givenGetProductsReturns([products[0]])
        //When
        _ = openProductListViewController()
        tester().tapView(withAccessibilityLabel: "+")
        tester().tapView(withAccessibilityLabel: "+")
        tester().tapView(withAccessibilityLabel: "-")
        
        
        //Then
        tester().waitForView(withAccessibilityLabel: "1")
        tester().waitForView(withAccessibilityLabel: "Checkout (1 items)")
        XCTAssertTrue(isElementTapable(withAccesibilityLabel: "Checkout (1 items)"))
    }
    
    func test_go_to_shopping_cart() {
        
        //Given
        givenThereIsNoDiscounts()
        givenGetProductsReturns([products[0]])
        
        //When
        _ = openProductListViewController()
        tester().tapView(withAccessibilityLabel: "+")
        tester().tapView(withAccessibilityLabel: "Checkout (1 items)")
        
        //Then
        tester().waitForView(withAccessibilityLabel: "Pay!")
        
    }
    
    
    fileprivate func givenGetProductsReturns(_ products: [Product]) {
        stub(productRepository) { (stub) in
            when(stub.getProducts(result: any())).then { (result) in
                result(.success(products))
            }
        }
        
        stub(serviceLocator) { stub in
            when(stub.getProductsUseCase.get).thenReturn(GetProductsUseCase(productRepository: productRepository))
        }
        
    }
    
    
    fileprivate func givenGetProductsReturnsError(_ error: CustomError){
        
        stub(productRepository) { (stub) in
            when(stub.getProducts(result: any())).then { (result) in
                result(.failure(error))
            }
        }
        
        stub(serviceLocator) { stub in
            when(stub.getProductsUseCase.get).thenReturn(GetProductsUseCase(productRepository: productRepository))
        }
    }
    
    fileprivate func givenThereIsNoDiscounts() {
        let discountRepository = MockDiscountRepository()
        
        stub(discountRepository) { stub in
            when(stub.getDiscounts(forProducts: any(), result: any())).then { (_,result) in
                result(.success([:]))
            }
        }
        
        stub(serviceLocator) { (stub) in
            when(stub.getDiscountUseCase.get).thenReturn(GetDiscountUseCase(discountRepository: discountRepository))
        }
        
    }
    
    fileprivate func openProductListViewController() -> ProductListViewController {
        let viewController = ProductListRouter.createProductListViewController(serviceLocator: serviceLocator)
        let rootViewController = UINavigationController()
        rootViewController.isNavigationBarHidden = true
        rootViewController.viewControllers = [viewController]
        present(viewController: rootViewController)
        tester().waitForAnimationsToFinish()
        return viewController
    }
    
    fileprivate func assertCell(_ cell: ProductTableViewCell, hasData data: ProductTableViewCellItem) {
        
        XCTAssertEqual(data.product.name, cell.nameLabel.text!)
        XCTAssertEqual("\(data.product.price) $", cell.priceLabel.text!)
        XCTAssertEqual("\(data.quantity)", cell.quantityLabel.text!)
        
    }
}
