//
//  GameScene.swift
//  Flappy_bird
//
//  Created by Yeswanth varma Kanumuri on 1/16/16.
//  Copyright (c) 2016 Yeswanth varma Kanumuri. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    
    var bg = SKSpriteNode()
    
    var bird = SKSpriteNode()
    
    var pipe1 = SKSpriteNode()
    
    var pipe2 = SKSpriteNode()
    
    
    override func didMoveToView(view: SKView) {
        
        
        let bgTexture = SKTexture(imageNamed: "bg.png")
        
       
        
        let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        
        let replaceBg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        
        let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg,replaceBg]))
        
        
        
        
        
        for var i:CGFloat = 0 ; i < 3 ;i++ {
        
            bg = SKSpriteNode(texture: bgTexture)
            
            bg.position = CGPoint(x: bgTexture.size().width / 2 + bgTexture.size().width * i, y: CGRectGetMidY(self.frame))
            
            bg.size.height = self.frame.height
            bg.runAction(movebgForever)
            
            self.addChild(bg)
        
        
        }


        
        let birdTexture = SKTexture(imageNamed: "flappy1.png")
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        
        let animation = SKAction.animateWithTextures([birdTexture , birdTexture2], timePerFrame: 0.1)
        
        let makeBirdFlap = SKAction.repeatActionForever(animation)
        
        bird = SKSpriteNode(texture: birdTexture)
        
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        bird.runAction(makeBirdFlap)
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 2)
        bird.physicsBody?.dynamic = false
        
        self.addChild(bird)
        
        
        var ground  = SKNode()
        
        ground.position = CGPoint(x: 0, y: 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        ground.physicsBody?.dynamic = false
        self.addChild(ground)
        
        let gapHeight = birdTexture.size().height * 4
        
        let movementAmount = arc4random() % UInt32(frame.size.height / 2)
        
        let pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        
        let movePipes = SKAction.moveByX(-self.frame.size.width * 2, y: 0, duration: NSTimeInterval(self.frame.size.width / 100))
        
        
        
        var pipeTexture = SKTexture(imageNamed: "pipe1.png")
        
        var pipe1 = SKSpriteNode(texture: pipeTexture)
        
        pipe1.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) + pipeTexture.size().height / 2 + gapHeight / 2 + pipeOffset)
        
      
        
        self.addChild(pipe1)
        
        
        var pipe2Texture = SKTexture(imageNamed: "pipe2.png")
        
        var pipe2 = SKSpriteNode(texture: pipe2Texture)
        
        pipe2.position = CGPoint(x:CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - pipe2Texture.size().height / 2 - gapHeight / 2 + pipeOffset)
        
       
        
        self.addChild(pipe2)

        
        
        
           }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        bird.physicsBody?.dynamic = true
        
        bird.physicsBody?.velocity = CGVectorMake(0, 0)
        bird.physicsBody?.applyImpulse(CGVectorMake(0, 50))
        
        
       
        }
    
   
    override func update(currentTime: CFTimeInterval) {
        
        
            }
}
