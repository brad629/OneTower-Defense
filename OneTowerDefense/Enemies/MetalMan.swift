//
//  MetalMan.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//
import SpriteKit

class MetalMan : Enemy {
    let normTexture = SKTexture (imageNamed: "spr_sparky_idle")
    let rageTexture = SKTexture (imageNamed: "spr_sparky_electrocute")
    var enrageSpeed = CGFloat(8)
    
    init (position: CGPoint){
        super.init(position: position, texture: normTexture)
        self.value = 10
        self.enragePercent = 0.30
        self.maxHealth = 300
        self.mSpeed = 5
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
}