//
//  GraphStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

public struct GraphStyle<ShapeStyle> {
    var value : ShapeStyle
    var lineWidth : CGFloat = 5
    var lineCap : CGLineCap = .round
    var lineJoin : CGLineJoin = .round
    var miterLimit : CGFloat = .greatestFiniteMagnitude
}
