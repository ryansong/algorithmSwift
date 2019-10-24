//
//  algorithmSwiftTests.swift
//  algorithmSwiftTests
//
//  Created by xiaomingsong on 10/24/19.
//  Copyright © 2019 xiaomingsong. All rights reserved.
//

import XCTest
@testable import algorithmSwift

class algorithmSwiftTests: XCTestCase {

    let p = PalindromePartitioning131();
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func testPpartition() {
        if let list = self.p.partition("aab") {
            
            let listSet = Set(list)
            
            var promis = Set<[String]>()
            promis.insert(["a","a","b"]);
            promis.insert(["aa","b"]);
            assert(promis.isSubset(of: listSet)
                && listSet.isSubset(of: promis))
        } else {
            assertionFailure()
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
