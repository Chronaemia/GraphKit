//
//  PieChartStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

public struct PieChartStyle<T : ShapeStyle, U : ShapeStyle> : GraphStyle {
    
    typealias StrokeStyle = T
    typealias FillStyle = U
    
    public var strokeColor : T = Color.white as! T
    public var fillColor : U = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 255/255, green: 127/255, blue: 80/255),
            Color(red: 255/255, green: 99/255, blue: 72/255)
        ]),
        startPoint: .top,
        endPoint: .bottom) as! U
    public var strokeWidth : CGFloat = 1.0
    
    var appearance: Appearance = .light
    public var grid : GridStyle = .disabled
}
