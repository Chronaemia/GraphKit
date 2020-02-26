//
//  GanttChartStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

public struct GanttChartStyle<T : ShapeStyle, U : ShapeStyle> : GraphStyle {
    
    typealias StrokeStyle = T
    typealias FillStyle = U
    
    public init(
        labels: GraphLabels = GraphLabels(),
        theme: Theme<T, U> = Theme(),
        strokeWidth: CGFloat = 2,
        lineCap: CGLineCap = .butt,
        lineJoin: CGLineJoin = .round,
        miterLimit: CGFloat = .greatestFiniteMagnitude,
        radius: CGFloat = 10,
        appearance: Appearance = .auto,
        grid: GridStyle = .horizontal
    ) {
        self.labels = labels
        self.theme = theme
        self.strokeWidth = strokeWidth
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.radius = radius
        self.appearance = appearance
        self.grid = grid
    }
    
    public var labels : GraphLabels
    public var theme : Theme<T, U>
    public var strokeWidth : CGFloat
    public var lineCap : CGLineCap
    public var lineJoin : CGLineJoin
    public var miterLimit : CGFloat
    public var radius : CGFloat
    public var appearance: Appearance
    public var grid : GridStyle
}
