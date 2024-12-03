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
    case .megaHeader: label.font = .boldSystemFont(ofSize: 24 * scaleMultiplier())
    case .header: label.font = .boldSystemFont(ofSize: 20 * scaleMultiplier())
    case .description: label.font = .systemFont(ofSize: 16 * scaleMultiplier())
    case .subDescription: label.font = .systemFont(ofSize: 14 * scaleMultiplier())
    }
    
    return label
}
