//
//  CGPoint+custom.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/12/16.
//  Copyright © 2016 brimstead. All rights reserved.
//

import Foundation
import CoreGraphics


// MARK: operators
func + (left: CGPoint, right: CGPoint) -> CGPoint {
    
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func += (inout left: CGPoint, right: CGPoint) {
    
    left = left + right
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func -= (inout left: CGPoint, right: CGPoint) {
    
    left = left - right
}

func * (left: CGPoint, right: CGPoint) -> CGPoint {
    
    return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

func *= (inout left: CGPoint, right: CGPoint) {
        
    left = left * right
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {

    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func *= (inout point: CGPoint, scalar: CGFloat) {
    
    point = point * scalar
}

func / (left: CGPoint, right: CGPoint) -> CGPoint {
    
    return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

func /= (inout left: CGPoint, right: CGPoint) {
    
    left = left / right
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

func /= (inout point: CGPoint, scalar: CGFloat) {
    
    point = point / scalar
}

// MARK: extension
extension CGPoint {

    func length() -> CGFloat {

        return sqrt(x*x + y*y)
    }

    func normalized() -> CGPoint {

        return self / length()
    }

    var angle: CGFloat {

        return atan2(y, x)
    }
}


