//
//  ArcSegment.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

struct ArcSegment<T : ShapeStyle, U : ShapeStyle>: View {
    @State var angle : CGFloat // The total angle taken up by the slice
    @State var center : CGPoint
    @State var radius : CGFloat
    @State var fill : T
    @State var stroke : U
    @State var strokeWidth : CGFloat
    
    var body: some View {
        Path(self.arc)
            .fill(fill)
            
            .overlay(
                Path(self.arc)
                .stroke(stroke, style: .init(
                    lineWidth: strokeWidth,
                    lineCap: .round,
                    lineJoin: .round,
                    miterLimit: .pi
                ))
            )
    }
    
    var arc : CGMutablePath {
        let path = CGMutablePath()
        path.move(to: center)
        path.addLine(to: CGPoint(x: center.x + radius, y: center.y))
        
        path.addArc(
            center: self.center,
            radius: self.radius,
            startAngle: 0,
            endAngle: self.angle * 2 * .pi,
            clockwise: false)
        
        path.closeSubpath()
        return path
    }
    
}

struct ArcSegment_Previews: PreviewProvider {
    @State static var style = PieChartStyle<Color, LinearGradient>()
    
    static var previews: some View {
        ArcSegment(
            angle: 0.3,
            center: CGPoint(x: 1, y: 1),
            radius: 1,
            fill: Color.red,
            stroke: Color.white,
            strokeWidth: 5
        )
    }
}
