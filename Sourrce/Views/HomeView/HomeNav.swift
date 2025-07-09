
//
//  HomeNav.swift
//  me
//
//  Created by Jamie Le Souef on 8/7/2025.
//
import SwiftUI

struct HomeNav: View {

  @EnvironmentObject private var router: Router
  
  var body: some View {
    VStack(alignment: .trailing, spacing: 20) {
      Button("About Me") {
        router.push(.about)
      }

      Button("History") {
        router.push(.history)
      }

      Button("Contact") {
        router.push(.contact)
      }

    }
    .frame(maxWidth: .infinity, alignment: .trailing)
    .ignoresSafeArea(.container, edges: .horizontal)
    .buttonStyle(LineSeparatorButtonStyle())
  }
}


#Preview {
  HomeNav()
    .environmentObject(Router())
}
