//
//  Theme.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/22/20.
//

import Foundation
import SwiftUI

public struct Theme <S : ShapeStyle, T : ShapeStyle> {
    public var fillColors : [S] = [
        // Orange Gradient
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 255/255, green: 127/255, blue: 80/255),
                Color(red: 255/255, green: 99/255, blue: 72/255)
            ]),
            startPoint: .top,
            endPoint: .bottom
        ),
        // Pink Gradient
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 255/255, green: 71/255, blue: 87/255),
                Color(red: 255/255, green: 107/255, blue: 129/255)
            ]),
            startPoint: .top,
            endPoint: .bottom
        ),
        // Blue Gradient
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 55/255, green: 66/255, blue: 250/255),
                Color(red: 43/255, green: 164/255, blue: 253/255)
            ]),
            startPoint: .top,
            endPoint: .bottom
        ),
        // Green Gradient
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 46/255, green: 213/255, blue: 115/255),
                Color(red: 40/255, green: 237/255, blue: 178/255)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    ] as! [S]
    
    public var strokeColor : T = Color.white as! T
}
