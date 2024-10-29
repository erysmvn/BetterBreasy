//
//  MachineItem.swift
//  BetterBreasy
//
//  Created by erysmvn on 29/10/24.
//

import SwiftUI

struct MachineItem: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Text(icon).padding(.all, 20)
                    .font(.system(size: 40))
                    .background(
                    RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 0))
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .opacity(0.5))
            }
        }
    }
}

struct MachineItem_Previews: PreviewProvider {
    static var previews: some View {
        MachineItem(icon: "value") {
            // action
        }
    }
}

