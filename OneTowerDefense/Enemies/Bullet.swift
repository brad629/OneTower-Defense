//
//  bullet.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

import SpriteKit

class Bullet : SKSpriteNode {
    
    init (position: CGPoint, damage: Double, slow: int, snare: bool, areaOfEffect: int, target: Enemy) {
        self.position = position
        self.damage = damage
        self.slow = slow
        self.snare = snare
        self.areaOfEffect = areaOfEffect
        self.target = target
        let texture = SKTexture (imageNamed: "spr_cannon_blue")
        super.init(texture:texture)
    }
    override func updateDelta(delta: NSTimeInterval){
        if self.box.intersects(target.box){
            target.takeDamage(damage)
        }
    }
}