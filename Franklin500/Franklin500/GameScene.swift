//
//  GameScene.swift
//  Franklin500
//
//  Created by Gregory Casamento and Nicholas Casamento on 10/3/16.
//  Copyright © 2016 olc. All rights reserved.
//

import SpriteKit
import GameplayKit

var player = SKSpriteNode(imageNamed:"Spaceship")
var base = SKSpriteNode(imageNamed:"Base")
var joystick = SKSpriteNode(imageNamed:"Joystick")

var stickActive:Bool = false

class Button: SKSpriteNode {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Called when a touch begins
        for touch in touches {
            let location = touch.location(in: self)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}


class GameScene: SKScene {
    override func didMove(to view: SKView) {
        //Set up scene here
        
        player.xScale = 0.5
        player.yScale = 0.5
        player.position = CGPoint(x: frame.width / 10, y: frame.height / 10)
        
        self.addChild(player)
        
        base.xScale = 1.5
        base.yScale = 1.5
        base.position = CGPoint(x:-530, y:-250)
        
        self.addChild(base)
        
        joystick.xScale = 1.5
        joystick.yScale = 1.5
        joystick.position = base.position
        
        self.addChild(joystick)
        
        let buttonOne = Button(imageNamed:"buttonA")
        
        buttonOne.xScale = 1.5
        buttonOne.yScale = 1.5
        buttonOne.position = CGPoint(x:530, y:-250)
        
        self.addChild(buttonOne)
        
        base.alpha = 0.4
        joystick.alpha = 0.4
        
    }

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
            
            //let length:CGFloat = base.frame.size.height / 5
            
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
    
    override func update(_ currentTime: CFTimeInterval) {
        //Called before each frame is rendered
        
    }
    
}
