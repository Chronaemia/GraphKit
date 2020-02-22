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
    @State var style : PieChartStyle<T, U>
    
    var body: some View {
        Path(self.arc)
            .stroke(style.strokeColor, style: .init(
                lineWidth: self.style.strokeWidth,
                lineCap: .round,
                lineJoin: .round,
                miterLimit: .pi
            ))
         
            
            
        
         
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
    @State static var style = PieChartStyle<Color, Color>()
    
    static var previews: some View {
        ArcSegment(
            angle: 0.3,
            center: CGPoint(x: 1, y: 1),
            radius: 1,
            style: style
        )
    }
}
