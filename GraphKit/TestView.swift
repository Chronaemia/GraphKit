//
//  TestView.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/26/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        LineGraph([2, 4, 5, 8, 9, 0], style: GraphStyle(value: LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom)))
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
