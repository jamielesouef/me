//
//  RouterTest.swift
//  meTests
//
//  Created by Jamie Le Souef on 3/7/2025.
//

import Testing

@testable import me

struct RouterTest {

  @Test
   func pushAddsRouteToPath() async throws{
     let router =  Router()
    router.push(.home)

     #expect(router.path == [.home])

     router.push(.detail(id: 42))
     #expect(router.path == [.home, .detail(id: 42)])
   }


}
