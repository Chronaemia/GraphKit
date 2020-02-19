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
    var style : LineGraphStyle<T, U> = LineGraphStyle(strokeColor: Color.red, fillColor: Color.clear) as! LineGraphStyle<T, U>
    

    
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
    @State static var style = LineGraphStyle<Color, Color>()
    static var previews: some View {
        
        ZStack {
            //Color.black
            
            LineGraph(points: points, axisLabels: GraphAxis(upperX: "Max") , style: style)
            .frame(height: 200)
        }
    }
}
