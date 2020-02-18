//
//  Arc.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

struct Arc: View {
    @State var segments : [Double]
    @State var geometry : GeometryProxy?
    
    public var center : CGPoint {
        CGPoint(x: geometry!.size.width / 2, y: geometry!.size.height / 2)
    }
    
    public var total : Double {
        segments.reduce(0, +)
    }
    
    public var minDim : CGFloat {
        min(geometry!.size.width / 2 , geometry!.size.height / 2)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.green)
            ForEach(0..<self.segments.count, id: \.self){ index in
                
                
                ArcSegment(angle: CGFloat(self.segments[index] / self.total), center: self.center, radius: self.minDim)
                    .rotationEffect(self.calculateAngle(index), anchor: .center)
                 
            }
            
             
        }
    }
    
    // @TODO - Rethink this, it's really computational for no reason when it might be possible to just store this as a variable and add to it (except for SwiftUIs immutability
    private func calculateAngle(_ index : Int) -> Angle {
        return Angle(degrees: 360 * self.segments.prefix(index).reduce(0, +) / self.total)
    }
    
}

struct Arc_Previews: PreviewProvider {
    static var previews: some View {
        Arc(segments: [1, 2, 3])
    }
}
