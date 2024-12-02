//
//  TextAndColor.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/2/24.
//
import UIKit

enum TextStyle {
    case megaHeader, header, description, subDescription
}
func setupLabel(textStyle: TextStyle, textAlignment: NSTextAlignment = .left) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.textAlignment = textAlignment
    
    switch textStyle {
    case .megaHeader: label.font = .boldSystemFont(ofSize: 24)
    case .header: label.font = .boldSystemFont(ofSize: 20)
    case .description: label.font = .systemFont(ofSize: 16)
    case .subDescription: label.font = .systemFont(ofSize: 14)
    }
    
    return label
}

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
