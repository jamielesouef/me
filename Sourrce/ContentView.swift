//
//  ContentView.swift
//  me
//
//  Created by Jamie Le Souef on 1/7/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  
  @StateObject private var router = Router()
  
  var body: some View {
    NavigationStack(path: $router.path) {
      
    }
    .environmentObject(router)
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
