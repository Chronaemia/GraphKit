//
//  GraphStyle.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/17/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//

import Foundation
import SwiftUI

protocol GraphStyle {
    associatedtype StrokeStyle
    associatedtype FillStyle
    
    var strokeColor : StrokeStyle { get set }
    var fillColor : FillStyle { get set }
    var strokeWidth : CGFloat { get set }
    var appearance : Appearance { get set }
}
