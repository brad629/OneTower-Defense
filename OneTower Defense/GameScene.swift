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
        turret.zPosition=2
        turret.position = CGPointMake((frame.maxX*0.65),(frame.maxY)-((1/2)*turret.frame.size.height))
        self.addChild(turret)
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
        // build map
        //top right wall
        let wall = SKSpriteNode(imageNamed:"spr_rock")
        wall.xScale = 0.5
        wall.yScale = 0.5
        wall.zPosition=1
        wall.position = CGPointMake(frame.midX,(frame.maxY)-((1/2)*wall.frame.size.height))
        self.addChild(wall)
        //left collumn 1
        let wall2 = SKSpriteNode(imageNamed:"spr_rock")
        wall2.xScale = 0.5
        wall2.yScale = 0.5
        wall2.zPosition=1
        wall2.position = CGPointMake(frame.midX*0.75,(frame.maxY)-((1/2)*wall2.frame.size.height))
        self.addChild(wall2)
        
        let wall3 = SKSpriteNode(imageNamed:"spr_rock")
        wall3.xScale = 0.5
        wall3.yScale = 0.5
        wall3.zPosition=1
        wall3.position = CGPointMake((frame.midX*0.75),wall2.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall3)
        let wall4 = SKSpriteNode(imageNamed:"spr_rock")
        wall4.xScale = 0.5
        wall4.yScale = 0.5
        wall4.zPosition=1
        wall4.position = CGPointMake((frame.midX*0.75),wall3.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall4)
        let wall5 = SKSpriteNode(imageNamed:"spr_rock")
        wall5.xScale = 0.5
        wall5.yScale = 0.5
        wall5.zPosition=1
        wall5.position = CGPointMake((frame.midX*0.75),wall4.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall5)
        let wall6 = SKSpriteNode(imageNamed:"spr_rock")
        wall6.xScale = 0.5
        wall6.yScale = 0.5
        wall6.zPosition=1
        wall6.position = CGPointMake((frame.midX*0.75),wall5.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall6)
        let wall7 = SKSpriteNode(imageNamed:"spr_rock")
        wall7.xScale = 0.5
        wall7.yScale = 0.5
        wall7.zPosition=1
        wall7.position = CGPointMake((frame.midX*0.75),wall6.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall7)
        let wall8 = SKSpriteNode(imageNamed:"spr_rock")
        wall8.xScale = 0.5
        wall8.yScale = 0.5
        wall8.zPosition=1
        wall8.position = CGPointMake((frame.midX*0.75),wall7.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall8)
        //right collumn one
        let wall9 = SKSpriteNode(imageNamed:"spr_rock")
        wall9.xScale = 0.5
        wall9.yScale = 0.5
        wall9.zPosition=1
        wall9.position = CGPointMake((frame.midX),wall2.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall9)
        let wall10 = SKSpriteNode(imageNamed:"spr_rock")
        wall10.xScale = 0.5
        wall10.yScale = 0.5
        wall10.zPosition=1
        wall10.position = CGPointMake((frame.midX),wall3.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall10)
        let wall11 = SKSpriteNode(imageNamed:"spr_rock")
        wall11.xScale = 0.5
        wall11.yScale = 0.5
        wall11.zPosition=1
        wall11.position = CGPointMake((frame.midX),wall4.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall11)
        let wall12 = SKSpriteNode(imageNamed:"spr_rock")
        wall12.xScale = 0.5
        wall12.yScale = 0.5
        wall12.zPosition=1
        wall12.position = CGPointMake((frame.midX),wall5.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall12)
        let wall13 = SKSpriteNode(imageNamed:"spr_rock")
        wall13.xScale = 0.5
        wall13.yScale = 0.5
        wall13.zPosition=1
        //turn right
        wall13.position = CGPointMake((frame.midX*1.25),wall6.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall13)
        let wall14 = SKSpriteNode(imageNamed:"spr_rock")
        wall14.xScale = 0.5
        wall14.yScale = 0.5
        wall14.zPosition=1
        wall14.position = CGPointMake((frame.midX),wall7.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall14)
        
        //wall inbetween the top left collumn and bottom left collumn
        let wall15 = SKSpriteNode(imageNamed:"spr_rock")
        wall15.xScale = 0.5
        wall15.yScale = 0.5
        wall15.zPosition=1
        wall15.position = CGPointMake((frame.midX*0.875),wall7.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall15)
        //bottom right collumn
        let wall16 = SKSpriteNode(imageNamed:"spr_rock")
        wall16.xScale = 0.5
        wall16.yScale = 0.5
        wall16.zPosition=1
        wall16.position = CGPointMake((frame.midX*1.25),wall5.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall16)
        //block between right collumns
        let wall17 = SKSpriteNode(imageNamed:"spr_rock")
        wall17.xScale = 0.5
        wall17.yScale = 0.5
        wall17.zPosition=1
        wall17.position = CGPointMake((frame.midX*1.125),wall5.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall17)
        let wall18 = SKSpriteNode(imageNamed:"spr_rock")
        wall18.xScale = 0.5
        wall18.yScale = 0.5
        wall18.zPosition=1
        wall18.position = CGPointMake((frame.midX*1.25),wall7.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall18)
        let wall19 = SKSpriteNode(imageNamed:"spr_rock")
        wall19.xScale = 0.5
        wall19.yScale = 0.5
        wall19.zPosition=1
        wall19.position = CGPointMake((frame.midX*1.25),wall7.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall19)
        let wall20 = SKSpriteNode(imageNamed:"spr_rock")
        wall20.xScale = 0.5
        wall20.yScale = 0.5
        wall20.zPosition=1
        wall20.position = CGPointMake((frame.midX*1.25),wall19.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall20)
        let wall21 = SKSpriteNode(imageNamed:"spr_rock")
        wall21.xScale = 0.5
        wall21.yScale = 0.5
        wall21.zPosition=1
        wall21.position = CGPointMake((frame.midX*1.25),wall20.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall21)
        let wall22 = SKSpriteNode(imageNamed:"spr_rock")
        wall22.xScale = 0.5
        wall22.yScale = 0.5
        wall22.zPosition=1
        wall22.position = CGPointMake((frame.midX*1.25),wall21.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall22)
        //end of bottom right collumn
        //start bottom left collumn
        let wall23 = SKSpriteNode(imageNamed:"spr_rock")
        wall23.xScale = 0.5
        wall23.yScale = 0.5
        wall23.zPosition=1
        wall23.position = CGPointMake((frame.midX),wall19.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall23)
        let wall24 = SKSpriteNode(imageNamed:"spr_rock")
        wall24.xScale = 0.5
        wall24.yScale = 0.5
        wall24.zPosition=1
        wall24.position = CGPointMake((frame.midX),wall23.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall24)
        let wall25 = SKSpriteNode(imageNamed:"spr_rock")
        wall25.xScale = 0.5
        wall25.yScale = 0.5
        wall25.zPosition=1
        wall25.position = CGPointMake((frame.midX),wall24.frame.maxY-((1.5)*wall2.frame.size.height))
        self.addChild(wall25)
        
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
 
       for touch in touches {
            let location = touch.locationInNode(self)
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
       }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
