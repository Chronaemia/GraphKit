//
//  GraphStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

public struct GraphStyle<T : ShapeStyle, U : ShapeStyle> {
    public var strokeStyle : T
    public var fillStyle : U
    public var lineWidth : CGFloat
    public var lineCap : CGLineCap
    public var lineJoin : CGLineJoin = .round
    public var miterLimit : CGFloat = .greatestFiniteMagnitude
    public var curve : CurvitureOption
    public var curveRadius : CGFloat
    
    public init(
        stroke: T,
        fill: U,
        lineWidth : CGFloat = 5,
        lineCap : CGLineCap = .square,
        curve : CurvitureOption = .none,
        curveRadius : CGFloat = 20 ) {
        
        self.strokeStyle = stroke
        self.fillStyle = fill
        self.lineWidth = lineWidth
        self.lineCap = lineCap
        self.curve = curve
        self.curveRadius = curveRadius
    }
}

extension GraphStyle {
    public enum CurvitureOption {
        case none
        case continuous
    }
}
