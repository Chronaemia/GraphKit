//
//  BarGraphStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

public struct BarGraphStyle<T : ShapeStyle, U : ShapeStyle> : GraphStyle {
    
    typealias StrokeStyle = T
    typealias FillStyle = U
    
    public var strokeColor : T = Color.white as! T
    public var fillColor : U = Color.red as! U
    public var spacing : Double = 5
    public var appearance : Appearance = .light
    public var strokeWidth: CGFloat = 4
}
