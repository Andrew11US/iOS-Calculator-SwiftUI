//
//  ContentView.swift
//  Calculator SwiftUI
//
//  Created by Andrew on 9/19/20.
//

import SwiftUI

struct ContentView: View {
    var buttons = [
        ["7", "8", "9", "X"],
        ["4", "5", "6", "X"],
        ["1", "2", "3", "X"],
        ["0", ".", ".", "="],
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("42")
                        .foregroundColor(.white)
                        .font(.system(size: 72))
                }.padding()
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Text(button)
                                .font(.system(size: 32, weight: .bold, design: .default))
                                .frame(width: getButtonWidth(), height: getButtonWidth(), alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.yellow)
                                .cornerRadius(getButtonWidth())
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func getButtonWidth() -> CGFloat {
        (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
