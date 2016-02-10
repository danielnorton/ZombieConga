//
//  GameScene.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/9/16.
//  Copyright (c) 2016 brimstead. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    var zombie = SKSpriteNode(imageNamed: "zombie1")
    var lastUpdateTime: NSTimeInterval = 0
    var updateInterval : NSTimeInterval = 0
    var zombieMovePointsPerSec: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    
    // MARK: - SKScene
    override func didMoveToView(view: SKView) {
    
        drawBackground()
        drawZombie()
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        moveSprite(zombie, byVelocity: velocity)
        
        updateInterval = lastUpdateTime > 0
            ? currentTime - lastUpdateTime
            : 0
        
        lastUpdateTime = currentTime
        print("\(updateInterval*1000) milliseconds since last update")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        sceneTouched(touches)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        sceneTouched(touches)
    }
    
    // MARK: - GameScene
    func drawBackground() {
        
        backgroundColor = SKColor.blackColor()
        
        let background = SKSpriteNode(imageNamed: "background1")
        background.anchorPoint = CGPoint.zero
        background.zPosition = -1
        addChild(background)
    }
    
    func drawZombie() -> SKSpriteNode {
        
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
    
    func moveSprite(sprite: SKSpriteNode, toPoint point: CGPoint, pointsPerSecond points : CGFloat) {
        
        let ox = point.x - sprite.position.x
        let oy = point.y - sprite.position.y
        let offset = CGPoint(x: ox, y: oy)
        
        let length = CGFloat(sqrt(Double(offset.x * offset.x + offset.y * offset.y)))
        
        let dx = offset.x / length
        let dy = offset.y / length
        let direction = CGPoint(x: dx, y: dy)
        
        let vx = direction.x * points
        let vy = direction.y * points
        velocity = CGPoint(x: vx, y: vy)
    }
    
    func sceneTouched(touches: Set<UITouch>) {
        
        guard let touch = touches.first else { return }
        let touchLocation = touch.locationInNode(self)
        moveSprite(zombie, toPoint: touchLocation, pointsPerSecond: zombieMovePointsPerSec)
    }
}