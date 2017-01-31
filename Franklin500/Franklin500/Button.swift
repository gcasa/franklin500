//
//  Button.swift
//  Franklin500
//
//  Created by Nicholas Casamento on 1/31/17.
//  Copyright © 2017 olc. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import GameController

class button: SKSpriteNode {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Called when a touch begins
        for touch in touches {
            let location = touch.location(in: self)
            
            
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
