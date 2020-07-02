//
//  ActionNode.swift
//  Franklin500
//
//  Created by Gregory Casamento on 2/2/17.
//  Copyright © 2017 olc. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import GameController

class ActionNode: SKSpriteNode {
    var target : NSObject!
    var selector : Selector!
    var location : CGPoint?
    var base : SKSpriteNode!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Called when a touch begins
        for touch in touches {
            location = touch.location(in: base)
            target.performSelector(onMainThread: selector, with: self, waitUntilDone: true)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
