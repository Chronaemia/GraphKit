//
//  Point.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/22/20.
//

import Foundation
import SwiftUI

public struct Point : Hashable {
    var weight : CGFloat
    var location : CGPoint
    
    init( x: CGFloat, y: CGFloat, weight : CGFloat = 0.5 ){
        self.location = CGPoint(x: x, y: y)
        self.weight = weight
    }
    
    init(point: CGPoint) {
        self.init(x: point.x, y: point.y)
    }
    
    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.location.x == rhs.location.x && lhs.location.y == rhs.location.y
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(location.x)
        hasher.combine(location.y)
    }
    
}
