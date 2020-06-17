//
//  PieChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

public struct PieChart<T : ShapeStyle, U: ShapeStyle> : View {
    @State private var pie : Pie<T, U>
    @State private var style : PieChartStyle<T, U>
    
    init(data: [Double], style: PieChartStyle<T, U>) {
        _style = State(initialValue: style)
        _pie = State(initialValue: Pie(
            data: data,
            style: style
        ))
    }
    
    /*
    convenience init(data: [String : Double], style: PieChartStyle<T, U>) {
        _style = State(initialValue: style)
        _pie = State(initialValue: Pie(
            data: data,
            style: style
        ))
    }
     */
    
    
    public var body: some View {
        ZStack {
            Grid(count: style.gridDensity)
            .appearance(style.appearance)
            .gridType(style.grid)
            
            GeometryReader { geometry in
                ZStack {
                    ForEach(self.pie.arcIDs, id: \.self) { arcID in
                        ArcShape<T, U>(self.pie.arcs[arcID]!)
                    }

                    // Stop the window shrinking to zero when wedgeIDs.isEmpty.
                    Spacer()
                }
                .flipsForRightToLeftLayoutDirection(true)
                .padding()
                .drawingGroup()
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
