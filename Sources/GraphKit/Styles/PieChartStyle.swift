//
//  PieChartStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

struct PieChartStyle<T : ShapeStyle, U : ShapeStyle> : GraphStyle {
    
    typealias StrokeStyle = T
    typealias FillStyle = U
    
    public var strokeColor : T = Color.clear as! T
    public var fillColor : U = Color.red as! U
    public var strokeWidth : CGFloat = 5.0
    
    var appearance: Appearance = .light
}
