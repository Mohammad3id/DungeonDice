//
//  ContentView.swift
//  DungeonDice
//
//  Created by Mohammad Eid on 31/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    enum Dice: Int, CaseIterable {
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundred = 100
        
        func roll() -> Int { Int.random(in: 1...self.rawValue) }
    }
    
    @State private var resultMessage = "";
    @State private var buttonsLeftOver = 0;
    
    let horizontalPadding = 16.0
    let spacing = 8.0
    let buttonWidth = 105.0
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                titleView
                
                Spacer()
                
                resultMessageView
                
                Spacer()
                
                LazyCenteredGrid(cellWidth: buttonWidth) {
                    ForEach(Dice.allCases, id: \.self) { dice in
                        Button {
                            resultMessage = "You rolled a \(dice.roll()) on a \(dice)-sided dice"
                        } label: {
                            Text("\(dice.rawValue)-sided")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                
            }
            .padding()
        }
    }
}

extension ContentView {
    private var titleView: some View {
        Text("Dugeon Dice")
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundStyle(.red)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
    }
    
    private var resultMessageView: some View {
        Text(resultMessage)
            .font(.largeTitle)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .frame(height: 150)
    }
}

#Preview {
    ContentView()
}
