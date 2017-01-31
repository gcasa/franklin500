//
//  Joystick.swift
//  Franklin500
//
//  Created by Nicholas Casamento on 1/31/17.
//  Copyright © 2017 olc. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import GameController

class Joystick: SKSpriteNode {
    
    var joystick = SKSpriteNode(imageNamed:"Joystick")
    var base = SKSpriteNode(imageNamed:"Base")
    
    var stickActive:Bool = false
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Called when a touch begins
        for touch in touches{
            let location = touch.location(in: self)
            
            if (joystick.frame.contains(location)) {
                stickActive = true
                
            } else {
                stickActive = false
                
            }
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Moving the joystick around the base
        for touch in touches{
            let location = touch.location(in: self)
            
            if (stickActive == true) {
                
                let v = CGVector(dx: location.x - base.position.x, dy: location.y - base.position.y)
                let angle = atan2(v.dx, v.dy)
                
                let deg = angle * CGFloat(100 / M_PI)
                
                let length:CGFloat = 70
                
                let XDist:CGFloat = sin(angle) * length
                let yDist:CGFloat = cos(angle) * length
                
                joystick.position = CGPoint(x: base.position.x + XDist, y: base.position.y + yDist)
                
                if (base.frame.contains(location)) {
                    joystick.position = location
                    
                } else {
                    joystick.position = CGPoint(x: base.position.x + XDist, y: base.position.y + yDist)
                    
                }
                
                player.zRotation = -angle
                
            }// ends stickActive
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (stickActive == true ) {
            let move:SKAction = SKAction.move(to: base.position, duration: 0.1)
            
            joystick.run(move)
        }
        
    }
    
    func update(_ currentTime: CFTimeInterval) {
        //Called before each frame is rendered
        
    }
    
}
