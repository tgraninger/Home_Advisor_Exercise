//
//  ProModel.swift
//  HomeAdvisorCodingExercise
//
//  Created by Thomas on 6/21/17.
//  Copyright © 2017 ThomasGraninger. All rights reserved.
//

import Foundation

class Pro {
	
	var entityId: String!
	var companyName: String!
	var ratingCount: Int!
	var compositeRating: Double!
	var companyOverview: String!
	var canadianSP: Bool!
	var spanishSpeaking: Bool!
	var phoneNumber: String!
	var latitude: Double!
	var longitude: Double!
	var servicesOffered: String!
	var specialty: String!
	var primaryLocation: String!
	var email: String!
	
	init(_ data: [String : Any]) {
		self.entityId = data["entityId"] as? String ?? ""
		self.companyName = data["companyName"] as? String ?? ""
		self.companyOverview = data["companyOverview"] as? String ?? ""
		self.canadianSP = data["canadianSP"] as? Bool ?? false
		self.spanishSpeaking = data["spanishSpeaking"] as? Bool ?? false
		self.phoneNumber = data["phoneNumber"] as? String ?? ""
		self.latitude = data["latitude"] as? Double ?? 0.0
		self.longitude = data["longitude"] as? Double ?? 0.0
		self.servicesOffered = data["servicesOffered"] as? String ?? "Services Not Available"
		self.specialty = data["specialty"] as? String ?? ""
		self.primaryLocation = data["primaryLocation"] as? String ?? ""
		self.email = data["email"] as? String ?? ""
		
		let ratingCount: String = data["ratingCount"] as? String ?? ""
		self.ratingCount = Int(ratingCount) ?? 0
		
		let compositeRating: String = (data["compositeRating"] as? String) ?? ""
		self.compositeRating = Double(compositeRating) ?? 0
	}
}
