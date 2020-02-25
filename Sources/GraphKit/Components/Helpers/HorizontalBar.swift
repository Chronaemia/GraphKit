//
//  HorizontalBar.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/21/20.
//

import SwiftUI

struct HorizontalBar<T : ShapeStyle >: View {
    @State var width : CGFloat
    @State var offset : CGFloat
    @State var fill : T
    @State var radius : CGFloat
    
    var body: some View {
        HStack{
            Spacer(minLength: 0)
                .frame(width: offset)
            
            Rectangle()
                .fill(fill)
                .frame(width: width)
                .cornerRadius(radius)
            Spacer(minLength: 0)
        }
    }
    
}

struct HorizontalBar_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalBar(width: 100, offset: 20, fill: Color.orange, radius: 10)
    }
}
