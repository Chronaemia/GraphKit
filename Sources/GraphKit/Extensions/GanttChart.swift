//
//  GanttChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/21/20.
//

import Foundation

// MARK: - Allows library users to modify the look of the Chart/Graph with a GraphStyle Object
public extension GanttChart {
    func graphStyle(style : PieChartStyle<T, U>) -> Self {
        var body = self
        body.style = style
        return body
    }
}
// MARK: - Provides default typing so the user never has to explicity disambiguate my generics
public extension GanttChart where T == Color, U == LinearGradient {
    init(data: [DateInterval]) {
        self.init(data: data, style: GanttChartStyle())
    }
}
