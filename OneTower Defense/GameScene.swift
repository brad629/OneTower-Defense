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
        let background = SKSpriteNode(imageNamed:"spr_Asphalt-Stone-Background")
        background.xScale = 1
        background.yScale = 1
        background.zPosition=0
        background.position = CGPointMake(frame.midX,frame.midY)
        self.addChild(background)
        
        
        let turret = SKSpriteNode(imageNamed:"spr_cannon_barrel")
        turret.xScale = 0.5
        turret.yScale = 0.5
        turret.zPosition=1
        let blueIcon = SKSpriteNode(imageNamed:"spr_cannon_blue")
        blueIcon.xScale = 0.5
        blueIcon.yScale = 0.5
        blueIcon.zPosition=1
        let ballon = SKSpriteNode(imageNamed:"spr_lives")
        ballon.xScale = 0.5
        ballon.yScale = 0.5
        ballon.zPosition=1
        let bomb = SKSpriteNode(imageNamed:"spr_player_celebrate")
        bomb.xScale = 0.25
        bomb.yScale = 0.25
        bomb.zPosition=1
        let bombRage = SKSpriteNode(imageNamed:"spr_player_die")
        bombRage.xScale = 0.25
        bombRage.yScale = 0.25
        bombRage.zPosition=1
        let wall = SKSpriteNode(imageNamed:"spr_rock")
        wall.xScale = 0.25
        wall.yScale = 0.25
        wall.zPosition=1
        self.addChild(wall)
        let rocket = SKSpriteNode(imageNamed:"spr_rocket")
        rocket.xScale = 0.25
        rocket.yScale = 0.25
        rocket.zPosition=1
        let metalRage = SKSpriteNode(imageNamed:"spr_sparky_electrocute")
        metalRage.xScale = 0.25
        metalRage.yScale = 0.25
        metalRage.zPosition=1
        let metal = SKSpriteNode(imageNamed:"spr_sparky_idle")
        metal.xScale = 0.25
        metal.yScale = 0.25
        metal.zPosition=1
        let base = SKSpriteNode(imageNamed:"spr_treasure")
        base.xScale = 0.25
        base.yScale = 0.25
        base.zPosition=1
        let turtle = SKSpriteNode(imageNamed:"spr_turtle_spikes")
        turtle.xScale = 0.25
        turtle.yScale = 0.25
        turtle.zPosition=1
        let turtleRage = SKSpriteNode(imageNamed:"spr_turtle_sneeze")
        turtleRage.xScale = 0.25
        turtleRage.yScale = 0.25
        turtleRage.zPosition=1
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
