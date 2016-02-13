//
//  MoveNode.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/11/16.
//  Copyright © 2016 brimstead. All rights reserved.
//


import SpriteKit


class MoveNode : SKSpriteNode {
    
    var movePointsPerSecond: CGFloat = 480.0
    var velocity = CGPoint.zero
    
    func move(forInterval interval: NSTimeInterval) {

        let amountToMove = velocity * CGFloat(interval)
        position += amountToMove
    }
    
    func setVelocity(towardPoint point: CGPoint) {

        let offset = point - position
        let direction = offset.normalized()
        
        velocity  = direction * movePointsPerSecond
    }
    
    func rotate(direction: CGPoint) {
        
        zRotation = CGFloat(
        atan2(Double(direction.y), Double(direction.x)))
    }
}
