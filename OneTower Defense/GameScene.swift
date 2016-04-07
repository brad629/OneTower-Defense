//
//  GameScene.swift
//  OneTower Defense
//
//  Created by brad huntington on 3/14/16.
//  Copyright (c) 2016 brad huntington + Conner Ferguson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let sprite = SKSpriteNode(imageNamed:"spr_Asphalt-Stone-Background")
        sprite.xScale = 1
        sprite.yScale = 1
        sprite.zPosition=0
        sprite.position = CGPointMake(frame.midX,frame.midY)
        self.addChild(sprite)
        let sprite2 = SKSpriteNode(imageNamed:"spr_cannon_barrel")
        sprite2.xScale = 0.5
        sprite2.yScale = 0.5
        sprite2.zPosition=1
        sprite2.position = CGPointMake(frame.midX*1.25,frame.midY)
        self.addChild(sprite2)
        let sprite3 = SKSpriteNode(imageNamed:"spr_cannon_blue")
        sprite3.xScale = 0.5
        sprite3.yScale = 0.5
        sprite3.zPosition=1
        sprite3.position = CGPointMake(frame.midX,frame.midY*1.25)
        self.addChild(sprite3)
        let sprite4 = SKSpriteNode(imageNamed:"spr_lives")
        sprite4.xScale = 0.5
        sprite4.yScale = 0.5
        sprite4.zPosition=1
        sprite4.position = CGPointMake(frame.midX*0.75,frame.midY)
        self.addChild(sprite4)
        let sprite5 = SKSpriteNode(imageNamed:"spr_player_celebrate")
        sprite5.xScale = 0.25
        sprite5.yScale = 0.25
        sprite5.zPosition=1
        sprite5.position = CGPointMake(frame.midX,frame.midY*0.75)
        self.addChild(sprite5)
        let sprite6 = SKSpriteNode(imageNamed:"spr_player_die")
        sprite6.xScale = 0.25
        sprite6.yScale = 0.25
        sprite6.zPosition=1
        sprite6.position = CGPointMake(frame.midX*0.75,frame.midY*0.75)
        self.addChild(sprite6)
        let sprite7 = SKSpriteNode(imageNamed:"spr_rock")
        sprite7.xScale = 0.25
        sprite7.yScale = 0.25
        sprite7.zPosition=1
        sprite7.position = CGPointMake(frame.midX*1.25,frame.midY*1.25)
        self.addChild(sprite7)
        let sprite8 = SKSpriteNode(imageNamed:"spr_rocket")
        sprite8.xScale = 0.25
        sprite8.yScale = 0.25
        sprite8.zPosition=1
        sprite8.position = CGPointMake(frame.midX*0.75,frame.midY*1.25)
        self.addChild(sprite8)
        let sprite9 = SKSpriteNode(imageNamed:"spr_sparky_electrocute")
        sprite9.xScale = 0.25
        sprite9.yScale = 0.25
        sprite9.zPosition=1
        sprite9.position = CGPointMake(frame.midX*1.25,frame.midY*0.75)
        self.addChild(sprite9)
        let sprite10 = SKSpriteNode(imageNamed:"spr_sparky_idle")
        sprite10.xScale = 0.25
        sprite10.yScale = 0.25
        sprite10.zPosition=1
        sprite10.position = CGPointMake(frame.midX,frame.midY)
        self.addChild(sprite10)
        let sprite11 = SKSpriteNode(imageNamed:"spr_treasure")
        sprite11.xScale = 0.25
        sprite11.yScale = 0.25
        sprite11.zPosition=1
        sprite11.position = CGPointMake(frame.midX,frame.midY*1.4)
        self.addChild(sprite11)
        let sprite12 = SKSpriteNode(imageNamed:"spr_turtle_spikes")
        sprite12.xScale = 0.25
        sprite12.yScale = 0.25
        sprite12.zPosition=1
        sprite12.position = CGPointMake(frame.midX*1.25,frame.midY*1.4)
        self.addChild(sprite12)
        let sprite13 = SKSpriteNode(imageNamed:"spr_turtle_sneeze")
        sprite13.xScale = 0.25
        sprite13.yScale = 0.25
        sprite13.zPosition=1
        sprite13.position = CGPointMake(frame.midX*0.75,frame.midY*1.4)
        self.addChild(sprite13)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
//        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
