//
//  GameScene.swift
//  OneTower Defense
//
//  Created by brad huntington on 3/14/16.
//  Copyright (c) 2016 brad huntington + Conner Ferguson. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    var wave = 1
    var audioPlayer = AVAudioPlayer()
    var turretSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("turretSound" , ofType: "wav")!)
    var spawnTime:NSTimeInterval = 0
    var delta: NSTimeInterval = 1/60
    var turretCounter = 1
    var selectedNode = SKNode()
    var selectedUpgrade = SKNode()
    var inputHelper = InputHelper()
    var enemyList:[Enemy] = []
    var bulletList:[Bullet] = []
    var turretNames:[Turret] = []
    var wallNodes: [Wall] = []
   // var bobby: BulletBob?
    var enemyTypes: [Enemy] = []
    let base = SKSpriteNode(imageNamed: "spr_treasure")
    var health = 5
    var lifeLabel = SKLabelNode(fontNamed: "Arial")
    var goldLabel = SKLabelNode(fontNamed: "Arial")
    var gameOver = SKLabelNode(fontNamed: "Arial")
    var lifeMinus = SKLabelNode(fontNamed: "")
    var healthstring = "/5"
    let splash = SKSpriteNode(imageNamed:"spr_Asphalt-Stone-Background")
    let connerSplash = SKSpriteNode(imageNamed:"spr_conner")
    let bradSplash = SKSpriteNode(imageNamed:"spr_brad")
    let titleSplash = SKSpriteNode(imageNamed:"spr_tower")
    let demoSplash = SKSpriteNode(imageNamed:"spr_demo")
    var enemyInt = 0
    var updatesSinceLastSpawn = 0
    var currentEnemy = 0
    var start = false
    var selected = false
    let upSpeed = SKSpriteNode(imageNamed:"upSpeed")
    let upRange = SKSpriteNode(imageNamed:"upRange")
    let upAttack = SKSpriteNode(imageNamed:"upAttack")
    let resetGame = SKSpriteNode(imageNamed:"reset")

    var gold = 100

    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
      
        audioPlayer = try! AVAudioPlayer(contentsOfURL: turretSound, fileTypeHint: "wav")
        
        let background = SKSpriteNode(imageNamed:"spr_Asphalt-Stone-Background")
        background.xScale = 1
        background.yScale = 1
        background.zPosition=0
        background.position = CGPointMake(frame.midX,frame.midY)
        background.name = "backGround"
        
        self.addChild(background)
        
        

