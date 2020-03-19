//
//  LineGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

public struct LineGraph<T : ShapeStyle, U: ShapeStyle>: View, Graph {
    @State public var data : [Double]
    @State public var style : LineGraphStyle<T, U> = LineGraphStyle()
    

    
    public var body: some View {
        ZStack{
            Grid(count: 10)
                .appearance(style.appearance)
                .gridType(style.grid)
            
            VStack {
                HStack {
                    if self.style.labels.lowerY != "" || self.style.labels.upperY != "" {
                        VStack{
                            Text(self.style.labels.upperY)
                            Spacer()
                            Text(self.style.labels.lowerY)
                        }
                    }
                    VStack{
                        GeometryReader { geometry in
                            Line(points: self.data, geometry: geometry, style: self.style)
                        }
                        
                    }
                    
                    
                }
                
                if self.style.labels.lowerX != "" || self.style.labels.upperX != "" {
                    HStack {
                        Text(self.style.labels.lowerX)
                        Spacer()
                        Text(self.style.labels.upperX)
                        
                    }
                    .padding(.leading, 15)
                }
            }
        }
    }
    
}

struct LineGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 1.0, 6.0, 9.5, 5.0, 10.0]
    @State static var s = LineGraphStyle<Color, LinearGradient>(
        strokeWidth: 1,
        curve: .continuous,
        appearance: .auto,
        grid: .horizontal
    )
    
    static var previews: some View {
        
        LineGraph(data: points, style: s)
            .padding(10)
            .background(Color.black)
            .frame(height: 250)
    }
}
