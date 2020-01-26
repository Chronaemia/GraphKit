//
//  Line.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

struct Line<T>: View where T: ShapeStyle {
    @State var points : [Double]
    @State var geometry : GeometryProxy?
    var style : GraphStyle<T>
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: self.getHeightValue(height: geometry!.size.height, point: self.points.first!)))
            
            for index in 1..<self.points.count {
                path.addLine(to: self.generateCoordinate(geometry: geometry!, index: index))
            }
            
        }
        .stroke(self.style.value, style: .init(
            lineWidth: self.style.lineWidth,
            lineCap: self.style.lineCap,
            lineJoin: self.style.lineJoin,
            miterLimit: self.style.miterLimit
            ))
    }
    
    private func generateCoordinate(geometry: GeometryProxy, index : Int) -> CGPoint {
        return CGPoint(
        x: CGFloat(index) * self.getIntervalWidth(width: geometry.size.width),
        y: self.getHeightValue(height: geometry.size.height, point: points[index])
        )
    }
    private func getIntervalWidth(width : CGFloat) -> CGFloat {
        return CGFloat(width / CGFloat(self.points.count - 1))
    }
    
    private func getHeightValue(height: CGFloat, point: Double) -> CGFloat {
        return CGFloat(height - (height * CGFloat(point / self.points.max()!)))
    }
}



struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line(points: [10, 9, 0, 6], style: GraphStyle(value: Color.red))
    }
}
