//
//  BubbleChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/20/20.
//

import SwiftUI

public struct BubbleChart<T : ShapeStyle, U: ShapeStyle>: View {
    @State var data : [Point]
    var style : BubbleChartStyle<T, U>
    var min : Point
    var max : Point
    
    init(data: [Point], style : BubbleChartStyle<T, U>) {
        _data = State(initialValue: data)
        self.style = style
        
        let minX = data.min { $0.location.x < $1.location.x }!.location.x
        let minY = data.min { $0.location.y < $1.location.y }!.location.y
        let maxX = data.max { $0.location.x < $1.location.x }!.location.x
        let maxY = data.max { $0.location.y < $1.location.y }!.location.y
        let minRadius = data.min { $0.weight < $1.weight }!.weight
        let maxRadius = data.max { $0.weight < $1.weight }!.weight
        
        self.min = Point(x: minX, y: minY, weight: minRadius)
        self.max = Point(x: maxX * 1.33, y: maxY * 1.33, weight: maxRadius)
    }
    
    public var body: some View {
        ZStack {
            Grid(count: 10)
            .gridType(style.grid)
            .appearance(style.appearance)
            
            
            GeometryReader { geometry in
                ForEach(0..<self.data.count, id: \.self) { index in
                    Circle()
                        .fill(self.getColor(index: index))
                        .scaleEffect(self.calculateScale(point: self.data[index] ))
                        .position(
                            x: geometry.size.width * (self.data[index].location.x / self.max.location.x),
                            y: geometry.size.height - geometry.size.height * (self.data[index].location.y / self.max.location.y)
                        )
                     
                }
            }
            
        }
    }
    
    private func calculateScale(point: Point) -> CGFloat {
        return (point.weight / self.max.weight) / 3
    }
    
    private func getColor(index: Int) -> T {
        return style.theme.fillColors[
            index % style.theme.fillColors.count
        ]
    }
}

struct BubbleChart_Previews: PreviewProvider {
    @State static var data = [
        Point(x: 10, y: 7, weight: 2),
        Point(x: 20, y: 10, weight: 10),
        Point(x: 2, y: 1),
        Point(x: 13, y: 3),
        Point(x: 10, y: 1, weight: 1),
        Point(x: 15, y: 5, weight: 1)
    ]
    static var previews: some View {
        BubbleChart(data: data)
            .padding(20)
            .background(Color.black)
            .frame(height: 250)
    }
}
