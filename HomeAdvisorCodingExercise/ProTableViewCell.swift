//
//  ProTableViewCell.swift
//  HomeAdvisorCodingExercise
//
//  Created by Thomas on 6/21/17.
//  Copyright © 2017 ThomasGraninger. All rights reserved.
//

import UIKit

class ProTableViewCell: UITableViewCell {

	@IBOutlet weak var proNameLabel: UILabel!
	@IBOutlet weak var proRatingLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func setCellData(_ pro: Pro) {
		proNameLabel.text = pro.companyName
		
		proRatingLabel.text = setRatingLabelText(ratingCount: pro.ratingCount, rating: pro.compositeRating)
		proRatingLabel.textColor = setRatingLabelColor(rating: pro.compositeRating)
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
