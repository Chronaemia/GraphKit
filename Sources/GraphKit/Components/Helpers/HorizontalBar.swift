//
//  HorizontalBar.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/21/20.
//

import SwiftUI

struct HorizontalBar<T : ShapeStyle, U: ShapeStyle>: View {
    @State var width : CGFloat
    @State var offset : CGFloat
    var style : GanttChartStyle<T, U>
    
    var body: some View {
        HStack{
            Spacer(minLength: 0)
                .frame(width: offset)
            
            Rectangle()
                .fill(style.fillColor)
                .frame(width: width)
            Spacer(minLength: 0)
        }
    }
    
}

struct HorizontalBar_Previews: PreviewProvider {
    @State static var style = GanttChartStyle<Color, Color>()
    static var previews: some View {
        HorizontalBar(width: 100, offset: 20, style: style)
    }
}
