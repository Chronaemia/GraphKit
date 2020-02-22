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
            Circle()
                .fill(self.style.fillColor)
            GeometryReader { geometry in
                Arc(segments: self.data, geometry: geometry, style: self.style)
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    
    static var previews: some View {
        PieChart(data: [20, 50, 40])
            .padding(20)
            .background(Color.black)
            .frame(width: 400)
            
            
    }
}
