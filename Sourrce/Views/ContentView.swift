//
//  HomeView.swift
//  me
//
//  Created by Jamie Le Souef on 5/7/2025.
//

import SwiftUI

struct ContentView: View {

  @StateObject private var router = Router()

    var body: some View {
      NavigationStack(path: $router.path) {
        HomeView()
          .navigationDestination(for: AppRoute.self) { route in
            switch route {
            case .about:
              AboutView()
            case .history:
              HistoryView()
            case .contact:
              ContactView()
            }
          }
      }
      .environmentObject(router)
    }
}

#Preview {
    ContentView()
}
