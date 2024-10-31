//
//  LazyCenteredGrid.swift
//  DungeonDice
//
//  Created by Mohammad Eid on 31/10/2024.
//

import SwiftUI

struct LazyCenteredGrid<Content: View>: View {
    let cellWidth: CGFloat
    let spacing: CGFloat
    
    @ViewBuilder let content: Content
    
    init(cellWidth: CGFloat, spacing: CGFloat = 8.0, @ViewBuilder content: () -> Content) {
        self.cellWidth = cellWidth
        self.spacing = spacing
        self.content = content()
    }
    
    @State private var leftOverCells = 0
    
    var body: some View {
        Group(subviews: content) { subviews in
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: cellWidth, maximum: cellWidth), spacing: spacing)]) {
                    ForEach(subviews.dropLast(leftOverCells)) { subview in
                        subview.frame(width: cellWidth)
                    }
                }
                
                HStack(spacing: spacing) {
                    ForEach(subviews.suffix(leftOverCells)) { subview in
                        subview.frame(width: cellWidth)
                    }
                }
            }
            .onGeometryChange(for: CGFloat.self, of: {$0.size.width}) { width in
                let columns = Int(width + spacing) / Int(cellWidth + spacing)
                leftOverCells = subviews.count % columns
            }
            
        }
        
    }
}

#Preview {
    LazyCenteredGrid(cellWidth: 100) {
        ForEach(0..<11) { _ in
            Rectangle().fill(.blue).frame(width: 100, height: 30)
        }
    }
}
