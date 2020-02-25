//
//  BarGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/18/20.
//

import SwiftUI

public struct BarGraph<T : ShapeStyle, U: ShapeStyle>: View, Graph {
    @State public var data : [Double]
    @State public var style : BarGraphStyle<T, U>
    
    public var body: some View {
        ZStack {
            Grid(count: 10)
            .gridType(style.grid)
            .appearance(style.appearance)
            
            GeometryReader { geometry in
                HStack {
                    ForEach(0..<(self.data.count), id: \.self){ index in
                        VerticalBar(
                            height: self.getHeight(point: self.data[index], geometry: geometry),
                            fill: self.getColor(index),
                            radius: self.style.radius
                        )
                    }
                }
            }
            
        }
        
        
    }
    
    
    private func getColor(_ index: Int) -> T {
        return style.theme.fillColors[
            index % style.theme.fillColors.count
        ]
    }
     
    private func getHeight(point: Double, geometry : GeometryProxy) -> CGFloat {
        return geometry.size.height * CGFloat(point / data.max()!)
    }
}


struct BarGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 1.0, 6.0, 9.5, 5.0, 10.0]
    
    static var previews: some View {
        BarGraph(data: points)
            .padding(20)
            .background(Color.black)
            .frame(height: 250)
    }
}
