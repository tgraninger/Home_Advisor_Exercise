//
//  JSONDataClient.swift
//  HomeAdvisorCodingExercise
//
//  Created by Thomas on 6/21/17.
//  Copyright © 2017 ThomasGraninger. All rights reserved.
//

import Foundation
import Alamofire

class JSONDataClient {
	
	func fetchProData(_ completionHandler: @escaping ([String: [Pro]]) -> ()) {
		let path = Bundle.main.path(forResource: "pro_data", ofType: "json")
		let url = URL.init(fileURLWithPath: path!)
		
		Alamofire.request(url).responseJSON { (responseData) in
			if responseData.result.value != nil {
				if let data = responseData.result.value! as? [AnyObject] {
					
					var groupedPros = [String : [Pro]]()
					var prosWithoutSpeciality: [Pro]?
					
					// Iterate over pro data and group by speciality in ascending order
					for object in data {
						let pro = Pro(object as! [String : Any])
						
						if pro.specialty != "" {
							// Service exists?
							if let array = groupedPros[pro.specialty] {
								var a = array
								a.append(pro)
								groupedPros[pro.specialty] = a
							} else {
								groupedPros[pro.specialty] = [pro]
							}
						} else {
							prosWithoutSpeciality = prosWithoutSpeciality ?? [Pro]()
							prosWithoutSpeciality?.append(pro)
						}
					}
					
					groupedPros["Other"] = prosWithoutSpeciality
					
					for key in groupedPros.keys {
						groupedPros[key] = groupedPros[key]?.sorted(by: { $0.companyName < $1.companyName })
					}
					
					completionHandler(groupedPros)
				}
			}
		}
	}
}
