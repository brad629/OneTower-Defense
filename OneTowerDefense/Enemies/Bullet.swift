//
//  bullet.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

import SpriteKit

class Bullet : SKSpriteNode {
    
    init (position: CGPoint, damage: Double, slow: Int, snare: Bool, areaOfEffect: Int, target: Enemy) {
        var position = position
        var damage = damage
        var slow = slow
        var snare = snare
        var areaOfEffect = areaOfEffect
        var target = target
        let texture = SKTexture (imageNamed: "spr_cannon_blue")
        super.init(texture: texture,color:SKColor(),size:texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateDelta(delta: NSTimeInterval){
     //   if self.box.intersects(self.target.box){
     //       self.target.takeDamage(self.damage)
    //    }
    }
}