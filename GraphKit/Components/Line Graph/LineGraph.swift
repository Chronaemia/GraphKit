//
//  LineGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

public struct LineGraph<T : ShapeStyle, U: ShapeStyle>: View {
    var points : [Double] // @TODO - Switch this for a protocol that includes all of the primitive number types
    var axisLabels : (String, String)
    var style : GraphStyle<T, U>
     
    
    public init(_ points : [Double], axisLabels: (String, String)? = nil, style : GraphStyle<T, U>) {
        self.points = points
        
        self.style = style
        
        if let labelValue = axisLabels {
            self.axisLabels = labelValue
        } else {
            self.axisLabels = ("", "")
        }
        
    }

    
    public var body: some View {
        HStack {
            if self.axisLabels.0 != "" || self.axisLabels.1 != "" {
                VStack{
                    Text(self.axisLabels.1)
                    Spacer()
                    Text(self.axisLabels.0)
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

// Provide an easy default style
public extension LineGraph where T == Color, U == Color {
    init(_ points : [Double], axisLabels: (String, String)? = nil) {
        self.init(points, axisLabels: axisLabels, style: GraphStyle(stroke: Color.red, fill: Color.clear))
    }
}

struct LineGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 1.0, 6.0, 9.5, 5.0, 10.0]
    static var previews: some View {
        
        ZStack {
            //Color.black
            
            LineGraph(points, axisLabels: ("", "max"), style: GraphStyle(
                stroke: Color.blue,
                fill: LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .bottom, endPoint: .top),
                lineWidth: 1,
                curve: .continuous
            ))
            .frame(height: 200)
        }
    }
}
