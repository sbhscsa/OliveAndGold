//
//  Extensions.swift
//  OliveAndGold
//
//  Created by Trip Creighton on 12/14/16.
//  Copyright © 2016 com.4myeecc. All rights reserved.
//

import Foundation
import UIKit

/*
    These are some extensions of other classes, ment to simplify code in other classes.
*/

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a/255)
    }
}
