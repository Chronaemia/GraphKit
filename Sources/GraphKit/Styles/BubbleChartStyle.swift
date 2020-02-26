//
//  BubbleCharttStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

public struct BubbleChartStyle<T : ShapeStyle, U : ShapeStyle> : GraphStyle {
    typealias StrokeStyle = T
    typealias FillStyle = U
    
    internal init(
        labels: GraphLabels = GraphLabels(),
        theme: Theme<T, U> = Theme(),
        strokeWidth: CGFloat = 2,
        lineCap: CGLineCap = .butt,
        lineJoin: CGLineJoin = .round,
        miterLimit: CGFloat = .greatestFiniteMagnitude,
        curve: Curviture = .none,
        curveRadius: CGFloat = 20,
        appearance: Appearance = .auto,
        grid: GridStyle = .full
    ) {
        self.labels = labels
        self.theme = theme
        self.strokeWidth = strokeWidth
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.curve = curve
        self.curveRadius = curveRadius
        self.appearance = appearance
        self.grid = grid
    }
    
    public var labels : GraphLabels
    public var theme : Theme<T, U>
    public var strokeWidth : CGFloat
    public var lineCap : CGLineCap
    public var lineJoin : CGLineJoin
    public var miterLimit : CGFloat
    public var curve : Curviture
    public var curveRadius : CGFloat
    public var appearance: Appearance
    public var grid : GridStyle
}

