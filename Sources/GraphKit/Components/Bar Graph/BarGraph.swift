//
//  BarGraph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/18/20.
//

import SwiftUI

public struct BarGraph<T : ShapeStyle, U: ShapeStyle>: View {
    @State var data : [Double]
    private var style : BarGraphStyle<T, U>
    
    public var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(self.data, id: \.self){ item in
                    Bar(height: self.getSize(point: item, geometry: geometry))
                }
            }
        }
        
    }
    
    private func getSize(point: Double, geometry : GeometryProxy) -> CGFloat {
        return geometry.size.height * CGFloat(point / data.max()!)
    }
}

public extension BarGraph where T == Color, U == Color {
    init(data: [Double]) {
        self.init(data: data, style: BarGraphStyle())
    }
}

struct BarGraph_Previews: PreviewProvider {
    @State static var points = [10.0, 1.0, 6.0, 9.5, 5.0, 10.0]
    
    static var previews: some View {
        BarGraph(data: points)
            .padding(30)
            .background(Color.blue)
            .frame(height: 300)
    }
}
