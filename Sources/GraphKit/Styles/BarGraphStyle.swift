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
    
    public init(
        theme: Theme<T, U> = Theme(),
        strokeWidth: CGFloat = 4,
        spacing: Double = 5,
        radius: CGFloat = 0,
        appearance: Appearance = .light,
        grid: GridStyle = .vertical
    ) {
        self.theme = theme
        self.strokeWidth = strokeWidth
        self.spacing = spacing
        self.radius = radius
        self.appearance = appearance
        self.grid = grid
    }
    
    public var theme : Theme<T, U>
    public var strokeWidth: CGFloat
    public var spacing : Double
    public var radius : CGFloat
    public var appearance : Appearance
    public var grid : GridStyle
}
