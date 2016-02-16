//
//  CGFloatTests.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/15/16.
//  Copyright © 2016 brimstead. All rights reserved.
//

import XCTest
@testable import ZombieConga


class CGFloatTests: XCTestCase {

    func testHasPi() {
        
        XCTAssert(π == CGFloat(M_PI))
    }
    
    func testSign() {
        
        let fl1 = CGFloat(10.0)
        XCTAssert(fl1.sign() > 0)
        
        let fl2 = CGFloat(-10.0)
        XCTAssert(fl2.sign() < 0)
    }
    
    func testShortest() {
        
        let start1 = CGFloat(0.0).degreesToRadians()
        let c1 = CGFloat(30.0).degreesToRadians()
        let c2 = CGFloat(390.0).degreesToRadians()
        
        let a1 = start1.shortestAngleTo(radian: c1)
        let a2 = start1.shortestAngleTo(radian: c2)
        
        let power = CGFloat(10000000000.0)
        let r1 = a1.roundPower(power)
        let r2 = a2.roundPower(power)
        
        XCTAssertEqual(r1, r2)
    }
    
    func testShortestBack() {
        
        let start1 = CGFloat(0.0).degreesToRadians()
        let c1 = CGFloat(270.0).degreesToRadians()
        let c2 = CGFloat(-90.0).degreesToRadians()
        
        let a1 = start1.shortestAngleTo(radian: c1)
        let a2 = start1.shortestAngleTo(radian: c2)
        
        let power = CGFloat(10000000000.0)
        let r1 = a1.roundPower(power)
        let r2 = a2.roundPower(power)
        
        XCTAssertEqual(r1, r2)
    }
}
