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

var stickActive:Bool = false

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        //Set up scene here
        
        player.xScale = 0.5
        player.yScale = 0.5
        player.position = CGPoint(x: frame.size.width / 30, y: frame.size.height / 15)
        
        self.addChild(player)
        
        //Creates the Base for the Joystick and adds it to the GameScene
        let base = SKSpriteNode(imageNamed:"Base")
        
        base.xScale = 1.5
        base.yScale = 1.5
        base.position = CGPoint(x:-530, y:-250)
        
        self.addChild(base)
        
        //Creates joystick and puts it on the GameScene
        let joystick = Joystick(imageNamed:"Joystick")
        
        joystick.xScale = 1.5
        joystick.yScale = 1.5
        joystick.position = base.position
        
        
        //Creates button A and puts it on the GameScene
        let btn = button(imageNamed:"buttonA")
        
        btn.xScale = 1.5
        btn.yScale = 1.5
        btn.position = CGPoint(x:530, y:-250)
        
        
        base.alpha = 0.4
        joystick.alpha = 0.4
        
        btn.selector = #selector(callbackForButton(sender:))
        btn.target = self
        btn.base = base
        
        joystick.selector = #selector(callbackForJoystick(sender:))
        joystick.target = self
        joystick.base = base
        joystick.player = player
        
        self.addChild(btn)
        self.addChild(joystick)

        
    }

    override func update(_ currentTime: CFTimeInterval) {
        //Called before each frame is rendered
        
    }
    
    @objc func callbackForButton(sender:ActionNode!)
    {
        print("Callback for button")
    }
    
    @objc func callbackForJoystick(sender:ActionNode!)
    {
        print("Callback for joystick")
    }
    
}
