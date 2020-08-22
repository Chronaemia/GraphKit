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
    
    public init(
        theme: Theme<T, U> = Theme(),
        strokeWidth: CGFloat = 1.5,
        appearance: Appearance = .light,
        grid: GridStyle = .disabled,
        gridDensity: Int = 6
    ) {
        self.theme = theme
        self.strokeWidth = strokeWidth
        self.appearance = appearance
        self.grid = grid
        self.gridDensity = gridDensity
    }
    
    
    typealias StrokeStyle = T
    typealias FillStyle = U
    
    public var theme : Theme<T, U>
    public var strokeWidth : CGFloat
    public var appearance: Appearance
    public var grid : GridStyle
    public var gridDensity : Int
}
