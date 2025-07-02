//
//  Item.swift
//  me
//
//  Created by Jamie Le Souef on 1/7/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
