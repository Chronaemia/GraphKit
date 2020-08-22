//
//  Graph.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/24/20.
//

import Foundation
import SwiftUI

public protocol Graph {
    associatedtype StyleType
    associatedtype DataType
    
    var style : StyleType { get set }
    var data : [DataType] { get set }
    
    func graphStyle(style: StyleType) -> Self
    
}

extension Graph where Self: View {
    public func graphStyle(style: StyleType) -> Self {
        var body = self
        body.style = style
        return body
    }
}
