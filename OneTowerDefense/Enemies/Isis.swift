//
//  Isis.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//


class Isis: Enemy {
    let normaTexture = SKTexture (imageNamed: "spr_player_celebrate")
    let rageTexture = SKTexture (imageNamed: "spr_player_die")
    var texture = normaTexture
    override var maxHealth = 250
    var enrageSpeed = 13
    override var enragePercent = 0.10
    override var value = 5
    
    init (position: CGPoint){
        super.init(positions)
    }
    
    override func enrage(){
        super.enrage()
        self.texture = rageTexture
        self.speed = enrageSpeed
    }
}