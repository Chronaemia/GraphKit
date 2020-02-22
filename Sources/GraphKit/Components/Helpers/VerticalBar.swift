//
//  Bar.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/18/20.
//

import SwiftUI

struct VerticalBar<T : ShapeStyle, U: ShapeStyle>: View {
    @State var height : CGFloat
    var style : BarGraphStyle<T, U>
    
    public var body: some View {
        VStack {
            Spacer(minLength: 0.0)
                
            Rectangle()
                .fill(self.style.fillColor)
                .frame(height: height)
        }
    }
}

struct VerticalBar_Previews: PreviewProvider {
    @State static var style = BarGraphStyle<Color, Color>()
    static var previews: some View {
        VerticalBar(height: 5, style: style)
    }
}
