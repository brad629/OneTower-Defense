//
//  Turtle.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

class Turtle: Enemy {
    let normaTexture = SKTexture (imageNamed: "spr_turtle_sneeze")
    let rageTexture = SKTexture (imageNamed: "spr_turtle_spikes")
    var texture = normaTexture
    override var maxHealth = 600
    override var speed = 2
    let enrageSpeed = 3
    override var enragePercent = 0.10
    override var value = 10
    
    init (position: CGPoint){
        super.init(position)
    }
    
    override func enrage(){
        super.enrage()
        self.texture = rageTexture
        self.speed = enrageSpeed
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