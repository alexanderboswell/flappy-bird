//
//  GameScene.swift
//  Flappy Bird
//
//  Created by alexander boswell on 9/20/16.
//  Copyright © 2016 alexander boswell. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var bird = SKSpriteNode()
    
    var bg = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        let bgTexture = SKTexture(imageNamed: "bg.png")
        
        let moveBGAnimation = SKAction.move(by: CGVector(dx:-bgTexture.size().width, dy: 0), duration: 5)
        
        let shiftBGAnimation = SKAction.move(by: CGVector(dx: bgTexture.size().width,dy:0), duration: 0)
        
        let moveBackground = SKAction.repeatForever(SKAction.sequence([moveBGAnimation,shiftBGAnimation]))
        
        var i: CGFloat = 0
        while(i<3){
            
        
        bg = SKSpriteNode(texture: bgTexture)
        
        bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i, y: self.frame.midY)
        
        bg.size.height = self.frame.height
        
        bg.run(moveBackground)
        
        self.addChild(bg)
         
            i+=1
        }
        
      
        
        let birdTexture = SKTexture(imageNamed: "flappy1.png")
        
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        
        let animation = SKAction.animate(with: [birdTexture,birdTexture2], timePerFrame: 0.1)
        
        let makeBirdFlap = SKAction.repeatForever(animation)
        
        bird = SKSpriteNode(texture: birdTexture)
        
        bird.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        bird.run(makeBirdFlap)
        
        self.addChild(bird)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        
        }
    

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
