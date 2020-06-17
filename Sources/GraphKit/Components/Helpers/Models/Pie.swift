//
//  Arc.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 3/19/20.
//

import SwiftUI
import Combine

class Pie<T : ShapeStyle, U : ShapeStyle> : ObservableObject {
    
    init(data : [Double], style: PieChartStyle<T, U> ) {
        let sum : Double = data.reduce(0, +)
        
        for value in data {
            self.add(Arc(
                width: 2 * .pi * (value / sum),
                innerOffset: 0,
                fill: Color.blue as! T,
                strokeWidth: Double(style.strokeWidth)
            ))
        }
         
    }
    
    /*
    convenience init(data: [String : Double], style: PieChartStyle<T, U>  ) {
        let array = data.map{ $0.value }
        let sum = array.reduce(0, +)
        
        for (key, value) in data.enumerated() {
            
            let percentage = value / (sum as! Double)
            self.add(Arc(
                width: 2 * .pi * Double(percentage),
                label: key,
                innerOffset: 0,
                fill: Color.blue, // @TODO - Replace this with the ability to pass in colors
                strokeWidth: style.strokeWidth
            ))
        }
    }
 */
    
    var arcs : [Int : Arc<T, U>] {
        get {
            if _arcsNeedUpdate {
                
                /// Recalculate locations, to pack within circle.
                let totalWidth = arcIDs.reduce(0.0) { $0 + _arcs[$1]!.width }
                let scale = (.pi * 2) / max(.pi * 2, totalWidth)
                var location = 0.0
                
                for id in arcIDs {
                    var arc = self.arcs[id]
                    arc!.start = location * scale
                    location += arc!.width
                    arc!.end = location * scale
                    _arcs[id] = arc
                }
                
                _arcsNeedUpdate = false
            }
            return _arcs
        }
        set {
            objectWillChange.send()
            _arcs = newValue
            _arcsNeedUpdate = true
        }
    }
    
    private var _arcs = [Int : Arc<T, U>]()
    
    private var _arcsNeedUpdate = false
    
    /// The display order of the wedges.
    private(set) var arcIDs = [Int]() {
        willSet {
            objectWillChange.send()
        }
    }
    
    /// The next id to allocate.
    private var nextID = 0
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    func add(_ value : Arc<T, U>) {
        let id = nextID
        nextID += 1
        arcs[id] = value
        arcIDs.append(id)
    }
    
    func remove( id : Int ) {
        if let indexToRemove = arcIDs.firstIndex(where: { $0 == id }) {
            arcIDs.remove(at: indexToRemove)
            arcs.removeValue(forKey: id)
        }
    }
}


extension Pie {
    struct Arc<T : ShapeStyle, U : ShapeStyle> : Equatable {
        
        static func == (lhs: Pie.Arc<T, U>, rhs: Pie.Arc<T, U>) -> Bool {
            return lhs.start == rhs.start
        }
        
        /// Arc width in radians
        var width : Double
        
        var label : String = ""
        
        /// Number in the range [0, 1] expressing the inner radius of the slice as a percentage of the total radius
        var innerOffset : Double
        
        /// Number in the range [0, 1] expressing how much the shape "sticks out" past the edge of the graph
        var outerOffset : Double = 0
        
        /// Arc fill style
        var fill : T
        
        /// Arc stroke style
        var strokeWidth : Double
        
        /// The arc's start location, as an angle in radians.
        fileprivate(set) var start = 0.0
        
        /// The arc's end location, as an angle in radians.
        fileprivate(set) var end = 0.0
    }
}

extension Pie.Arc : Animatable {
    typealias AnimatableData = AnimatablePair<AnimatablePair<Double, Double>, AnimatablePair<Double, Double>>
    
    var animatableData: AnimatableData {
        get {
            .init(.init(start, end), .init(innerOffset, outerOffset))
        }
        set {
            start = newValue.first.first
            end = newValue.first.second
            innerOffset = newValue.second.first
            outerOffset = newValue.second.second
        }
    }
}
