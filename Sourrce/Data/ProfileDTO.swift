//
//  ProfileDTO.swift
//  me
//
//  Created by Jamie Le Souef on 9/7/2025.
//


import Foundation
import SwiftData

struct ProfileDTO: Decodable {
  let experiences: [ExperienceDTO]
}

struct ExperienceDTO: Decodable {
  
  nonisolated private enum CodingKeys: String, CodingKey {
     case company
     case companyURL = "company_url"
     case logoURL = "logo_url"
     case totalDuration = "total_duration"
     case positions
   }
  
  let company: String
  let companyURL: URL?
  let logoURL: URL?
  let totalDuration: String?
  let positions: [PositionDTO]
}

struct PositionDTO: Decodable {
  
  nonisolated private enum CodingKeys: String, CodingKey {
    case title
    case employmentType = "employment_type"
    case dateRange = "date_range"
    case duration
    case location
    case positionDescription = "description"
    case skills
  }
  
  let title: String
  let employmentType: String?
  let dateRange: String
  let duration: String
  let location: String?
  let positionDescription: [String]?
  let skills: [Skill]
}

struct ProfileDataTransformer {
  
  enum TransformationError: Error, Equatable, Sendable {
    case invalidData
  }
  
  static func transform(from json: String) async throws -> Profile{
    guard let data = json.data(using: .utf8) else  {
      throw TransformationError.invalidData
    }
    
    let decoder = JSONDecoder()
//    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let dto = try decoder.decode(ProfileDTO.self, from: data)
    
    let profile = Profile()
    for expDTO in dto.experiences {
      let exp = Experience(
        company: expDTO.company,
        companyURL: expDTO.companyURL,
        logoURL: expDTO.logoURL,
        totalDuration: expDTO.totalDuration
      )
      
      for posDTO in expDTO.positions {
        let pos = Position(
          title: posDTO.title,
          employmentType: posDTO.employmentType,
          dateRange:posDTO.dateRange,
          duration: posDTO.duration,
          location: posDTO.location,
          positionDescription: posDTO.positionDescription,
          skills: posDTO.skills
        )
        exp.positions.append(pos)
      }
      
      profile.experiences.append(exp)
    }
    
    return profile
  }
}
