//
//  MoveNode.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/11/16.
//  Copyright © 2016 brimstead. All rights reserved.
//


import SpriteKit


class MoveNode : SKSpriteNode {
    
    let zombieRotateRadiansPerSec:CGFloat = 4.0 * π
    let movePointsPerSecond: CGFloat = 480.0
    var velocity = CGPoint.zero
    var goal: CGPoint?
    
    func move(forInterval interval: NSTimeInterval) {

        guard velocity != CGPoint.zero else { return }

        rotate(velocity, forInterval: interval)
        let amountToMove = velocity * CGFloat(interval)
        position += amountToMove
        
        if let point = goal {

            let moveLength = amountToMove.length()
            let diffLength = (point - position).length()
            if diffLength < moveLength {
                
                velocity = CGPoint.zero
            }
        }
    }
    
    func setVelocity(towardGoal goal: CGPoint) {

        self.goal = goal
        let offset = goal - position
        let direction = offset.normalized()
        
        velocity  = direction * movePointsPerSecond
    }
    
    func rotate(direction: CGPoint, forInterval interval: NSTimeInterval) {
        
        let goal = CGFloat(atan2(Double(direction.y), Double(direction.x)))
        let shortest = zRotation.shortestAngleTo(radian: goal)
        let amountToMove = shortest * (CGFloat(interval) * zombieRotateRadiansPerSec)
        
        zRotation += amountToMove
    }
}





