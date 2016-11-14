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
var dpad = SKSpriteNode(imageNamed:"Dpad")
var joystick = SKSpriteNode(imageNamed:"Joystick")

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        //Set up scene here
        
        player.xScale = 0.5
        player.yScale = 0.5
        player.position = CGPoint(x: frame.width / 10, y: frame.height / 10)
        
        self.addChild(player)
        
        dpad.xScale = 1.5
        dpad.yScale = 1.5
        dpad.position = CGPoint(x:-530, y:-250)
        
        self.addChild(dpad)
        
        joystick.xScale = 1.5
        joystick.yScale = 1.5
        joystick.position = dpad.position
        
        self.addChild(joystick)
        
        dpad.alpha = 0.4
        joystick.alpha = 0.4
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Called when a touch begins
        for touch in touches{
            let location = touch.location(in: self)
            
            if player.contains(location){
                player.position = location
            }
        }
        
    }
    
        
    override func update(_ currentTime: CFTimeInterval) {
        //Called before each frame is rendered
    }
    
}
