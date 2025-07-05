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
  @Environment(\.meStore) private var meStore
  
  @Query private var me: [Me]
  
  @StateObject private var router = Router()
  
  private func fetchMeIfNeeded() async {
    guard me.isEmpty else { return }
    do {
      let me = try await meStore.fetchMe()
      modelContext.insert(me ?? Me())
    }
    catch {
      
    }
  }
  
  var body: some View {
    NavigationStack(path: $router.path) {
      
    }
    .task {
      await fetchMeIfNeeded()
    }
    .environmentObject(router)
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Me.self, inMemory: true)
}
