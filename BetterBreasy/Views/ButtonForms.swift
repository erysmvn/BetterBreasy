//
//  ButtonForms.swift
//  BetterBreasy
//
//  Created by erysmvn on 27/10/24.
//

import SwiftUI

struct ButtonForms: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                Text(title).bold().foregroundColor(Color.white)
            }
        }
    }
}

struct ButtonForms_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForms(title: "value", background: .mint) {
            // action
        }
    }
}
