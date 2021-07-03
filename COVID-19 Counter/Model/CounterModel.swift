//
//  CounterModel.swift
//  COVID-19 Counter
//
//  Created by Alejandro Hernández Cortés on 09/06/21.
//

import Foundation
import UIKit

class CounterLogic {
    
    var totalCapacity: Double = 0
    var currentCapacity: Double = 0
    var currentColor: UIColor!
    
    func getTotalCapacity(capacity: Double) {
        totalCapacity = capacity
        currentCapacity = 0
        print(totalCapacity)
        print(totalCapacity * 0.25)
    }
    
    func incrementCounter() -> (currentCapacity: Double, backgroundInfo: (color: UIColor, message: String)) {
        if currentCapacity >= 0 && currentCapacity < totalCapacity {
            currentCapacity += 1
        }
        return(currentCapacity, backgroundColor())
     
    }
    
    func decrementCounter() -> (currentCapacity: Double, backGroundInfo: (color: UIColor, message: String)) {
        if currentCapacity > 0 {
            currentCapacity -= 1
        }
        return(currentCapacity, backgroundColor())
    }
    
    func backgroundColor() -> (color: UIColor, message: String) {
        if currentCapacity < (totalCapacity * 0.5) {
            return (greenColor, NSLocalizedString("below50", comment: ""))
        } else if currentCapacity >= (totalCapacity * 0.50) && currentCapacity < (totalCapacity * 0.75) {
            return (yellowColor, NSLocalizedString("above50", comment: ""))
        } else {
            return (redColor, NSLocalizedString("above75", comment: ""))
        }
    }
    
    func checkCapacityLimit() -> Bool {
        if totalCapacity == 0 {
            return true
        } else
        {
            return false
        }
    }
    
    
    
    
    
    
}
