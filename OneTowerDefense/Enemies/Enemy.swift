//
//  Enemy.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

import SpriteKit

class Enemy : SKSpriteNode {
    var maxHealth = 100.0
    var currentHealth:Double
    var enragePercent = 0.25
    var enraged = false
    var mSpeed = CGFloat(15)
    var value = 1

    //var resistance = nil
    
    init (position: CGPoint, texture: SKTexture){
        currentHealth = maxHealth
        var texture = texture
        super.init(texture: texture,color:SKColor(),size:texture.size())
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func move (position: CGPoint) {
        self.position = position
    }
    
    //returns true if enemy is dead
    func takeDamage (damage : Double) -> Bool {
        self.currentHealth -= damage
        if self.currentHealth < 0 {
            return true
        }
        else if self.currentHealth < (self.maxHealth * self.enragePercent){
            enrage()
        }
        return false
    }
    
    func enrage(){
        enraged = true
    }
     func updateDelta(delta :NSTimeInterval){
        if position.y < 370 && position.x < 580  {
            position.x = position.x + mSpeed
        }else{
            position.y = position.y - mSpeed
        }
}
}