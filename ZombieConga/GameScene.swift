//
//  GameScene.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/9/16.
//  Copyright (c) 2016 brimstead. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    let background: SKSpriteNode
    let zombie: MoveNode
    var lastUpdateTime: NSTimeInterval = 0
    var updateInterval : NSTimeInterval = 0
    
    
    // MARK: - SKScene
    override init(size: CGSize) {

        background = SKSpriteNode(imageNamed: "background1")
        background.anchorPoint = CGPoint.zero
        background.zPosition = -1
        
        zombie = MoveNode(imageNamed: "zombie1")
        zombie.anchorPoint = CGPoint.zero
        zombie.position = CGPoint(x: 400, y: 400)
        
        super.init(size: size)

        backgroundColor = SKColor.blackColor()
        addChild(background)
        addChild(zombie)
    }
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        zombie.move(forInterval: updateInterval)
        
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
}