//
//  SizesFramework.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/3/24.
//

import UIKit

func scaleMultiplier() -> CGFloat {
    let deviceModel = UIDevice.current.userInterfaceIdiom
    let screenHeight = UIScreen.main.bounds.height
    
    let scaleFactor: CGFloat
    switch deviceModel {
    case .phone:
        //  iPhone
        if screenHeight < 568 {
            // iPhone SE (1-го поколения) или меньше
            scaleFactor = 0.85
        } else if screenHeight <= 667 {
            // iPhone 6, 7, 8
            scaleFactor = 1.0
        } else if screenHeight <= 736 {
            // iPhone 6+, 7+, 8+
            scaleFactor = 1.1
        } else if screenHeight <= 812 {
            // iPhone X, XS, 11 Pro
            scaleFactor = 1.15
        } else if screenHeight <= 896 {
            // iPhone XR, XS Max, 11, 11 Pro Max
            scaleFactor = 1.2
        } else {
            // Новые модели (например, iPhone 12 и новее)
            scaleFactor = 1.25
        }
    case .pad:
        // Настройка под iPad
        scaleFactor = 1.5
    default:
        // Устройства с неизвестным размером
        scaleFactor = 1.0
    }
    return scaleFactor
}
