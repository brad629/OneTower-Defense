//
//  MetalMan.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

class Isis: MetalMan {
    let normaTexture = SKTexture (imageNamed: "spr_sparky_idle")
    let rageTexture = SKTexture (imageNamed: "spr_sparky_electrocute")
    var texture = normaTexture
    override var maxHealth = 300
    override var speed = 5
    var enrageSpeed = 8
    override var enragePercent = 0.30
    override var value = 3
    
    init (position: CGPoint){
        super.init(position)
    }
    
    override func enrage(){
        super.enrage()
        self.texture = rageTexture
        self.speed = enrageSpeed
    }
}