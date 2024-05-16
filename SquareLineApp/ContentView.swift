//
//  ContentView.swift
//  SquareLineApp
//
//  Created by Nikolay Pochekuev on 16.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isDiagonal = false
    
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
        HStack {
            ForEach(rectangles.indices, id: \.self) { index in
                rectangles[index]
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        withAnimation {
                            isDiagonal.toggle()
                        }
                    }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
