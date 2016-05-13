//
//  bullet.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

import SpriteKit

class Bullet : SKSpriteNode {
    var target : Enemy
    var timeToLive = 5
    var damage : Double
    var slow : Int
    var snare : Bool
    var areaOfEffect : Int
    
    init (position: CGPoint, damage: Double, slow: Int, snare: Bool, areaOfEffect: Int, target: Enemy) {
        self.damage = damage
        self.slow = slow
        self.snare = snare
        self.areaOfEffect = areaOfEffect
        self.target = target
        let texture = SKTexture (imageNamed: "spr_cannon_blue")
        super.init(texture: texture,color:SKColor(),size:texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDelta(delta: NSTimeInterval){
        if position.x > target.position.x{
            position.x -= 5
        } else if position.x < target.position.x{
            position.x += 5
        }
        
        if position.y > target.position.y{
            position.y -= 5
        } else if position.y < target.position.y{
            position.y += 5
        }
    }
}