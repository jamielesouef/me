//
//  ContentView.swift
//  me
//
//  Created by Jamie Le Souef on 1/7/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {

  var body: some View {
    VStack {
      HomeHeader()
        .padding()
      Spacer()
      HomeNav()
        .padding()
    }
  }

}

#Preview {
  HomeView()
    .modelContainer(for: Me.self, inMemory: true)
}
