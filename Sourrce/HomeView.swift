//
//  ContentView.swift
//  me
//
//  Created by Jamie Le Souef on 1/7/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {

  @EnvironmentObject private var router: Router

  func makeHeader() -> some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("Jamie Le Souef")
        .font(.largeTitle)
      Text("iOS, MacOs Software Engineer")
        .font(.title2)
      Text("and self confessed Apple fanboy")
        .font(.title2)
    }
  }

  func makeMenu() -> some View {
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
    .padding()
    .background(Color.gray.opacity(0.2))
    .cornerRadius(10)
  }

  var body: some View {
    VStack {
      makeHeader()
      Spacer()
      makeMenu()
    }
    .environmentObject(router)
  }

}

#Preview {
  HomeView()
    .modelContainer(for: Me.self, inMemory: true)
}
