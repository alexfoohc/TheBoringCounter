//
//  UIButton+Extension.swift
//  COVID-19 Counter
//
//  Created by Alejandro Hernandez on 26/08/24.
//

import UIKit

extension UIButton {
    
    func pulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 1.0
        pulse.toValue = 0.97
        pulse.autoreverses = false
//        pulse.repeatCount = 1
        pulse.initialVelocity = 0.8
        pulse.damping = 5.0
        
        layer.add(pulse, forKey: "pulse")
    }
}
