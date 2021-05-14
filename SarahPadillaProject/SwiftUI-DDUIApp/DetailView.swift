//
//  DetailView.swift
//  Randomizer Project
//
//  Created by Sarah Padilla
//

import SwiftUI

// Allows for custom hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


struct DetailView: View {
    // Question user asks
    @State private var lblStr: String = ""
    
    // Button text
    @State private var btnStr1: String = "Ask"
    @State private var btnStr2: String = "Toss"
    @State private var btnStr3: String = "Roll"
    
    // User input
    @State private var name: String = ""
    
    // Fortune displayed
    @State private var fortune: String = ""
    
    var randomizer : RandomizerDO
    var body: some View {
        VStack {
            Text("\(randomizer.name)").font(Font.system(size:30, design: .default))
            if (randomizer.view == 1) {
                // Title with users question
                HStack(spacing: 10) {
                    Text("\(lblStr)").shadow(radius: 5).foregroundColor(Color.init(hex: "#212226")).padding(10).frame(maxWidth: .infinity, maxHeight: .infinity).padding(10)
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center).fixedSize(horizontal: false, vertical: true).shadow(radius: 5)
                
                // Fourtune to question
                HStack {
                    Text("\(fortune)")
                        .foregroundColor(Color.init(hex: "#ffffff"))
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 200, height: 200)
                        .background(Circle().strokeBorder(Color.init(hex: "#513A96"), lineWidth: 4)
                                        .background(Circle().fill(Color.init(hex: "#343660"))).shadow(radius: 3))
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxHeight: 200).padding(10)
                
                
                // Input for question
                TextField("Ask me a question", text: $name).padding(8).background(Color.init(hex: "#efefef")).foregroundColor(Color.init(hex: "#ff77bd"))
                
                // Button to reveal fortune
                HStack {
                    Button(action: {
                        lblStr = name
                        btnStr1 = "Ask Again"
                        fortune = (randomizer.options).randomElement()!
                    }, label: {
                        Text("\(btnStr1)").foregroundColor(Color.init(hex: "#ffffff")).padding(8)
                    }).background(Color.init(hex: "#212226"))
                }.frame(maxWidth: .infinity, alignment: .center).padding(8)
            }
            if (randomizer.view == 2) {
                // Quarter
                HStack {
                    Text("\(fortune)")
                        .foregroundColor(Color.init(hex: "#212226"))
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 200, height: 200)
                        .background(Circle().strokeBorder(Color.init(hex: "#cdd8da"), lineWidth: 4)
                                        .background(Circle().fill(Color.init(hex: "#cdd8da"))).shadow(radius: 3))
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxHeight: 200).padding(30)
                
                // Button to flip quarter
                HStack {
                    Button(action: {
                        lblStr = name
                        btnStr2 = "Toss Again"
                        fortune = (randomizer.options).randomElement()!
                    }, label: {
                        Text("\(btnStr2)").foregroundColor(Color.init(hex: "#ffffff")).padding(8)
                    }).background(Color.init(hex: "#212226"))
                }.frame(maxWidth: .infinity, alignment: .center).padding(8)
            }
            if (randomizer.view == 3) {
                // Dice with Number
                HStack {
                    Text("\(fortune)").font(Font.system(size:40, design: .default))
                        .foregroundColor(Color.init(hex: "#ffffff"))
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 200, height: 200)
                        .background(Rectangle().strokeBorder(Color.init(hex: "#a4312a"), lineWidth: 4)
                                        .background(Rectangle().fill(Color.init(hex: "#a4312a"))).shadow(radius: 3))
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxHeight: 200).padding(30)
                
                // Button to roll dice
                HStack {
                    Button(action: {
                        lblStr = name
                        btnStr3 = "Roll Again"
                        fortune = (randomizer.options).randomElement()!
                    }, label: {
                        Text("\(btnStr3)").foregroundColor(Color.init(hex: "#ffffff")).padding(8)
                    }).background(Color.init(hex: "#212226"))
                }.frame(maxWidth: .infinity, alignment: .center).padding(8)
            }
        }.frame(maxHeight: .infinity, alignment: Alignment.top).padding(10)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(randomizer: RandomizerDO(name: "Magic 8", options: [""], view: 1))
    }
}
