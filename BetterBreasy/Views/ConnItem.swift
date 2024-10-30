//
//  ConnItem.swift
//  BetterBreasy
//
//  Created by erysmvn on 30/10/24.
//

import SwiftUI

struct ConnItem: View {
    let number: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Text(number).padding(.all, 20).foregroundColor(Color.white)
                    .font(.system(size: 40))
                    .background(
                        Circle()
                            .stroke(Color.black, lineWidth: 0)).padding()
                    .background(Circle()
                    .fill(Color.gray)
                    .opacity(0.5))
            }.padding(.all, 5)
        }
    }
}

struct ConnItem_Previews: PreviewProvider {
    static var previews: some View {
        ConnItem(number: "value") {
            // action
        }
    }
}

