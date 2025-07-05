//
//  MeStore.swift
//  me
//
//  Created by Jamie Le Souef on 3/7/2025.
//

import Foundation
import SwiftUI

struct MEStore {
 
  func fetchMe() async throws -> Me? {
    
    return nil
  }
  
  
  func saveMe(_ me: Me) async throws {
    
  }
  
  
  func fetchAllJobs()  async throws  -> [Job] {
    
    return []
  }
  
  
  func saveJob(_ job: Job) async throws  {
    
  }
}


private struct MEStoreKey: EnvironmentKey {
  static let defaultValue = MEStore()
}

extension EnvironmentValues {
  var meStore: MEStore {
    get { self[MEStoreKey.self] }
    set { self[MEStoreKey.self] = newValue }
  }
}
