//
//  ContentView.swift
//  Calculator SwiftUI
//
//  Created by Andrew on 9/19/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(["1", "2", "3"], id: \.self) { button in
                    Text(button)
                        .font(.system(size: 32, weight: .bold, design: .default))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
