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
    let texture = SKTexture (imageNamed: "spr_cannon_barrel")
    
    init (position: CGPoint){
        position = position
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareToShoot(Enemy:target){
        if fireRate - timeSinceLastShot <= 0 {
            shoot(target)
        }
        else {
            timeSinceLastShot++
        }
    }
    
    func shoot(Enemy: target){
        var bullet = bullet(position: self.position, damage: damage, slow: slow, snare: snare, areaOfEffect: snare, target: target)
    }
}