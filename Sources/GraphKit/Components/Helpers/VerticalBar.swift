//
//  Bar.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/18/20.
//

import SwiftUI

struct VerticalBar<T : ShapeStyle>: View {
    @State var height : CGFloat
    @State var fill : T
    @State var radius : CGFloat
    
    public var body: some View {
        VStack {
            Spacer(minLength: 0.0)
                
            Rectangle()
                .fill(fill)
                .cornerRadius(radius)
                .frame(height: height)
        }
    }
}

struct VerticalBar_Previews: PreviewProvider {
    static var previews: some View {
        VerticalBar(height: 400, fill: Color.red, radius: 0)
    }
}
