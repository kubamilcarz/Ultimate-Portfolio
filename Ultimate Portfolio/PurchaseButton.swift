//
//  PurchaseButton.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 11/9/23.
//

import SwiftUI

struct PurchaseButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 200, minHeight: 44)
            .background(Color(.lightBlue))
            .clipShape(.capsule)
            .foregroundStyle(.white)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
