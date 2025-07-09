//
//  PositionDTOTest.swift
//  meTests
//
//  Created by Jamie Le Souef on 9/7/2025.
//

import Foundation
import Testing
@testable import me



@Suite
struct ProfileDTOTests {
  
  private var decoder: JSONDecoder {
    let d = JSONDecoder()
    return d
  }
  
  private let json = """
    {
      "experiences": [
        {
          "company": "Test Company",
          "company_url": "https://example.com",
          "logo_url": "https://example.com/logo.png",
          "total_duration": "1 yr",
          "positions": [
            {
              "title": "Developer",
              "employment_type": "Full-time",
              "date_range": "Jan 2020 - Dec 2020",
              "duration": "1 yr",
              "location": "Test City",
              "description": ["Did X", "Did Y"],
              "skills": ["GraphQL", "REST APIs"]
            }
          ]
        }
      ]
    }
"""
  
  @Test("Decodes ProfileDTO from valid JSON")
  func testProfileDTODecoding() async throws {
    
    let data = json.data(using: .utf8)!
    let profileDTO = try decoder.decode(ProfileDTO.self, from: data)
    
    #expect(profileDTO.experiences.count == 1)
    
    let exp = profileDTO.experiences[0]
    #expect(exp.company == "Test Company")
    #expect(exp.companyURL == URL(string: "https://example.com"))
    #expect(exp.logoURL == URL(string: "https://example.com/logo.png"))
    #expect(exp.totalDuration == "1 yr")
    #expect(exp.positions.count == 1)
    
    let pos = exp.positions[0]
    #expect(pos.title == "Developer")
    #expect(pos.employmentType == "Full-time")
    #expect(pos.dateRange == "Jan 2020 - Dec 2020")
    #expect(pos.duration == "1 yr")
    #expect(pos.location == "Test City")
    #expect(pos.positionDescription == ["Did X", "Did Y"] )
    #expect(pos.skills == [.graphQL, .restAPIs])
  }
  
  @Test("Maps Skill enum raw values correctly")
  func testSkillEnumRawValueMapping() async throws {
    #expect(Skill.graphQL.rawValue == "GraphQL")
    #expect(Skill.restAPIs.rawValue == "REST APIs")
    #expect(Skill.softwareDevelopment.rawValue == "Software Development")
    
    #expect(Skill(rawValue: "GraphQL") == .graphQL)
    #expect(Skill(rawValue: "REST APIs") == .restAPIs)
    
    #expect(throws: (any Error).self) {
    
      _ = try decoder.decode([Skill].self, from: Data("[\"Unknown Skill\"]".utf8))
    }
  }
  
  
  @Test("Transforms valid JSON into Profile correctly")
  func testTransformProducesCorrectProfile() async throws {
    let profile = try await ProfileDataTransformer.transform(from: json)
    
    // Verify top-level Profile
    #expect(profile.experiences.count == 1)
    
    // Verify Experience
    let exp = profile.experiences[0]
    #expect(exp.company == "Test Company")
    #expect(exp.companyURL == URL(string: "https://example.com"))
    #expect(exp.logoURL == URL(string: "https://example.com/logo.png"))
    #expect(exp.totalDuration == "1 yr")
    #expect(exp.positions.count == 1)
    
    // Verify Position
    let pos = exp.positions[0]
    #expect(pos.title == "Developer")
    #expect(pos.employmentType == "Full-time")
    #expect(pos.dateRange == "Jan 2020 - Dec 2020")
    #expect(pos.duration == "1 yr")
    #expect(pos.location == "Test City")
    #expect(pos.positionDescription == ["Did X", "Did Y"] )
    #expect(pos.skills == [.graphQL, .restAPIs])
  }
  
  @Test("Throws error for malformed JSON")
    func invalidJSONThrows() async throws {
      let invalidJSON = "{ invalid json }"
      
      // Could not get it to actually check for TransformationError.invalidData
      // Could not get around Main actor-isolated conformance of 'TransformationError' to 'Equatable' cannot satisfy conformance requirement for a 'Sendable' type parameter
      await #expect(throws: (any Error).self) {
        // call the async-throwing API
        _ = try await ProfileDataTransformer.transform(from: invalidJSON)
      }
    }
}
