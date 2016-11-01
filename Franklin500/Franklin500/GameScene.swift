//
//  GameScene.swift
//  Franklin500
//
//  Created by Gregory Casamento and Nicholas Casamento on 10/3/16.
//  Copyright © 2016 olc. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    var player = SKSpriteNode(imageNamed:"Spaceship")
    override func didMove(to view: SKView) {
        //Set up scene here
        
        player.xScale = 0.5
        player.yScale = 0.5
        player.position = CGPoint(x: frame.width / 10, y: frame.height / 10)
        
        self.addChild(player)

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
