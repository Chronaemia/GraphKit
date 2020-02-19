//
//  PieChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

public struct PieChart<T : ShapeStyle, U: ShapeStyle> : View {
    @State var segments : [Double]
    @State var style : PieChartStyle<T, U> = PieChartStyle(strokeColor: Color.red, fillColor: Color.clear) as! PieChartStyle<T, U>
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(self.style.fillColor)
            GeometryReader { geometry in
                Arc(segments: self.segments, geometry: geometry, style: self.style)
            }
        }
        
    }
    
}

struct PieChart_Previews: PreviewProvider {
    @State static var style = PieChartStyle<Color, Color>()
    
    static var previews: some View {
        PieChart(segments: [20, 50, 40], style: style)
            .frame(width: 400)
            
    }
}
