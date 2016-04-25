//
//  BulletBob.swift
//  OneTower Defense
//
//  Created by bradley huntington on 4/8/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//
import SpriteKit

class BulletBob: Enemy {
    
    init (position: CGPoint){
        let texture = SKTexture(imageNamed: "spr_rocket")
        super.init(position: position,texture: texture)
        self.mSpeed = 5
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}