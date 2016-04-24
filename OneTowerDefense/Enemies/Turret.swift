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
    var range = CGFloat(100)
    
    
    init (position: CGPoint){
        let texture = SKTexture (imageNamed: "spr_cannon_barrel")
        super.init(texture: texture,color:SKColor(),size:texture.size())
        self.position = position

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareToShoot(target:Enemy) -> Bullet?{
        if fireRate - timeSinceLastShot <= 0 {
           return shoot(target)
        }
        else {
            timeSinceLastShot++
            return nil
        }
    }
    
    func shoot(target: Enemy) -> Bullet{
        let opposite = target.position.y - self.position.y
        let adjacent = target.position.x - self.position.x
        self.zRotation = atan2(opposite, adjacent)
        
        
        var bullet = Bullet(position: self.position, damage: damage, slow: slow, snare: snare, areaOfEffect: areaOfEffect, target: target)
            bullet.zPosition = 4
            return bullet
    }
}