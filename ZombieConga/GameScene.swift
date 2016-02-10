//
//  GameScene.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/9/16.
//  Copyright (c) 2016 brimstead. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    var firstZombie: SKSpriteNode?
    var lastUpdateTime: NSTimeInterval = 0
    var dt : NSTimeInterval = 0
    
    
    // MARK: - SKScene
    override func didMoveToView(view: SKView) {
    
        drawBackground()
        firstZombie = drawFirstZombie()
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        if let zombie = firstZombie {
            
            zombie.position = CGPoint(x: zombie.position.x + 8.0, y: zombie.position.y)
        }
        
        if lastUpdateTime > 0 {
            
            dt = currentTime - lastUpdateTime
            
        } else {
            
            dt = 0
        }
        
        lastUpdateTime = currentTime
        print("\(dt*1000) milliseconds since last update")
    }
    
    // MARK: - GameScene
    func drawBackground() {
        
        backgroundColor = SKColor.blackColor()
        
        let background = SKSpriteNode(imageNamed: "background1")
        background.anchorPoint = CGPoint.zero
        background.zPosition = -1
        addChild(background)
    }
    
    func drawFirstZombie() -> SKSpriteNode {
        
        let zombie = SKSpriteNode(imageNamed: "zombie1")
        zombie.anchorPoint = CGPoint.zero
        zombie.position = CGPoint(x: 400, y: 400)
        addChild(zombie)
        
        return zombie
    }
}