//
//  Isis.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

import SpriteKit

class Isis : Enemy {
    let normTexture = SKTexture (imageNamed: "spr_player_celebrate")
    let rageTexture = SKTexture (imageNamed: "spr_player_die")
    var enrageSpeed = CGFloat(13)
    
    init (position: CGPoint){
        super.init(position: position, texture: normTexture)
        self.value = 5
        self.enragePercent = 0.10
        self.maxHealth = 250
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