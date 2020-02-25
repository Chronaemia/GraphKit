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
    
    public var theme : Theme<T, U> = Theme()
    public var strokeWidth : CGFloat = 1.5
    
    var appearance: Appearance = .light
    public var grid : GridStyle = .disabled
}
