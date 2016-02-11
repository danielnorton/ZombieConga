//
//  ZombieCongaTests.swift
//  ZombieCongaTests
//
//  Created by Daniel Norton on 2/9/16.
//  Copyright © 2016 brimstead. All rights reserved.
//

import XCTest
import SpriteKit
@testable import ZombieConga

class ZombieCongaTests: XCTestCase {
    
    func testMoveToView() {
        
        let frame = CGRect(x: 0.0, y: 0.0, width: 2048.0, height: 1536.0)
        let scene = GameScene(size: frame.size)
        let view = SKView(frame: frame)
        view.presentScene(scene)
        XCTAssert(scene.children.count == 2)
    }
    
    func testReMoveToView() {
        
        let frame = CGRect(x: 0.0, y: 0.0, width: 2048.0, height: 1536.0)
        let scene = GameScene(size: frame.size)
        let view = SKView(frame: frame)
        view.presentScene(scene)
        view.presentScene(nil)
        view.presentScene(scene)
        XCTAssert(scene.children.count == 2)
    }
    
    func testInit() {
        
        let frame = CGRect(x: 0.0, y: 0.0, width: 2048.0, height: 1536.0)
        let scene = GameScene(size: frame.size)
        XCTAssert(scene.children.count == 2)
    }
}
