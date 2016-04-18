//
//  Turtle.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//
import SpriteKit

class Turtle: Enemy {
    let normTexture = SKTexture (imageNamed: "spr_turtle_sneeze")
    let rageTexture = SKTexture (imageNamed: "spr_turtle_spikes")
    let enrageSpeed = 3
    
    init (position: CGPoint){
        super.init(position: position, texture: normTexture)
        self.value = 10
        self.enragePercent = 0.10
        self.maxHealth = 600
        self.mSpeed = 2
        self.currentHealth = maxHealth
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func enrage(){
        super.enrage()
        self.texture = rageTexture
        self.mSpeed = enrageSpeed
    }
    
    override func takeDamage (damage : Double) -> Bool {
        if enraged {
        self.currentHealth -= damage - (damage * 0.25)
        }
            
        else {
            self.currentHealth -= damage
        }
        
        if self.currentHealth < 0 {
            return true
        }
            
        else if self.currentHealth < (self.maxHealth * self.enragePercent){
            enrage()
        }
        
        return false
    }
}