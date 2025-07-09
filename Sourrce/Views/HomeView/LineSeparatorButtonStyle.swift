//
//  LineSeparatorButtonStyle.swift
//  me
//
//  Created by Jamie Le Souef on 8/7/2025.
//

import SwiftUI

struct LineSeparatorButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity, alignment: .trailing)
      .padding(.vertical, 12)
      .background(Color.clear)
      .overlay(
        Rectangle()
          .frame(height: 1)
          .foregroundColor(Color.secondary.opacity(0.25)),
        alignment: .bottom
      )
      .opacity(configuration.isPressed ? 0.6 : 1)
  }
}
