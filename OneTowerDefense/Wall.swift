//
//  Wall.swift
//  OneTowerDefense
//
//  Created by bradley huntington on 4/15/16.
//  Copyright © 2016 brad huntington. All rights reserved.
//

import SpriteKit

class Wall : SKSpriteNode{
    var hasTurret = false
    
    init (position: CGPoint){
        let texture = SKTexture (imageNamed: "spr_rock")
        super.init(texture: texture,color:SKColor(),size:texture.size())
        self.position = position
        self.xScale = 0.5
        self.yScale = 0.5
        self.zPosition = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
