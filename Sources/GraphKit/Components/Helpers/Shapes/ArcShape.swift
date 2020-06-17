//
//  Arc.swift
//  GraphKit
//
///  All credit due to Apple (https://developer.apple.com/documentation/swiftui/drawing_and_animation/building_custom_views_in_swiftui)
///  The methodology here is basically the same that they showed at the above WWDC presentation

import SwiftUI

struct ArcView<T : ShapeStyle, U: ShapeStyle> : View {
    var arc : Pie<T, U>.Arc<T, U>
    
    var body : some View {
        ArcShape(arc).fill(arc.fill)
    }
}

struct ArcShape<T : ShapeStyle, U: ShapeStyle> : Shape {
    var arc : Pie<T, U>.Arc<T, U>
    init(_ arc: Pie<T, U>.Arc<T, U>) { self.arc = arc }
    
    func path(in rect: CGRect) -> Path {
        let points = ArcGeo(arc, in: rect)
        
        // Draw the shape using the previously described points
        var path = Path()
        
        if points.innerRadius == 0 {
            path.move(to: points.center)
        } else {
            path.addArc(center: points.center, radius: points.innerRadius,
            startAngle: .radians(arc.start), endAngle: .radians(arc.end),
            clockwise: false)
        }
        
        
        path.addLine(to: points[.bottomTrailing])
        path.addArc(center: points.center, radius: points.outerRadius,
            startAngle: .radians(arc.end), endAngle: .radians(arc.start),
            clockwise: true)
        path.closeSubpath()
        return path
    }
    
    var animatableData: Pie<T, U>.Arc<T, U>.AnimatableData {
        get { return arc.animatableData }
        set { arc.animatableData = newValue }
    }
}

// Generates
private struct ArcGeo<T : ShapeStyle, U: ShapeStyle> {
    var arc : Pie<T, U>.Arc<T, U>
    var center : CGPoint
    var innerRadius : CGFloat
    var outerRadius : CGFloat
    
    init(_ arc : Pie<T, U>.Arc<T, U>, in rect: CGRect){
        self.arc = arc
        self.center = CGPoint(x: rect.midX, y: rect.midY)
        
        let radius = min(rect.width, rect.height) * 0.8
        
        self.innerRadius = radius * CGFloat(arc.innerOffset)
        self.outerRadius = radius + CGFloat(Double(radius) * 0.2 * arc.outerOffset)
    }
    
    /// Returns the view location of the point in the at unit-
    /// space location `unitPoint`, where the X axis of `p` moves around the
    /// arc and the Y axis moves out from the inner to outer
    /// radius.
    subscript(unitPoint: UnitPoint) -> CGPoint {
        let radius = lerp(innerRadius, outerRadius, by: unitPoint.y)
        let angle = lerp(arc.start, arc.end, by: Double(unitPoint.x))

        return CGPoint(x: center.x + CGFloat(cos(angle)) * radius,
                       y: center.y + CGFloat(sin(angle)) * radius)
    }
}

/// Linearly interpolate from `from` to `to` by the fraction `amount`.
private func lerp<T: BinaryFloatingPoint>(_ fromValue: T, _ toValue: T, by amount: T) -> T {
    return fromValue + (toValue - fromValue) * amount
}
