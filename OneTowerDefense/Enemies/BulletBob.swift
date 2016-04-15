//
//  BulletBob.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

class BulletBob: Enemy {
    let texture = SKTexture (imageNamed: "spr_rocket")
    override var speed = 15
    
    init (position: CGPoint){
        super.init(position)
    }
}