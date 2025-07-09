//
//  HomeHeader.swift
//  me
//
//  Created by Jamie Le Souef on 8/7/2025.
//

import SwiftUI

public struct HomeHeader: View {
  public var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("Jamie Le Souef")
        .font(.largeTitle)
      Text("iOS, MacOS Software Engineer")
        .font(.title3)
      Text("and self confessed Apple fanboy")
        .font(.title3)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .ignoresSafeArea(.container, edges: .horizontal)
  }
}

#Preview {
  HomeHeader()
    
}
