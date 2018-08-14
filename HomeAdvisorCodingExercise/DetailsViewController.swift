//
//  DetailsViewController.swift
//  HomeAdvisorCodingExercise
//
//  Created by Thomas on 6/21/17.
//  Copyright © 2017 ThomasGraninger. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
	
	@IBOutlet weak var companyNameLabel: UILabel!
	@IBOutlet weak var specialtyLabel: UILabel!
	@IBOutlet weak var ratingsLabel: UILabel!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var servicesLabel: UILabel!
	@IBOutlet weak var overviewTextView: UITextView!
	
	var selectedPro: Pro!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.navigationItem.title = "Details"
		
		self.edgesForExtendedLayout = []
		
		self.automaticallyAdjustsScrollViewInsets = false
    }
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.overviewTextView.setContentOffset(.zero, animated: false)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		self.companyNameLabel.text = selectedPro.companyName
		self.specialtyLabel.text = selectedPro.specialty
		self.locationLabel.text = selectedPro.primaryLocation
		self.overviewTextView.text = selectedPro.companyOverview
		self.servicesLabel.text = selectedPro.servicesOffered
		self.ratingsLabel.text = setRatingLabelText(ratingCount: selectedPro.ratingCount,
		                                            rating: selectedPro.compositeRating)
	}
	
	@IBAction func callButtonPressed(_ sender: Any) {
		if let phone = selectedPro.phoneNumber {
			print("phone = \(phone)")
		}
	}
	
	@IBAction func emailButtonPressed(_ sender: Any) {
		if let email = selectedPro.email {
			print("email = \(email)")
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
