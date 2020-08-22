//
//  GraphAxis.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/18/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation

public struct GraphLabels {
    
    public init(
        lowerX: String = "",
        lowerY: String = "",
        upperX: String = "",
        upperY: String = ""
    ) {
        self.lowerX = lowerX
        self.lowerY = lowerY
        self.upperX = upperX
        self.upperY = upperY
    }
    
    var lowerX : String
    var lowerY : String
    var upperX : String
    var upperY : String
}
