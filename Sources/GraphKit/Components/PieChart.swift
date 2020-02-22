//
//  PieChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

public struct PieChart<T : ShapeStyle, U: ShapeStyle> : View {
    @State var data : [Double]
    var style : PieChartStyle<T, U>
    
    public var body: some View {
        ZStack {
            Grid(count: 10)
            .appearance(style.appearance)
            .gridType(style.grid)
            
            GeometryReader { geometry in
                Arc(segments: self.data, size: geometry.size, style: self.style)
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    
    static var previews: some View {
        PieChart(data: [20, 50, 40, 50, 30])
            .padding(20)
            .background(Color.black)
            .frame(height: 250)
            
            
    }
}
