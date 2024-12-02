//
//  SubViews.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/2/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views : UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
