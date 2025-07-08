//
//  RouterTest.swift
//  meTests
//
//  Created by Jamie Le Souef on 3/7/2025.
//

import Testing

@testable import me

struct RouterTest {

  @Test func testRouterInitialization() {
    let router = Router()
    #expect(router.path.isEmpty, "Router should initialize with an empty path")
  }

  @Test func testPushRoute() {
    let router = Router()
    router.push(.about)
    #expect(router.path.count == 1, "Path should contain one route after pushing")
    #expect(router.path.first == .about, "First route in path should be home")
  }

  @Test func testPopRoute() {
    let router = Router()
    router.push(.history)
    router.push(.about)
    router.pop()
    #expect(router.path.count == 1, "Path should contain one route after popping")
    #expect(router.path.first == .history, "First route in path should be home after popping")
  }

  @Test func testResetRoute() {
    let router = Router()
    router.push(.history)
    router.push(.about)
    router.reset()
    #expect(router.path.isEmpty, "Path should be empty after reset")
  }

}
