//
//  GraphStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

public struct LineStyle<T : ShapeStyle, U : ShapeStyle> : GraphStyle {
    
    typealias StrokeStyle = T
    typealias FillStyle = U
    
    public var strokeColor : T = Color.red as! T
    public var fillColor : U = Color.clear as! U
    public var strokeWidth : CGFloat = 5
    public var lineCap : CGLineCap = .square
    public var lineJoin : CGLineJoin = .round
    public var miterLimit : CGFloat = .greatestFiniteMagnitude
    public var curve : Curviture = .none
    public var curveRadius : CGFloat = 20
    public var appearance: Appearance = .light
}
