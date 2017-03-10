//
//  GameScene.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-07.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import Foundation
import SpriteKit
import CoreMotion
import GameplayKit



class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //MARK: - Properties -
    var motionManager = CMMotionManager()
    var lastTouchPosition: CGPoint?
    
    
    
    //MARK: - Game -
    override func didMove(to view: SKView) {
        
//        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//        borderBody.friction = 0
//        self.physicsBody = borderBody
        
        motionManager.startAccelerometerUpdates()
        
        if let accelData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelData.acceleration.y * -50, dy: accelData.acceleration.x * 50)
        }
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
        createEnemies()
        
    }
    
    func gameOver() {
        
    }
    
    
    
    //MARK: - Enemies -
    
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    func randomPointBetween(start:CGPoint, end:CGPoint)->CGPoint{
        
        return CGPoint(x: randomBetweenNumbers(firstNum: start.x, secondNum: end.x), y: randomBetweenNumbers(firstNum: start.y, secondNum: end.y))
        
    }
    
    func createEnemies(){
        
        //Randomize spawning time.
        let wait = SKAction.wait(forDuration: 0.5, withRange: 0.2)
        
        weak var weakSelf = self //Use weakSelf to break a possible strong reference cycle
        
        let spawn = SKAction.run({
            
            let random = arc4random() % 4 + 1
            var position = CGPoint()
            var moveTo = CGPoint()
            
            switch random {
                
            //Top
            case 1:
                position = weakSelf!.randomPointBetween(start: CGPoint(x: 0, y: weakSelf!.frame.size.height), end: CGPoint(x: weakSelf!.frame.size.width, y: weakSelf!.frame.size.height))

                moveTo = weakSelf!.randomPointBetween(start: CGPoint(x: 0, y: 0), end: CGPoint(x:weakSelf!.frame.size.width, y:0))
                break
                
            //Bottom
            case 2:
                position = weakSelf!.randomPointBetween(start: CGPoint(x: 0, y: 0), end: CGPoint(x: weakSelf!.frame.size.width, y: 0))
                
                moveTo = weakSelf!.randomPointBetween(start: CGPoint(x: 0, y: weakSelf!.frame.size.height), end: CGPoint(x: weakSelf!.frame.size.width, y: weakSelf!.frame.size.height))
                break
                
            //Left
            case 3:
                position = weakSelf!.randomPointBetween(start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: weakSelf!.frame.size.height))
                
                moveTo = weakSelf!.randomPointBetween(start: CGPoint(x: weakSelf!.frame.size.width, y: 0), end: CGPoint(x: weakSelf!.frame.size.width, y: weakSelf!.frame.size.height))
                break
                
            //Right
            case 4:
                position = weakSelf!.randomPointBetween(start: CGPoint(x: weakSelf!.frame.size.width, y: 0), end: CGPoint(x: weakSelf!.frame.size.width, y: weakSelf!.frame.size.height))
                
                moveTo = weakSelf!.randomPointBetween(start: CGPoint(x: 0, y: 0), end: CGPoint(x: 0, y: weakSelf!.frame.size.height))
                break
                
            default:
                break
                
            }

            weakSelf!.spawnEnemyAtPosition(position: position, moveTo: moveTo)
            
        })
        
        let spawning = SKAction.sequence([wait,spawn])
        self.run(SKAction.repeatForever(spawning), withKey:"spawning")
    
    }
    
    func spawnEnemyAtPosition(position:CGPoint, moveTo:CGPoint){
        
        let enemy = SKSpriteNode(color: SKColor.brown, size: CGSize(width: 40, height: 40))
        
        enemy.position = position
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody?.affectedByGravity = false
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.collisionBitMask = 0
        
        //Here you can randomize the value of duration parameter to change the speed of a node
        let move = SKAction.move(to: moveTo,duration: 2.5)
        let remove = SKAction.removeFromParent()
        enemy.run(SKAction.sequence([move, remove]))
        
        self.addChild(enemy)
        
    }
    

    
    
    //MARK: - Touches -
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            lastTouchPosition = location
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            lastTouchPosition = location
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPosition = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPosition = nil
    }
    
    
    
    
    //MARK: - Accelerometer -
    
    override func update(_ currentTime: TimeInterval) {
        
        let player = childNode(withName: "player") as! SKSpriteNode
        
        #if (arch(i386) || arch(x86_64))
            if let currentTouch = lastTouchPosition {
                let diff = CGPoint(x: currentTouch.x - player.position.x, y: currentTouch.y - player.position.y)
                physicsWorld.gravity = CGVector(dx: diff.x / 100, dy: diff.y / 100)
        }
        #else
            if let accelData = motionManager.accelerometerData {
                physicsWorld.gravity = CGVector(dx: accelData.acceleration.y * -50, dy: accelData.acceleration.x * 50)
        }
        #endif
        
        if (!intersects(player)) {
            print("player is not in the scene, GAMEOVER")
            
            if(self.action(forKey: "spawning") != nil){
                self.removeAction(forKey: "spawning")
            }
        }

    }
    
    
}
