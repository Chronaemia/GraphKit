//
//  LineGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

struct LineGraph<T>: View where T : ShapeStyle {
    var points : [Double]
    var style : GraphStyle<T>
     
    
    init(_ points : [Double], style : GraphStyle<T>) {
        self.points = points
        self.style = style
        
    }

    
    var body: some View {
        HStack {
            VStack{
                Text(String(format: "%.1f", points.max()!))
                Spacer()
                Text(String(format: "%.1f", points.min()!))
            }
            Divider()
            GeometryReader { geometry in
                Line(points: self.points, geometry: geometry, style: self.style)
            }
            .padding(20)
            
        }
        .padding(20)
        
        
    }
}

extension LineGraph where T == Color {
    init(_ points : [Double]) {
        self.points = points
        self.style = GraphStyle(value: Color.red)
    }
}

struct LineGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 0.0, 6.0, 7.5, 9.0, 0]
    static var previews: some View {
        LineGraph(points)
    }
}
