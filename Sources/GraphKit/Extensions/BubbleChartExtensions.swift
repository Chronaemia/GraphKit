//
//  BubbleChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/21/20.
//

import Foundation
import SwiftUI


// MARK: - Allows library users to modify the look of the Chart/Graph with a GraphStyle Object
public extension BubbleChart {
    func graphStyle(style : BubbleChartStyle<T, U>) -> Self {
        var body = self
        body.style = style
        return body
    }
}
// MARK: - Provides default typing so the user never has to explicity disambiguate my generics
public extension BubbleChart where T == Color, U == LinearGradient {
    init(data: [Point]) {
        self.init(data: data, style: BubbleChartStyle())
    }
}
