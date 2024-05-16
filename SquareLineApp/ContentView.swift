//
//  ContentView.swift
//  SquareLineApp
//
//  Created by Nikolay Pochekuev on 16.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isDiagonal = false
    
    let rectSize: CGFloat = 50
    let spacing: CGFloat = 8
    let rectangles = [
        RoundedRectangle(cornerRadius: 8),
        RoundedRectangle(cornerRadius: 8),
        RoundedRectangle(cornerRadius: 8),
        RoundedRectangle(cornerRadius: 8),
        RoundedRectangle(cornerRadius: 8),
        RoundedRectangle(cornerRadius: 8),
        RoundedRectangle(cornerRadius: 8)
    ]
    
    var body: some View {
        HStack(spacing: spacing) {
                ForEach(rectangles.indices, id: \.self) { index in
                    let distanceFromCenter = abs(index - (rectangles.count / 2))
                    let xOffset = CGFloat(distanceFromCenter) * rectSize + (spacing * 2) + 10
                    let yOffset = CGFloat(distanceFromCenter) * rectSize * 2
                    
                    rectangles[index]
                        .fill(Color.blue)
                        .frame(width: isDiagonal ? rectSize * 2 : rectSize,
                               height: isDiagonal ? rectSize * 2 : rectSize)
                        .offset(x: isDiagonal && index != rectangles.count / 2 
                                ? (index < rectangles.count / 2 ? 1 : -1) * xOffset : 0,
                                y: isDiagonal ? (index < rectangles.count / 2 ? 1 : -1) * yOffset : 0)
                        .onTapGesture {
                            withAnimation {
                                isDiagonal.toggle()
                            }
                        }
                }
            }
            .padding()
        }
        
}


#Preview {
    ContentView()
}
