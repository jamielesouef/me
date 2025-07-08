//
//  router.me.swift
//  me
//
//  Created by Jamie Le Souef on 3/7/2025.
//

import SwiftUI
import Combine // no idea why this wants to be imported here!? Beta issue maybe

enum AppRoute: Hashable {
  case about
  case history
  case contact
}

final class Router: ObservableObject {
  
  @Published var path: [AppRoute] = []

  func push(_ route: AppRoute) {
    path.append(route)
  }
  
  func pop() {
    _ = path.popLast()
  }
  
  func reset(to route: AppRoute? = nil) {
    path.removeAll()
    if let route = route {
      path.append(route)
    }
  }
}
