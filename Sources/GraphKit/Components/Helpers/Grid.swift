//
//  Grid.swift
//  GraphKit
//
//  Created by Reginald McBride-Taylor on 2/20/20.
//

import SwiftUI

struct Grid: View {
    @State var type : GridStyle = .full
    var count : Int = 6
    var appearance : Appearance = .auto
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        ZStack {
            if type == .horizontal || type == .full {
                HStack {
                    ForEach(0..<count, id: \.self) { _ in
                        Group {
                            Divider()
                                .background(self.getAppearanceColor())
                            Spacer()
                        }
                    }
                    Divider()
                        .background(self.getAppearanceColor())
                }
                
            }
            
            if type == .vertical || type == .full {
                VStack {
                    ForEach(0..<count, id: \.self) { _ in
                        Group {
                            Divider()
                                .background(self.getAppearanceColor())
                            Spacer()
                        }
                    }
                    Divider()
                        .background(self.getAppearanceColor())
                }
            }
        }
    }
}

extension Grid {
    func gridType(_ style: GridStyle) -> Self {
        let body = self
        body.type = style
        return body
    }
    
    func appearance(_ appearance: Appearance) -> Self {
        var body = self
        body.appearance = appearance
        return body
    }
    
    func getAppearanceColor() -> Color{
        switch(appearance){
        case .dark: return Color.white.opacity(0.5)
        case .light: return Color.gray.opacity(0.1)
        case .auto :
            if(colorScheme == .dark) {
                return Color.white.opacity(0.5)
            } else {
                return Color.gray.opacity(0.1)
            }
        }
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid(type: GridStyle.full)
            .background(Color.black)
            .frame(height: 200)
    }
}
