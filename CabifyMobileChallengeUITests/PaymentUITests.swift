//
//  PaymentUITests.swift
//  CabifyMobileChallengeUITests
//
//  Created by Jesus Martin Alonso on 02/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import XCTest
import KIF
import Cuckoo
@testable import CabifyMobileChallenge
class PaymentUITests: AcceptanceTestCase {

    fileprivate var serviceLocator: MockServiceLocator!
    
    override func setUp() {
       serviceLocator = MockServiceLocator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func test_payment_in_progress_then_show_completed() {
        //Given
        givenMockServiceLocatorReturnPayOrderUseCase()
        
        //When
        _ = openPaymentViewController()
        
        //Then
        tester().waitForView(withAccessibilityLabel: "Payment completed successfully!")
        tester().waitForView(withAccessibilityLabel: "Return to store")
    }
    
    fileprivate func openPaymentViewController() -> PaymentViewController {
        let viewController = PaymentRouter.createPaymentViewController(serviceLocator: serviceLocator)
           let rootViewController = UINavigationController()
           rootViewController.isNavigationBarHidden = true
           rootViewController.viewControllers = [viewController]
           present(viewController: rootViewController)
           tester().waitForAnimationsToFinish()
           return viewController
       }
    
    fileprivate func givenMockServiceLocatorReturnPayOrderUseCase(){
        stub(serviceLocator) { (stub) in
            when(stub.payOrderUseCase.get).thenReturn(PayOrderUseCase())
        }
    }

}
