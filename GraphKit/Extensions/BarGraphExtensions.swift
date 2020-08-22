//
//  BarGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/21/20.
//

import Foundation
import SwiftUI

// MARK: - Allows library users to modify the look of the Chart/Graph with a GraphStyle Object
public extension BarGraph {
    func graphStyle(style : BarGraphStyle<T, U>) -> Self {
        var body = self
        body.style = style
        return body
    }
}

public extension BarGraph where T == LinearGradient, U == Color {
    init(data: [Double]) {
        self.init(data: data, style: BarGraphStyle())
    }
}
