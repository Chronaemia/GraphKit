//
//  GraphStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

public struct LineGraphStyle<T : ShapeStyle, U : ShapeStyle> : GraphStyle {
    
    typealias StrokeStyle = T
    typealias FillStyle = U
    
    public var labels : GraphLabels = GraphLabels()
    public var strokeColor : T = Color.white as! T
    public var fillColor : U = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 255/255, green: 127/255, blue: 80/255),
            Color(red: 255/255, green: 99/255, blue: 72/255)
        ]),
        startPoint: .top,
        endPoint: .bottom) as! U
    public var strokeWidth : CGFloat = 2
    public var lineCap : CGLineCap = .butt
    public var lineJoin : CGLineJoin = .round
    public var miterLimit : CGFloat = .greatestFiniteMagnitude
    public var curve : Curviture = .none
    public var curveRadius : CGFloat = 20
    public var appearance: Appearance = .auto
    public var grid : GridStyle = .disabled
}
