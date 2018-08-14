//
//  Helpers.swift
//  HomeAdvisorCodingExercise
//
//  Created by Thomas on 6/21/17.
//  Copyright © 2017 ThomasGraninger. All rights reserved.
//

import UIKit
import Foundation

func setRatingLabelText(ratingCount: Int, rating: Double) -> String {
	if ratingCount != 0 {
		return String("Rating: \(ratingCount) | \(rating) rating(s)")
	} else {
		return "References Available"
	}
}

func setRatingLabelColor(rating: Double) -> UIColor {
	if rating >= 4.0 {
		return UIColor.green
	} else if rating < 4.0 && rating >= 3.0 {
		return UIColor.orange
	} else if rating < 3.0 && rating > 0 {
		return UIColor.red
	} else {
		return UIColor.black
	}
}
