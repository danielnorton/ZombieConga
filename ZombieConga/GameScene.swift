//
//  GameScene.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/9/16.
//  Copyright (c) 2016 brimstead. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    
    // MARK: - SKScene
    override func didMoveToView(view: SKView) {
    
        drawBackground()
        drawFirstZombie()
    }
    
    // MARK: - GameScene
    func drawBackground() {
        
        backgroundColor = SKColor.blackColor()
        
        let background = SKSpriteNode(imageNamed: "background1")
        background.anchorPoint = CGPoint.zero
        background.zPosition = -1
        addChild(background)
    }
    
    func drawFirstZombie() {
        
        let zombie = SKSpriteNode(imageNamed: "zombie1")
        zombie.anchorPoint = CGPoint.zero
        zombie.position = CGPoint(x: 400, y: 400)
        zombie.setScale(2.0)
        addChild(zombie)
    }
}