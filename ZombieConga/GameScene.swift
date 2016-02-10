//
//  GameScene.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/9/16.
//  Copyright (c) 2016 brimstead. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
    
        backgroundColor = SKColor.blackColor()
        
        let background = SKSpriteNode(imageNamed: "background1")
        background.anchorPoint = CGPoint.zero
        background.zPosition = -1
        addChild(background)
    }
}