//        let bobby = BulletBob(position:CGPointMake((frame.midX*0.875),(frame.midY + 1/2*frame.midY + 1/4*frame.midY )))
//        bobby.xScale = 0.5
//        bobby.yScale = 0.5
//        bobby.zPosition = 3
//        
//        self.addChild(bobby)
//        enemyList.append(bobby)
        
        let turret = Turret(position:CGPointMake((frame.maxX*0.65),(frame.midY + 1/2*frame.midY + 1/4*frame.midY )))
        turret.xScale = 0.5
        turret.yScale = 0.5
        turret.zPosition=2
        turret.name = "mainTurret"
        self.addChild(turret)
        
        upAttack.xScale = 0.75
        upAttack.alpha = 0.5
        upAttack.yScale = 0.75
        upAttack.zPosition=4
        upAttack.name = "upAttack"
        upAttack.position = CGPointMake((frame.maxX*0.65)-20,(frame.midY + 1/2*frame.midY + 1/4*frame.midY-turret.frame.height))
        self.addChild(upAttack)
        
        upSpeed.xScale = 0.75
        upSpeed.yScale = 0.75
        upSpeed.name = "upSpeed"
        upSpeed.alpha = 0.5

        upSpeed.zPosition=4
        upSpeed.position = CGPointMake((frame.maxX*0.65-20),(frame.midY + 1/2*frame.midY + 1/4*frame.midY-(2*turret.frame.height)))
        self.addChild(upSpeed)
        
        upRange.xScale = 0.75
        upRange.yScale = 0.75
        upRange.name = "upRange"
        upRange.alpha = 0.5

        upRange.zPosition=4
        upRange.position = CGPointMake((frame.maxX*0.65-20),(frame.midY + 1/2*frame.midY + 1/4*frame.midY-3*turret.frame.height))
        self.addChild(upRange)
        
        let startButton = SKSpriteNode(imageNamed:"startWave")
        startButton.xScale = 1
        startButton.yScale = 1
        startButton.zPosition=4
        startButton.name = "startWave"
        startButton.position = CGPointMake(frame.midX*0.75,base.position.y+(1/16)*frame.maxY)
        self.addChild(startButton)
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
        base.zPosition = 3
        base.position=(CGPointMake((frame.midX*1.125),wall24.frame.maxY-((1.5)*wall2.frame.size.height)))
        self.addChild(base)
        
        lifeLabel.text = "5/5"
        lifeLabel.fontSize = 20
        lifeLabel.fontColor = UIColor.blackColor()
        lifeLabel.position = base.position
        
        lifeLabel.zPosition=4
        self.addChild(lifeLabel)
        let goldnode = SKSpriteNode(imageNamed: "gold")
        goldnode.xScale = 0.5
        goldnode.zPosition = 3
        goldnode.yScale = 0.25
        goldnode.position = startButton.position
        goldnode.position.y += 35
        self.addChild(goldnode)
        goldLabel.text = "Gold : \(gold)"
        goldLabel.fontSize = 20
        goldLabel.zPosition = 4
        goldLabel.fontColor = UIColor.blackColor()
        goldLabel.position = startButton.position
        goldLabel.position.y += 30
        
        self.addChild(goldLabel)
        
        splash.xScale = 1
        splash.yScale = 1
        splash.zPosition=5
        splash.position = CGPointMake(frame.midX,frame.midY)
        self.addChild(splash)
        bradSplash.xScale = 0.75
        bradSplash.yScale = 0.75
        bradSplash.zPosition=6
        bradSplash.position = CGPointMake(frame.midX,frame.midY+((frame.size.height)*(1/3))+bradSplash.size.height)
        self.addChild(bradSplash)
        connerSplash.xScale = 0.75
        connerSplash.yScale = 0.75
        connerSplash.zPosition=6
        connerSplash.position = CGPointMake(frame.midX,frame.midY+((frame.size.height)*(1/3)-bradSplash.size.height))
        self.addChild(connerSplash)
        titleSplash.xScale = 1
        titleSplash.yScale = 1
        titleSplash.zPosition=6
        titleSplash.position = CGPointMake(frame.midX,frame.midY+((frame.size.height)*(1/3)))
        self.addChild(titleSplash)
        demoSplash.xScale = 1
        demoSplash.yScale = 1
        demoSplash.zPosition=6
        demoSplash.position = CGPointMake(frame.midX,frame.midY)
        self.addChild(demoSplash)
    }
    override func update(currentTime: NSTimeInterval) {
        if splash.hidden{
// loop through turret list and enemy list to see if any are in range of the turrets
        for turret in turretNames{
            for (index, enemy) in enemyList.enumerate(){
                let rise = abs(turret.position.y - enemy.position.y)
                let run = abs(turret.position.x - enemy.position.x)
                let distance = sqrt((rise*rise)+(run*run))
              //  print(distance)
                if distance < turret.range{
                    if let bullet = turret.prepareToShoot(enemy) {
                        bulletList.append(bullet)
                        //print("pew pew pew")
                        bullet.xScale = 0.25
                        bullet.yScale = 0.25
                        bullet.position = turret.position
                        self.addChild(bullet)
                        enemy.maxHealth = enemy.maxHealth - turret.damage
                        if enemy.maxHealth <= 0{
                            
                            gold = gold + enemy.value
                            goldLabel.text = "Gold : \(gold)"
                            
                            
                            //add enemy.score + player score
                            enemyList.removeAtIndex(index)
                            enemyInt = enemyInt - 1
                            currentEnemy = currentEnemy - 1
                            //demo stuff to see functionality
//                            if enemy.name == "enemy9"{
//                                start = false
//                                enemyList.removeAll()
//                                enemyInt = 0
//                                currentEnemy = 0
//                            }
                            enemy.removeFromParent()
                            
                          
                        }
                        break
                }
                }
            }
            
            }
            
           if start == true && enemyList[currentEnemy].name == "enemy9"{
            
            start = false
            wave = wave + 1
//            enemyList.removeAll()
//            enemyInt = 0
//            currentEnemy = 0

            
            }
        if updatesSinceLastSpawn >= 25 && start == true {
            
            //print("current enemy \(currentEnemy)")
            //print("current enemy \(enemyList[currentEnemy])")
            //print("enemy int \(enemyInt)")
            enemyList[currentEnemy].hidden = false
            updatesSinceLastSpawn = 0
            currentEnemy = currentEnemy + 1
            enemyInt = enemyInt + 1
            
        }else{
            updatesSinceLastSpawn = updatesSinceLastSpawn + 1
        }
            
        for (index, enemy) in enemyList.enumerate(){
            if(enemy.hidden == false){
                enemy.updateDelta(currentTime)
                // if enemy intersects base - 1 life
                if base.intersectsNode(enemy){
                    enemyInt = enemyInt - 1
                    currentEnemy = currentEnemy - 1
                    enemyList.removeAtIndex(index)
//                    if enemy.name == "enemy9"{
//                        start = false
//                        enemyList.removeAll()
//                        enemyInt = 0
//                        currentEnemy = 0
//                    }
                    enemy.removeFromParent()
                    health = health - 1
                    lifeLabel.text = String(health)  + "/5"
                    if health <= 0 {
                        gameOver.text = "GAME OVER"
                        gameOver.fontSize = 200
                        gameOver.fontColor = UIColor.blackColor()
                        gameOver.position.x = frame.midX
                        gameOver.position.y = frame.midY
                        gameOver.zPosition = 10
                        gameOver.xScale = 0.25
                        gameOver.yScale = 0.5
                        enemyList.removeAll()
                        self.addChild(gameOver)

//                        resetGame.position = gameOver.position
//                        resetGame.name = "reset"
//                        resetGame.zPosition = 10
//                        resetGame.position.y -= 20
//                        self.addChild(resetGame)
                        start = false
                        
                    }
                }
            }
        }
        }
        for (index, bullet) in bulletList.enumerate(){
            bullet.updateDelta(currentTime)
            bullet.timeToLive -= 1
            if bullet.timeToLive <= 0{
                bullet.removeFromParent()
                print(index)
                print(bulletList)
                bulletList.removeAtIndex(index)
                break
            }
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        splash.hidden = true
        demoSplash.hidden = true
        bradSplash.hidden = true
        connerSplash.hidden = true
        titleSplash.hidden = true
        // if in turret list put upgrade menue 
        let touch = touches.first!
        inputHelper.touchLocation = touch.locationInNode(self)
        inputHelper.nrTouches += touches.count
        inputHelper.hasTapped = true
//        if nodeAtPoint(inputHelper.touchLocation).name == "reset"{
//            execve(didMoveToView(SKView))
//        }
       // print(nodeAtPoint(inputHelper.touchLocation))
        if (nodeAtPoint(inputHelper.touchLocation).name == "startWave" && start == false){
            enemyList.removeAll()
            start = true
            if wave == 1{
            for(var i = 0; i<10;i++){
                let enemySpawn = BulletBob(position: CGPointMake((frame.midX*0.875),frame.maxY))
                enemySpawn.name = "enemy"+String(i)
                //print(enemySpawn.name)
                enemyList.append(enemySpawn)
                enemySpawn.zPosition = 3
                enemySpawn.xScale = 0.5
                enemySpawn.yScale = 0.5
                
                addChild(enemySpawn)
                enemySpawn.hidden = true
                }
            }
            if wave == 2{
                for(var i = 0; i<10;i++){
                    let enemySpawn = MetalMan(position: CGPointMake((frame.midX*0.875),frame.maxY))
                    enemySpawn.name = "enemy"+String(i)
                    //print(enemySpawn.name)
                    enemyList.append(enemySpawn)
                    enemySpawn.zPosition = 3
                    enemySpawn.xScale = 0.5
                    enemySpawn.yScale = 0.5
                    
                    addChild(enemySpawn)
                    enemySpawn.hidden = true
                }
            }
            if wave == 3{
                for(var i = 0; i<10;i++){
                    let enemySpawn = Isis(position: CGPointMake((frame.midX*0.875),frame.maxY))
                    enemySpawn.name = "enemy"+String(i)
                    //print(enemySpawn.name)
                    enemyList.append(enemySpawn)
                    enemySpawn.zPosition = 3
                    enemySpawn.xScale = 0.5
                    enemySpawn.yScale = 0.5
                    
                    addChild(enemySpawn)
                    enemySpawn.hidden = true
                }
            }
            if wave == 4{
                for(var i = 0; i<10;i++){
                    let enemySpawn = Turtle(position: CGPointMake((frame.midX*0.875),frame.maxY))
                    enemySpawn.name = "enemy"+String(i)
                    //print(enemySpawn.name)
                    enemyList.append(enemySpawn)
                    enemySpawn.zPosition = 3
                    enemySpawn.xScale = 0.5
                    enemySpawn.yScale = 0.5
                    
                    addChild(enemySpawn)
                    enemySpawn.hidden = true
                }
            }

            
            
        
        }
        if nodeAtPoint(inputHelper.touchLocation).name == "mainTurret"{
            
            selectedNode = nodeAtPoint(inputHelper.touchLocation)
            
        }
        //parse name of node to check if its a turret
        let s = nodeAtPoint(inputHelper.touchLocation).name

        if s != nil && s!.substringWithRange(Range<String.Index>(start:(s?.startIndex)!,end: (s?.endIndex.advancedBy(-2))!)) == "turret" {
            selected = true
            selectedNode = nodeAtPoint(inputHelper.touchLocation)
            upAttack.alpha = 1
            upSpeed.alpha = 1
            upRange.alpha = 1
            
//            let s = nodeAtPoint(inputHelper.touchLocation).name
//            let r = s?.endIndex.advancedBy(-1)
//            let substring = s![r!]
//            print(substring)
//            if String(substring) == "turret "{
            
            
          
        }
        else{
          //  if nodeAtPoint(inputHelper.touchLocation).name != "mainTurret" {
                
   //         selectedNode = SKNode()
            
       //     }
        }
    
        if nodeAtPoint(inputHelper.touchLocation).name == "upAttack" && selected == true && gold >= 10{
        if selectedNode.name != nil {
        
        let t = selectedNode.name
        let substring = t!.substringWithRange(Range<String.Index>(start:(t?.startIndex.advancedBy(7))!,end: (t?.endIndex)!))
        print("Damage was " + String(turretNames[Int(substring)!-1].damage))
        turretNames[Int(substring)!-1].damage = turretNames[Int(substring)!-1].damage + 5
        print("Damage is now " + String(turretNames[Int(substring)!-1].damage))
        gold = gold - 10
        goldLabel.text = "Gold : \(gold)"

        //print(substring)
        //print(selectedNode)
        //Turret(selectedNode.damage) = 20
//
        selectedNode = SKNode()
        upAttack.alpha = 0.5
        upSpeed.alpha = 0.5
        upRange.alpha = 0.5
        }
        }
        if nodeAtPoint(inputHelper.touchLocation).name == "upSpeed" && selected == true && gold >= 10{
            if selectedNode.name != nil {
                
                let t = selectedNode.name
                let substring = t!.substringWithRange(Range<String.Index>(start:(t?.startIndex.advancedBy(7))!,end: (t?.endIndex)!))
                print("fire rate was  " + String(turretNames[Int(substring)!-1].fireRate))
                turretNames[Int(substring)!-1].fireRate = turretNames[Int(substring)!-1].fireRate - 3
                print("fire rate is now " + String(turretNames[Int(substring)!-1].fireRate))
                gold = gold - 10
                goldLabel.text = "Gold : \(gold)"

                //print(substring)
                //print(selectedNode)
                //Turret(selectedNode.damage) = 20
                //
                selectedNode = SKNode()
                upAttack.alpha = 0.5
                upSpeed.alpha = 0.5
                upRange.alpha = 0.5
            }
        }
        if nodeAtPoint(inputHelper.touchLocation).name == "upRange" && selected == true && gold >= 10{
            if selectedNode.name != nil {
                
                let t = selectedNode.name
                let substring = t!.substringWithRange(Range<String.Index>(start:(t?.startIndex.advancedBy(7))!,end: (t?.endIndex)!))
                print("fire range was  " + String(turretNames[Int(substring)!-1].range))
                turretNames[Int(substring)!-1].range = turretNames[Int(substring)!-1].range + CGFloat(10)
                print("fire range is now  " + String(turretNames[Int(substring)!-1].range))
                gold = gold - 10
                
                goldLabel.text = "Gold : \(gold)"

                //print(substring)
                //print(selectedNode)
                //Turret(selectedNode.damage) = 20
                //
                selectedNode = SKNode()
                upAttack.alpha = 0.5
                upSpeed.alpha = 0.5
                upRange.alpha = 0.5
            }
        }

        
     

        //print(nodeAtPoint(inputHelper.touchLocation).name)
        //print(nodeAtPoint(inputHelper.touchLocation).position)
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if selectedNode.name == "mainTurret"{

        let touch = touches.first!
        
        inputHelper.touchLocation = touch.locationInNode(self)
        if selectedNode.name == "mainTurret"{
            // we may be able to use a boolean here to make it follow the users finger better.
        selectedNode.position = inputHelper.touchLocation
            
        }
        }
 }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for node in wallNodes{
            if node.intersectsNode(selectedNode) && node.hasTurret == false && gold >= 50 {
                selectedNode.position = CGPointMake((frame.maxX*0.65),(frame.midY + 1/2*frame.midY + 1/4*frame.midY ))
                let turret = Turret(position: node.position)
                turret.xScale = 0.25
                turret.yScale = 0.25
                turret.zPosition=2
                turret.name = "turret \(turretCounter)"
                turretNames.append(turret)
                self.addChild(turret)
                audioPlayer.play()
                node.hasTurret = true
                turretCounter += 1
                gold = gold - 50
                goldLabel.text = "Gold : \(gold)"

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

//}


