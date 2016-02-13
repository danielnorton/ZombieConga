//
//  GameScene.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/9/16.
//  Copyright (c) 2016 brimstead. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    let playableArea: CGRect
    let background: SKSpriteNode
    let zombie: MoveNode
    var lastUpdateTime: NSTimeInterval = 0
    var updateInterval : NSTimeInterval = 0
    
    
    // MARK: - SKScene
    override init(size: CGSize) {

        playableArea = {
           
            let maxAspectRatio: CGFloat = 16.0 / 9.0
            let playableHeight = size.width / maxAspectRatio
            let playableMargin = (size.height - playableHeight) / 2.0
            let rect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
            
            return rect
        }()
        
        background = {
            
            let name = "background1"
            let node = SKSpriteNode(imageNamed: name)
            node.name = name
            node.anchorPoint = CGPoint.zero
            node.zPosition = -1
            
            return node
        }()
        
        zombie = {
            
            let name = "zombie1"
            let node = MoveNode(imageNamed: name)
            node.name = name
            node.position = CGPoint(x: 400, y: 400)
            
            return node
        }()
        
        super.init(size: size)
        
        backgroundColor = SKColor.blackColor()
        addChild(background)
        addChild(zombie)
        
        debugDrawPlayableArea()
    }
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        zombie.move(forInterval: updateInterval)
        boundsCheck(zombie)
        zombie.rotate(zombie.velocity)
        
        updateInterval = lastUpdateTime > 0
            ? currentTime - lastUpdateTime
            : 0
        
        lastUpdateTime = currentTime
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        sceneTouched(touches)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        sceneTouched(touches)
    }
    
    
    // MARK: NSCoding
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - GameScene
    func sceneTouched(touches: Set<UITouch>) {
        
        guard let touch = touches.first else { return }
        let touchLocation = touch.locationInNode(self)
        zombie.setVelocity(towardPoint: touchLocation)
    }
    
    func boundsCheck(node: MoveNode) {
        
        let bottomLeft = CGPoint(x: 0.0, y: playableArea.minY)
        let topRight = CGPoint(x: size.width, y: playableArea.maxY)
        
        if node.position.x <= bottomLeft.x {
            
            node.position.x = bottomLeft.x
            node.velocity.x *= -1
        }
        
        if node.position.x >= topRight.x {
            
            node.position.x = topRight.x
            node.velocity.x *= -1
        }
        
        if node.position.y <= bottomLeft.y {
            
            node.position.y = bottomLeft.y
            node.velocity.y *= -1
        }
        
        if node.position.y >= topRight.y {
            
            node.position.y = topRight.y
            node.velocity.y *= -1
        }
    }
    
    func debugDrawPlayableArea() {
        
        let shape = SKShapeNode()
        let path = CGPathCreateMutable()
        
        CGPathAddRect(path, nil, playableArea)
        shape.path = path
        shape.strokeColor = SKColor.redColor()
        shape.lineWidth = 4.0
        shape.zPosition = 100
        addChild(shape)
    }
}







