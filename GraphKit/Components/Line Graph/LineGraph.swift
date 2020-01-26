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
    var labels : (String, String)
    var style : GraphStyle<T>
     
    
    init(_ points : [Double], labels: (String, String)? = nil, style : GraphStyle<T>) {
        self.points = points
        self.style = style
        
        if let labelValue = labels {
            self.labels = labelValue
        } else {
            self.labels = (String(format: "%.1f", points.max()!), String(format: "%.1f", points.min()!))
        }
        
    }

    
    var body: some View {
        HStack {
            VStack{
                Text(self.labels.0)
                Spacer()
                Text(self.labels.1)
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
    init(_ points : [Double], label: (String, String)? = nil) {
        self.points = points
        self.style = GraphStyle(value: Color.red)
        
        if let labelValue = label {
            self.labels = labelValue
        } else {
            self.labels = ("\(points.max()!)", "\(points.min()!)")
        }
    }
}

struct LineGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 0.0, 6.0, 7.5, 9.0, 0]
    static var previews: some View {
        LineGraph(points)
    }
}
