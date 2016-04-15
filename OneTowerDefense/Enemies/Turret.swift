//
//  turret.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

import SpriteKit

class Turret : SKSpriteNode {
    var damage = 10.0
    var fireRate = 10
    var timeSinceLastShot = 0
    var slow = 0
    var snare = false
    var areaOfEffect = 0
    
    
    init (position: CGPoint){
        let texture = SKTexture (imageNamed: "spr_cannon_barrel")
        super.init(texture: texture,color:SKColor(),size:texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareToShoot(target:Enemy){
        if fireRate - timeSinceLastShot <= 0 {
            shoot(target)
        }
        else {
            timeSinceLastShot++
        }
    }
    
    func shoot(target: Enemy){
       // var bullet = Bullet(position: self.position, damage: damage, slow: slow, snare: snare, areaOfEffect: snare, target: target)
    }
}