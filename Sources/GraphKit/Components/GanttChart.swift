//
//  GanttChart.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/20/20.
//

import SwiftUI

public struct GanttChart<T : ShapeStyle, U: ShapeStyle>: View, Graph {
    
    @State public var data : [DateInterval]
    @State public var style : GanttChartStyle<T, U> = GanttChartStyle()
    
    private var start : Date
    private var end : Date
    
    init(data: [DateInterval], style: GanttChartStyle<T, U>) {
        _data = State(initialValue: data)
        _style = State(initialValue: style)
        self.start = data.min { $0.start < $1.start }!.start
        self.end = data.max { $0.end < $1.end }!.end
    }
    
    public var body: some View {
        ZStack {
            Grid(count: 10)
            .appearance(style.appearance)
            .gridType(style.grid)
            
            VStack {
                ForEach(data, id: \.self) { interval in
                    HStack {
                        GeometryReader { geometry in
                            HorizontalBar(
                                width: geometry.size.width * self.getWidth(interval: interval),
                                offset: geometry.size.width * self.getOffset(interval: interval),
                                fill: self.getColor(index: self.data.firstIndex(of: interval)!),
                                radius: self.style.radius
                            )
                        }
                        
                        
                    }
                    .padding(.bottom, 20)
                }
            }
        }
        
    }
}

extension GanttChart {
    private func getWidth(interval : DateInterval) -> CGFloat {
        return CGFloat( interval.duration / self.start.distance(to: self.end) )
        
    }
    
    private func getOffset(interval: DateInterval) -> CGFloat {
        return CGFloat(start.distance(to: interval.start) / self.start.distance(to: self.end))
    }
    
    private func getColor(index: Int) -> T {
        return style.theme.fillColors[
            index % style.theme.fillColors.count
        ]
    }
}

struct GanttChart_Previews: PreviewProvider {
    @State static var intervals = [
        DateInterval(
            start: Date(),
            end: Calendar.current.date(byAdding: .day, value: 5, to: Date(), wrappingComponents: false)!
        ),
        DateInterval(
            start: Calendar.current.date(byAdding: .day, value: 1, to: Date(), wrappingComponents: false)!,
            end: Calendar.current.date(byAdding: .day, value: 2, to: Date(), wrappingComponents: false)!
        ),
        DateInterval(
            start: Date(),
            end: Calendar.current.date(byAdding: .day, value: 4, to: Date(), wrappingComponents: false)!
        ),
        DateInterval(
            start: Date(),
            end: Calendar.current.date(byAdding: .day, value: 1, to: Date(), wrappingComponents: false)!
        )
    ]
    static var previews: some View {
        GanttChart(data: intervals)
            .padding(20)
            .background(Color.black)
            .frame(height: 250)
    }
}
