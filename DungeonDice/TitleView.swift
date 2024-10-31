//
//  TitleView.swift
//  DungeonDice
//
//  Created by Mohammad Eid on 31/10/2024.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Dugeon Dice")
            .font(Font.custom("Snell Roundhand", size: 60))
            .fontWeight(.black)
            .foregroundStyle(.red)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
    }
}


#Preview {
    TitleView()
        .padding()
}
