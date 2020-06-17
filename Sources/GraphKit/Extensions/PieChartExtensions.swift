//
//  PieChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/21/20.
//

import Foundation
import SwiftUI

// MARK: - Provides default typing so the user never has to explicity disambiguate my generics
public extension PieChart where T == LinearGradient, U == Color {
    init(data: [Double]) {
        self.init(data: data, style: PieChartStyle())
    }
}
