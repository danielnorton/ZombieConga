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
    var updateInterval : NSTimeInterval = 0
    var zombieMovePointsPerSec: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    
    // MARK: - SKScene
    override func didMoveToView(view: SKView) {
    
        drawBackground()
        firstZombie = drawFirstZombie()
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        if let zombie = firstZombie {

            let v = CGPoint(x: zombieMovePointsPerSec, y: 0)
            moveSprite(zombie, byVelocity: v)
        }

        updateInterval = lastUpdateTime > 0
            ? currentTime - lastUpdateTime
            : 0
        
        lastUpdateTime = currentTime
        print("\(updateInterval*1000) milliseconds since last update")
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
    
    func moveSprite(sprite: SKSpriteNode, byVelocity velocity: CGPoint) {
        
        let interval = CGFloat(updateInterval)
        let ax = velocity.x * interval
        let ay = velocity.y * interval
        let amountToMove = CGPoint(x: ax, y: ay)
        print("Amount to move: \(amountToMove)")

        let px = sprite.position.x + amountToMove.x
        let py = sprite.position.y + amountToMove.y
        sprite.position = CGPoint(x: px, y: py)
    }
}