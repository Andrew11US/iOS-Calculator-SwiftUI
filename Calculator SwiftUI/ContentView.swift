//
//  ContentView.swift
//  Calculator SwiftUI
//
//  Created by Andrew on 9/19/20.
//

import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine, dot
    case equals, multiply, divide, plus, minus
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .dot: return "."
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .divide: return "/"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        default: return "AC"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
            return Color(.darkGray)
        case .equals, .multiply, .divide, .plus, .minus:
            return Color(.systemOrange)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default: return .gray
        }
    }
}

// Env object
class GlobalEnvironment: ObservableObject {
    @Published var display = ""
    
    func recieveInput(button: CalculatorButton) {
        display = button.title
    }
}

struct ContentView: View {
    @EnvironmentObject var env: GlobalEnvironment
    
    var buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .dot, .equals],
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                HStack(alignment: .center) {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 72))
                }.padding()
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonview(button: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
}

struct CalculatorButtonview: View {
    @EnvironmentObject var env: GlobalEnvironment
    var button: CalculatorButton
    
    var body: some View {
        Button(action: {
            env.recieveInput(button: button)
        }, label: {
            Text(button.title)
                .font(.system(size: 32, weight: .bold, design: .default))
                .frame(width: getButtonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4, alignment: .center)
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(getButtonWidth(button: button))
        })
    }
    
    private func getButtonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        } else {
            return (UIScreen.main.bounds.width - 5 * 12) / 4
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
