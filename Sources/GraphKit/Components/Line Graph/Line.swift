//
//  Line.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 1/25/20.
//  Copyright © 2020 Reginald McBride-Taylor. All rights reserved.
//


import SwiftUI

public struct Line<T : ShapeStyle, U : ShapeStyle>: View {
    @State var points : [Double]
    @State var geometry : GeometryProxy?
    var style : LineGraphStyle<T, U>
    
    var path : CGMutablePath {
        let path = CGMutablePath()
        
        if self.style.curve == .continuous {
            
            path.move(to: CGPoint(x: 0, y: self.getHeightValue(height: geometry!.size.height, point: self.points.first!)))
            
            for index in 1..<self.points.count {
                let newCoordinate = self.generateCoordinate(geometry: geometry!, index: index)
                path.addCurve(
                    to: newCoordinate,
                    control1: CGPoint(x: path.currentPoint.x + self.style.curveRadius, y: path.currentPoint.y),
                    control2: CGPoint(x: newCoordinate.x - self.style.curveRadius, y: newCoordinate.y )
                )
            }
            
        } else {
            
            path.move(to: CGPoint(x: 0, y: self.getHeightValue(height: geometry!.size.height, point: self.points.first!)))
            
            for index in 1..<self.points.count {
                path.addLine(to: self.generateCoordinate(geometry: geometry!, index: index))
            }
        }
        
        return path
    }
    
    var closedPath : CGMutablePath {
        let path = self.path
        path.addLine(to: CGPoint(x: CGFloat(self.points.count - 1) * self.getIntervalWidth(width: geometry!.size.width), y: geometry!.size.height) ) // Bottom  right corner
        path.addLine(to: CGPoint(x: 0, y: geometry!.size.height) ) // Bottom left corner
        path.addLine(to: self.generateCoordinate(geometry: geometry!, index: 0) ) // Return home
        return path
    }
    
    public var body: some View {
        
        ZStack {
            Path(self.closedPath)
                .fill(self.style.fillColor)
            
            Path(self.path)
                .stroke(self.style.strokeColor, style: .init(
                    lineWidth: self.style.strokeWidth,
                    lineCap: self.style.lineCap,
                    lineJoin: self.style.lineJoin,
                    miterLimit: self.style.miterLimit
                ))
        }
        
    }
    
    private func generateCoordinate(geometry: GeometryProxy, index : Int) -> CGPoint {
        return CGPoint(
        x: CGFloat(index) * self.getIntervalWidth(width: geometry.size.width),
        y: self.getHeightValue(height: geometry.size.height, point: points[index])
        )
    }
    private func getIntervalWidth(width : CGFloat) -> CGFloat {
        return CGFloat(width / CGFloat(self.points.count - 1))
    }
    
    private func getHeightValue(height: CGFloat, point: Double) -> CGFloat {
        return CGFloat(height - (height * CGFloat(point / self.points.max()!)) - (self.style.strokeWidth))
    }
}



struct Line_Previews: PreviewProvider {
    @State static var style = LineGraphStyle<Color, Color>()
    static var previews: some View {
        Line(points: [10, 9, 0, 6], style: style)
    }
}
