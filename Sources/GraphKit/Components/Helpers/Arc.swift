//
//  Arc.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

struct Arc<T : ShapeStyle, U: ShapeStyle>: View {
    @State var segments : [Double]
    @State var size : CGSize
    @State var style : PieChartStyle<T, U>
    
    var total : Double
    var center : CGPoint
    var minDim : CGFloat
    
    init(segments : [Double], size: CGSize, style : PieChartStyle<T, U>) {
        _segments = State(initialValue: segments)
        _size = State(initialValue: size)
        _style = State(initialValue: style)
        
        self.total = segments.reduce(0, +)
        self.center = CGPoint(x: size.width / 2, y: size.height / 2)
        self.minDim = min(size.width / 2 , size.height / 2)
    }
    
    
    var body: some View {
        ForEach(0..<self.segments.count, id: \.self){ index in
            
            ArcSegment(
                angle: CGFloat(self.segments[index] / self.total),
                center: self.center,
                radius: self.minDim,
                style: self.style
            )
                .rotationEffect(self.calculateAngle(index), anchor: .center)
             
        }
        
    }
    
    private func calculateAngle(_ index : Int) -> Angle {
        return Angle(degrees: 360 * self.segments.prefix(index).reduce(0, +) / self.total)
    }
    
}

struct Arc_Previews: PreviewProvider {
    @State static var style = PieChartStyle<Color, LinearGradient>()
    @State static var size = CGSize(width: 400, height: 400)
    
    static var previews: some View {
        Arc(segments: [2, 5, 4], size: size, style: style)
    }
}
