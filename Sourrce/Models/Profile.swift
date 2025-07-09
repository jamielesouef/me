//
//  Profile.swift
//  me
//
//  Created by Jamie Le Souef on 9/7/2025.
//


import SwiftData
import Foundation

@Model
final class Profile {
  @Relationship var experiences: [Experience] = []

  init(experiences: [Experience] = []) {
    self.experiences = experiences
  }
}

@Model
final class Experience {
  var company: String
  var companyURL: URL?
  var logoURL: URL?
  var totalDuration: String?
  
  @Relationship var positions: [Position] = []

  init(
    company: String,
    companyURL: URL? = nil,
    logoURL: URL? = nil,
    totalDuration: String? = nil,
    positions: [Position] = []
  ) {
    self.company = company
    self.companyURL = companyURL
    self.logoURL = logoURL
    self.totalDuration = totalDuration
    self.positions = positions
  }
}

@Model
final class Position {
  var title: String
  var employmentType: String?
  var dateRange: String
  var duration: String
  var location: String?
  var positionDescription: [String]?
  
  @Attribute var skills: [Skill] = []

  init(
    title: String,
    employmentType: String? = nil,
    dateRange: String,
    duration: String,
    location: String? = nil,
    positionDescription: [String]? = nil,
    skills: [Skill] = []
  ) {
    self.title = title
    self.employmentType = employmentType
    self.dateRange = dateRange
    self.duration = duration
    self.location = location
    self.positionDescription = positionDescription
    self.skills = skills
  }
}

enum Skill: String, Codable, CaseIterable {
  case graphQL = "GraphQL"
  case technicalLeadership = "Technical Leadership"
  case restAPIs = "REST APIs"
  case swift = "Swift (Programming Language)"
  case softwareDevelopment = "Software Development"
}
