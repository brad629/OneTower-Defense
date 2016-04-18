//
//  GameScene.swift
//  OneTower Defense
//
//  Created by brad huntington on 3/14/16.
//  Copyright (c) 2016 brad huntington + Conner Ferguson. All rights reserved.
//

import SpriteKit
class GameScene: SKScene {
    var delta: NSTimeInterval = 1/60

    var turretCounter = 1
    var selectedNode = SKNode()
    var inputHelper = InputHelper()
    var nodeNames:[String] = []
    var turretName = "turret"
    var wallNodes: [Wall] = []
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let background = SKSpriteNode(imageNamed:"spr_Asphalt-Stone-Background")
        background.xScale = 1
        background.yScale = 1
        background.zPosition=0
        background.position = CGPointMake(frame.midX,frame.midY)
        self.addChild(background)
        let bobby = BulletBob(position:CGPointMake((frame.midX*0.875),(frame.midY + 1/2*frame.midY + 1/4*frame.midY )))
        bobby.xScale = 0.5
        bobby.yScale = 0.5
        bobby.zPosition = 3
        self.addChild(bobby)
        
        let turret = Turret(position:CGPointMake((frame.maxX*0.65),(frame.midY + 1/2*frame.midY + 1/4*frame.midY )))
        turret.xScale = 0.5
        turret.yScale = 0.5
        turret.zPosition=2
        turret.name = "turret"
        nodeNames.append("turret")
        self.addChild(turret)
        
        let label = SKLabelNode(text: "hello")
        label.position = CGPointMake((frame.maxX*0.65),(frame.maxY)-((1/2)*turret.frame.size.height)-label.frame.size.height)

        // build map
        //top right wall
        let wallBase = SKSpriteNode(imageNamed:"spr_rock")
        wallBase.xScale = 0.5
        wallBase.yScale = 0.5
        
        let wall = Wall(position: CGPointMake(frame.midX,(frame.maxY)-((1/2)*wallBase.frame.size.height)))
        
        self.addChild(wall)
        wallNodes.append(wall)
        
        //left collumn 1
        let wall2 = Wall(position: CGPointMake(frame.midX*0.75,(frame.maxY)-((1/2)*wallBase.frame.size.height)))
        self.addChild(wall2)
        wallNodes.append(wall2)
        
