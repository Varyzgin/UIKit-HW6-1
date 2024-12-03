//
//  ColorScheme.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/3/24.
//

import UIKit

enum colorScheme {
    case white, green, gray, black
}

func Colorizer(_ color: colorScheme) -> UIColor {
    switch color {
    case .black: return .black
    case .white: return .white
    case .green: return UIColor(red: 37/255, green: 169/255, blue: 82/255, alpha: 1)
    case .gray: return UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
    }
}
