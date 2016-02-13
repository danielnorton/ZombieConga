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
        let updateInterval = CGFloat(interval)
        let ax = velocity.x * updateInterval
        let ay = velocity.y * updateInterval
        let amountToMove = CGPoint(x: ax, y: ay)
        
        let px = position.x + amountToMove.x
        let py = position.y + amountToMove.y
        position = CGPoint(x: px, y: py)
    }
    
    func setVelocity(towardPoint point: CGPoint) {

        let ox = point.x - position.x
        let oy = point.y - position.y
        let offset = CGPoint(x: ox, y: oy)
        
        let length = CGFloat(sqrt(Double(offset.x * offset.x + offset.y * offset.y)))
        
        let dx = offset.x / length
        let dy = offset.y / length
        let direction = CGPoint(x: dx, y: dy)
        
        let vx = direction.x * movePointsPerSecond
        let vy = direction.y * movePointsPerSecond
        velocity = CGPoint(x: vx, y: vy)
    }
    
    func rotate(direction: CGPoint) {
        
        zRotation = CGFloat(
        atan2(Double(direction.y), Double(direction.x)))
    }
}