        let wall3 = Wall(position: CGPointMake((frame.midX*0.75),wall2.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall3)
        wallNodes.append(wall3)
        
        let wall4 = Wall(position: CGPointMake((frame.midX*0.75),wall3.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall4)
        wallNodes.append(wall4)
        
        let wall5 = Wall(position: CGPointMake((frame.midX*0.75),wall4.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall5)
        wallNodes.append(wall5)
        
        let wall6 = Wall(position: CGPointMake((frame.midX*0.75),wall5.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall6)
        wallNodes.append(wall6)
        
        let wall7 = Wall(position: CGPointMake((frame.midX*0.75),wall6.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall7)
        wallNodes.append(wall7)
        
        let wall8 = Wall(position: CGPointMake((frame.midX*0.75),wall7.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall8)
        wallNodes.append(wall8)
        
        //right collumn one
        let wall9 = Wall(position: CGPointMake((frame.midX),wall2.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall9)
        wallNodes.append(wall9)
        
        let wall10 = Wall(position: CGPointMake((frame.midX),wall3.frame.maxY-((1.5)*wall2.frame.size.height)))
        wallNodes.append(wall10)
        self.addChild(wall10)
        
        
        let wall11 = Wall(position: CGPointMake((frame.midX),wall4.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall11)
        wallNodes.append(wall11)
        
        let wall12 = Wall(position: CGPointMake((frame.midX),wall5.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall12)
        wallNodes.append(wall2)
        
        //turn right
        let wall13 = Wall(position: CGPointMake((frame.midX*1.25),wall6.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall13)
        wallNodes.append(wall13)
        
        let wall14 = Wall(position: CGPointMake((frame.midX),wall7.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall14)
        wallNodes.append(wall14)
        
        //wall inbetween the top left collumn and bottom left collumn
        let wall15 = Wall(position: CGPointMake((frame.midX*0.875),wall7.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall15)
        wallNodes.append(wall15)
        
        //bottom right collumn
        let wall16 = Wall(position: CGPointMake((frame.midX*1.25),wall5.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall16)
        wallNodes.append(wall16)
        
        //block between right collumns
        let wall17 = Wall(position: CGPointMake((frame.midX*1.125),wall5.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall17)
        wallNodes.append(wall17)
        
        let wall18 =  Wall(position: CGPointMake((frame.midX*1.25),wall7.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall18)
        wallNodes.append(wall18)
        
        let wall19 =  Wall(position: CGPointMake((frame.midX*1.25),wall7.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall19)
        wallNodes.append(wall19)
        
        let wall20 = Wall(position: CGPointMake((frame.midX*1.25),wall19.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall20)
        wallNodes.append(wall20)
        
        let wall21 = Wall(position: CGPointMake((frame.midX*1.25),wall20.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall21)
        wallNodes.append(wall21)
        
        let wall22 =  Wall(position: CGPointMake((frame.midX*1.25),wall21.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall22)
        wallNodes.append(wall22)
        //end of bottom right collumn
        
        //start bottom left collumn
        let wall23 = Wall(position: CGPointMake((frame.midX),wall19.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall23)
        wallNodes.append(wall23)
        
        let wall24 = Wall(position: CGPointMake((frame.midX),wall23.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall24)
            wallNodes.append(wall24)
        
        let wall25 =  Wall(position: CGPointMake((frame.midX),wall24.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(wall25)
        wallNodes.append(wall25)
        
        
    }
    override func update(currentTime: NSTimeInterval) {
        bobby.updateDelta(delta)
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        inputHelper.touchLocation = touch.locationInNode(self)
        inputHelper.nrTouches += touches.count
        inputHelper.hasTapped = true
        print(nodeAtPoint(inputHelper.touchLocation))
        if nodeAtPoint(inputHelper.touchLocation).name == "turret"{
            
            selectedNode = nodeAtPoint(inputHelper.touchLocation)
        }
        //print(nodeAtPoint(inputHelper.touchLocation).name)
        //print(nodeAtPoint(inputHelper.touchLocation).position)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if selectedNode.name == "turret"{

        let touch = touches.first!
        
        inputHelper.touchLocation = touch.locationInNode(self)
        if selectedNode.name == "turret"{
            // we may be able to use a boolean here to make it follow the users finger better.
        selectedNode.position = inputHelper.touchLocation
            
        }
        }
 }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for node in wallNodes{
            if node.intersectsNode(selectedNode) && node.hasTurret == false{
                selectedNode.position = CGPointMake((frame.maxX*0.65),(frame.midY + 1/2*frame.midY + 1/4*frame.midY ))
                let turret = Turret(position: node.position)
                turret.xScale = 0.25
                turret.yScale = 0.25
                turret.zPosition=2
                turret.name = "turret \(turretCounter)"
                nodeNames.append("turret\(turretCounter)")
                self.addChild(turret)
                node.hasTurret = true
                turretCounter += 1
            }
            else{
                
            }
            
           // print(nodeAtPoint(inputHelper.touchLocation).position)
           // print(node.position)
           // if node.box.interse{
          //      print("intersecting")
//                let turret = SKSpriteNode(imageNamed:"spr_cannon_barrel")
//                turret.xScale = 0.25
//                turret.yScale = 0.25
//                turret.zPosition=3
//                print(turret.name! + String(turretCounter))
//                //turret.name = turret.name! + String(turretCounter)
//                //nodeNames.append("turret")
//                turret.position = node.position
//                self.addChild(turret)
//                turretCounter += 1

            }
        
        
        }
    }



}
//}


