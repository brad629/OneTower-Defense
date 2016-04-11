//
//  Enemy.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

import SpriteKit

class Enemy : SKNode {
    var maxHealth = 100.0
    var currentHealth:Double
    var enragePercent = 0.25
    var enraged = false
    var normalSpeed = 10
    var rageSpeed = 12
    var value = 1
    //var resistance = nil
    var basicImg : SKSpriteNode
    var rageImg  : SKSpriteNode
    var currentImg : SKSpriteNode
    
    init (position: CGPoint){
        currentHealth = maxHealth
        super.init()
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
}


