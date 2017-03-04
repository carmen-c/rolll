//
//  Status.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-04.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import Foundation

class Status: NSObject {
    
    var stamina = 100
    
    func staminaCounter () {
        let timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(addStamina), userInfo: nil, repeats: true)
        timer.fire()
        
    }
    
    func addStamina () {
        if stamina < 100 {
        stamina += 1
        } else {
        stamina += 0
        }
    }
    
    func addPoints (points: Int) {
    
    }

}
