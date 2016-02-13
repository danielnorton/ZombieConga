//
//  CGPointTests.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/12/16.
//  Copyright © 2016 brimstead. All rights reserved.
//

import XCTest
import SpriteKit
@testable import ZombieConga


class CGPointTests: XCTestCase {

    func testAddInteger() {
        
        let testPoint1 = CGPoint(x: 100, y: 100)
        let testPoint2 = CGPoint(x: 50, y: 50)
        let testPoint3 = testPoint1 + testPoint2
        
        XCTAssert(testPoint3 == CGPoint(x: 150, y: 150))
    }
    
    func testAddDouble() {
        
        let testPoint1 = CGPoint(x: 100.2, y: 100.2)
        let testPoint2 = CGPoint(x: 50, y: 50)
        let testPoint3 = testPoint1 + testPoint2
        
        XCTAssert(testPoint3 == CGPoint(x: 150.2, y: 150.2))
    }
    
    func testAddEquals() {
        
        var testPoint1 = CGPoint(x: 100.2, y: 100.2)
        let testPoint2 = CGPoint(x: 50, y: 50)
        testPoint1 += testPoint2
        
        XCTAssert(testPoint1 == CGPoint(x: 150.2, y: 150.2))
    }
    
    func testSubtract() {
        
        let testPoint1 = CGPoint(x: 100, y: 100)
        let testPoint2 = CGPoint(x: 50, y: 50)
        let testPoint3 = testPoint1 - testPoint2
        
        XCTAssert(testPoint3 == CGPoint(x: 50, y: 50))
    }
    
    func testSubtractEquals() {
        
        var testPoint1 = CGPoint(x: 100, y: 100)
        let testPoint2 = CGPoint(x: 50, y: 50)
        testPoint1 -= testPoint2
        
        XCTAssert(testPoint1 == CGPoint(x: 50, y: 50))
    }
    
    func testMultiply() {
        
        let testPoint1 = CGPoint(x: 100, y: 100)
        let testPoint2 = CGPoint(x: 50, y: 50)
        let testPoint3 = testPoint1 * testPoint2
        
        XCTAssert(testPoint3 == CGPoint(x: 5000, y: 5000))
    }
    
    func testMultiplyEquals() {
        
        var testPoint1 = CGPoint(x: 100, y: 100)
        let testPoint2 = CGPoint(x: 50, y: 50)
        testPoint1 *= testPoint2
        
        XCTAssert(testPoint1 == CGPoint(x: 5000, y: 5000))
    }
    
    func testDivide() {

        let testPoint1 = CGPoint(x: 100, y: 100)
        let testPoint2 = CGPoint(x: 50, y: 50)
        let testPoint3 = testPoint1 / testPoint2
        
        XCTAssert(testPoint3 == CGPoint(x: 2, y: 2))
    }

    func testDivideEquals() {
        
        var testPoint1 = CGPoint(x: 100, y: 100)
        let testPoint2 = CGPoint(x: 50, y: 50)
        testPoint1 /= testPoint2
        
        XCTAssert(testPoint1 == CGPoint(x: 2, y: 2))
    }
    
    func testLength() {
        
        let testPoint1 = CGPoint(x: 2, y: 2)
        let length = testPoint1.length()
        let expected = CGFloat(sqrt(8.0))
        XCTAssert(length == expected)
    }
    
    func testNormalized() {
        
        let testPoint1 = CGPoint(x: 2, y: 2)
        let normal = testPoint1.normalized()
        let point = CGFloat(2 / sqrt(8.0))
        let expected = CGPoint(x: point, y: point)
        XCTAssert(normal == expected)
    }
    
    func testAngle() {
        
        let point = CGPoint(x: 2, y: 2)
        let atan = point.angle
        
        let expected = atan2(point.y, point.x)
        XCTAssert(atan == expected, "\(atan) ☹️ \(expected)")
    }
}





