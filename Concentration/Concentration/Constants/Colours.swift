//
//  Colours.swift
//  Concentration
//
//  Created by JUSTIN GOH on 30/11/19.
//  Copyright © 2019 Radium Laboratories. All rights reserved.
//

import UIKit

class Colours: NSObject {
    static let cardBack = UIColor(r: 237, g: 106, b: 90, a: 1)
    static let cardFront = UIColor(r: 230, g: 235, b: 224, a: 1)
    static let background = UIColor(r: 93, g: 87, b: 107, a: 1)
    static let primary = UIColor(r: 155, g: 193, b: 188, a: 1)
    static let secondary = UIColor(r: 244, g: 241, b: 187, a: 1)
}

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}
