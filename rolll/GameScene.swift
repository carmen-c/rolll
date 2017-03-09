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

class GameScene: SKScene {
    
    //MARK: - Properties -
    var motionManager = CMMotionManager()
    var lastTouchPosition: CGPoint?
    
    
    
    
    //MARK: - MoveTo -
    override func didMove(to view: SKView) {
        
//        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
//        borderBody.friction = 0
//        self.physicsBody = borderBody
        
        motionManager.startAccelerometerUpdates()
        
        if let accelData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelData.acceleration.y * -50, dy: accelData.acceleration.x * 50)
        }
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
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
            print("node is not in the scene")
        }

    }
    
    
}
