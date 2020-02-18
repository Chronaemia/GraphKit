//
//  LineGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

public struct LineGraph<T : ShapeStyle, U: ShapeStyle>: View {
    var points : [Double]
    var axisLabels : GraphAxis = GraphAxis()
    var style : LineStyle<T, U> = LineStyle(strokeColor: Color.red, fillColor: Color.clear) as! LineStyle<T, U>
    

    
    public var body: some View {
        HStack {
            if self.axisLabels.lowerX != "" || self.axisLabels.upperX != "" {
                VStack{
                    Text(self.axisLabels.upperX)
                    Spacer()
                    Text(self.axisLabels.lowerX)
                }
                Divider()
            }
            
            GeometryReader { geometry in
                Line(points: self.points, geometry: geometry, style: self.style)
            }
            .padding(20)
            
        }
        .padding(20)
        
        
    }
}

struct LineGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 1.0, 6.0, 9.5, 5.0, 10.0]
    static var previews: some View {
        
        ZStack {
            //Color.black
            
            LineGraph(points: points, axisLabels: GraphAxis(upperX: "Max") , style: LineStyle(
                strokeColor: Color.clear,
                fillColor: LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .bottom, endPoint: .top),
                lineWidth: 1,
                curve: .continuous
            ))
            .frame(height: 200)
        }
    }
}
