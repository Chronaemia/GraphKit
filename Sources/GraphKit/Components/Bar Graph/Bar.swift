//
//  Bar.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/18/20.
//

import SwiftUI

struct Bar: View {
    @State var height : CGFloat
    var body: some View {
        VStack {
            Spacer()
                
            Rectangle()
                .frame(height: height)
        }
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(height: 5)
    }
}
