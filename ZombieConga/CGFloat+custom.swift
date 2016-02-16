//
//  CGFloat+custom.swift
//  ZombieConga
//
//  Created by Daniel Norton on 2/15/16.
//  Copyright © 2016 brimstead. All rights reserved.
//

import Foundation
import CoreGraphics

let π = CGFloat(M_PI)

extension CGFloat {
    
    func sign() -> CGFloat {
        
        return (self > 0.0)
        ? 1.0
        : -1.0
    }
    
    func shortestAngleTo(radian other: CGFloat) -> CGFloat {

        let twoπ = 2.0 * π
        var angle = (other - self) % twoπ
        
        if (angle >= π) {
            
            angle -= twoπ
            
        } else if (angle <= -π) {
            
            angle += twoπ
        }
        
        return angle
    }
    
    func degreesToRadians() -> CGFloat {
        
        return self * (π / CGFloat(180.0))
    }
    
    func radiansToDegrees() -> CGFloat {
        
        return self * (CGFloat(180.0) / π)
    }
    
    func roundPower(power: CGFloat) -> CGFloat {
        
        return round(self * power) / power
    }
}