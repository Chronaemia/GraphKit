//
//  PieChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

struct PieChart : View {
    var segments : [Double]
    
    var body: some View {
        GeometryReader { geometry in
            Arc(segments: self.segments, geometry: geometry)
        }
    }
    
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(segments: [20, 50, 40])
            .frame(width: 400)
            
    }
}
