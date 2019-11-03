// MARK: - Mocks generated from file: CabifyMobileChallenge/DependencyInjection/ServiceLocator.swift at 2019-11-03 08:23:26 +0000

//
//  ServiceLocator.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Cuckoo
@testable import CabifyMobileChallenge

import Foundation


 class MockServiceLocator: ServiceLocator, Cuckoo.ProtocolMock {
    
     typealias MocksType = ServiceLocator
    
     typealias Stubbing = __StubbingProxy_ServiceLocator
     typealias Verification = __VerificationProxy_ServiceLocator

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ServiceLocator?

     func enableDefaultImplementation(_ stub: ServiceLocator) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var productRepository: ProductRepository {
        get {
            return cuckoo_manager.getter("productRepository",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.productRepository)
        }
        
    }
    
    
    
     var discountRepository: DiscountRepository {
        get {
            return cuckoo_manager.getter("discountRepository",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.discountRepository)
        }
        
    }
    
    
    
     var getProductsUseCase: GetProductsUseCase {
        get {
            return cuckoo_manager.getter("getProductsUseCase",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getProductsUseCase)
        }
        
    }
    
    
    
     var getDiscountUseCase: GetDiscountUseCase {
        get {
            return cuckoo_manager.getter("getDiscountUseCase",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.getDiscountUseCase)
        }
        
    }
    
    
    
     var payOrderUseCase: PayOrderUseCase {
        get {
            return cuckoo_manager.getter("payOrderUseCase",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.payOrderUseCase)
        }
        
    }
    

    

    

	 struct __StubbingProxy_ServiceLocator: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var productRepository: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockServiceLocator, ProductRepository> {
	        return .init(manager: cuckoo_manager, name: "productRepository")
	    }
	    
	    
	    var discountRepository: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockServiceLocator, DiscountRepository> {
	        return .init(manager: cuckoo_manager, name: "discountRepository")
	    }
	    
	    
	    var getProductsUseCase: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockServiceLocator, GetProductsUseCase> {
	        return .init(manager: cuckoo_manager, name: "getProductsUseCase")
	    }
	    
	    
	    var getDiscountUseCase: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockServiceLocator, GetDiscountUseCase> {
	        return .init(manager: cuckoo_manager, name: "getDiscountUseCase")
	    }
	    
	    
	    var payOrderUseCase: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockServiceLocator, PayOrderUseCase> {
	        return .init(manager: cuckoo_manager, name: "payOrderUseCase")
	    }
	    
	    
	}

	 struct __VerificationProxy_ServiceLocator: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var productRepository: Cuckoo.VerifyReadOnlyProperty<ProductRepository> {
	        return .init(manager: cuckoo_manager, name: "productRepository", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var discountRepository: Cuckoo.VerifyReadOnlyProperty<DiscountRepository> {
	        return .init(manager: cuckoo_manager, name: "discountRepository", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var getProductsUseCase: Cuckoo.VerifyReadOnlyProperty<GetProductsUseCase> {
	        return .init(manager: cuckoo_manager, name: "getProductsUseCase", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var getDiscountUseCase: Cuckoo.VerifyReadOnlyProperty<GetDiscountUseCase> {
	        return .init(manager: cuckoo_manager, name: "getDiscountUseCase", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var payOrderUseCase: Cuckoo.VerifyReadOnlyProperty<PayOrderUseCase> {
	        return .init(manager: cuckoo_manager, name: "payOrderUseCase", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class ServiceLocatorStub: ServiceLocator {
    
    
     var productRepository: ProductRepository {
        get {
            return DefaultValueRegistry.defaultValue(for: (ProductRepository).self)
        }
        
    }
    
    
     var discountRepository: DiscountRepository {
        get {
            return DefaultValueRegistry.defaultValue(for: (DiscountRepository).self)
        }
        
    }
    
    
     var getProductsUseCase: GetProductsUseCase {
        get {
            return DefaultValueRegistry.defaultValue(for: (GetProductsUseCase).self)
        }
        
    }
    
    
     var getDiscountUseCase: GetDiscountUseCase {
        get {
            return DefaultValueRegistry.defaultValue(for: (GetDiscountUseCase).self)
        }
        
    }
    
    
     var payOrderUseCase: PayOrderUseCase {
        get {
            return DefaultValueRegistry.defaultValue(for: (PayOrderUseCase).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: CabifyMobileChallenge/Domain/Repository/DiscountRepository.swift at 2019-11-03 08:23:26 +0000

//
//  DiscountRepository.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Cuckoo
@testable import CabifyMobileChallenge

import Foundation


 class MockDiscountRepository: DiscountRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = DiscountRepository
    
     typealias Stubbing = __StubbingProxy_DiscountRepository
     typealias Verification = __VerificationProxy_DiscountRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: DiscountRepository?

     func enableDefaultImplementation(_ stub: DiscountRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getDiscounts(forProducts products: [String], result: @escaping (Result<[String:Discount],Error>) -> Void)  {
        
    return cuckoo_manager.call("getDiscounts(forProducts: [String], result: @escaping (Result<[String:Discount],Error>) -> Void)",
            parameters: (products, result),
            escapingParameters: (products, result),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getDiscounts(forProducts: products, result: result))
        
    }
    

	 struct __StubbingProxy_DiscountRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getDiscounts<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forProducts products: M1, result: M2) -> Cuckoo.ProtocolStubNoReturnFunction<([String], (Result<[String:Discount],Error>) -> Void)> where M1.MatchedType == [String], M2.MatchedType == (Result<[String:Discount],Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<([String], (Result<[String:Discount],Error>) -> Void)>] = [wrap(matchable: products) { $0.0 }, wrap(matchable: result) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockDiscountRepository.self, method: "getDiscounts(forProducts: [String], result: @escaping (Result<[String:Discount],Error>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_DiscountRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getDiscounts<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(forProducts products: M1, result: M2) -> Cuckoo.__DoNotUse<([String], (Result<[String:Discount],Error>) -> Void), Void> where M1.MatchedType == [String], M2.MatchedType == (Result<[String:Discount],Error>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<([String], (Result<[String:Discount],Error>) -> Void)>] = [wrap(matchable: products) { $0.0 }, wrap(matchable: result) { $0.1 }]
	        return cuckoo_manager.verify("getDiscounts(forProducts: [String], result: @escaping (Result<[String:Discount],Error>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class DiscountRepositoryStub: DiscountRepository {
    

    

    
     func getDiscounts(forProducts products: [String], result: @escaping (Result<[String:Discount],Error>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: CabifyMobileChallenge/Domain/Repository/ProductRepository.swift at 2019-11-03 08:23:26 +0000

//
//  ProductRepository.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Cuckoo
@testable import CabifyMobileChallenge

import Foundation


 class MockProductRepository: ProductRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = ProductRepository
    
     typealias Stubbing = __StubbingProxy_ProductRepository
     typealias Verification = __VerificationProxy_ProductRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ProductRepository?

     func enableDefaultImplementation(_ stub: ProductRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getProducts(result: @escaping (Result<[Product],CustomError>) -> Void)  {
        
    return cuckoo_manager.call("getProducts(result: @escaping (Result<[Product],CustomError>) -> Void)",
            parameters: (result),
            escapingParameters: (result),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getProducts(result: result))
        
    }
    

	 struct __StubbingProxy_ProductRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getProducts<M1: Cuckoo.Matchable>(result: M1) -> Cuckoo.ProtocolStubNoReturnFunction<((Result<[Product],CustomError>) -> Void)> where M1.MatchedType == (Result<[Product],CustomError>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((Result<[Product],CustomError>) -> Void)>] = [wrap(matchable: result) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockProductRepository.self, method: "getProducts(result: @escaping (Result<[Product],CustomError>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ProductRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getProducts<M1: Cuckoo.Matchable>(result: M1) -> Cuckoo.__DoNotUse<((Result<[Product],CustomError>) -> Void), Void> where M1.MatchedType == (Result<[Product],CustomError>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<((Result<[Product],CustomError>) -> Void)>] = [wrap(matchable: result) { $0 }]
	        return cuckoo_manager.verify("getProducts(result: @escaping (Result<[Product],CustomError>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ProductRepositoryStub: ProductRepository {
    

    

    
     func getProducts(result: @escaping (Result<[Product],CustomError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

