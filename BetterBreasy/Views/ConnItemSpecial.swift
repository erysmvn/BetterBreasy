//
//  ConnItemSpecial.swift
//  BetterBreasy
//
//  Created by erysmvn on 30/10/24.
//

import SwiftUI

struct ConnItemSpecial: View {
    let number: String
    let textSize: CGFloat
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Text(number).padding(.all, 15).foregroundColor(Color.white)
                    .font(.system(size: textSize))
                    .background(
                        Circle()
                            .stroke(Color.black, lineWidth: 0)).padding()
                    .background(Circle()
                        .fill(background)
                    .opacity(0.5))
            }.padding(.all, 5)
        }
    }
}

struct ConnItemSpecial_Previews: PreviewProvider {
    static var previews: some View {
        ConnItemSpecial(number: "value", textSize: 0, background: .black) {
            // action
        }
    }
}

