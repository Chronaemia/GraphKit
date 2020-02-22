//
//  BarGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/18/20.
//

import SwiftUI

public struct BarGraph<T : ShapeStyle, U: ShapeStyle>: View {
    @State var data : [Double]
    var style : BarGraphStyle<T, U>
    
    public var body: some View {
        ZStack {
            Grid(count: 10)
            .gridType(style.grid)
            .appearance(style.appearance)
            
            
            GeometryReader { geometry in
                HStack {
                    ForEach(self.data, id: \.self){ item in
                        VerticalBar(height: self.getSize(point: item, geometry: geometry), style: self.style)
                    }
                }
            }
        }
        
        
    }
    
    private func getSize(point: Double, geometry : GeometryProxy) -> CGFloat {
        return geometry.size.height * CGFloat(point / data.max()!)
    }
}


struct BarGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 1.0, 6.0, 9.5, 5.0, 10.0]
    
    static var previews: some View {
        BarGraph(data: points)
            .padding(30)
            .background(Color.black)
            .frame(height: 300)
    }
}
