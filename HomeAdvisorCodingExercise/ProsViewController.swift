//
//  ProsViewController.swift
//  HomeAdvisorCodingExercise
//
//  Created by Thomas on 6/21/17.
//  Copyright © 2017 ThomasGraninger. All rights reserved.
//

import UIKit

class ProsViewController: UIViewController {

	@IBOutlet weak var prosTableView: UITableView!
	
	var dataStore: [Pro]?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		JSONDataClient().fetchProData { (pros) in
			//self.dataStore = pros
			self.prosTableView.reloadData()
		}
		
		self.navigationItem.title = "Pros"
		
		self.tableViewSetup()
    }
	
	func tableViewSetup() {
		prosTableView.rowHeight = UITableViewAutomaticDimension
		prosTableView.estimatedRowHeight = 60
		
		prosTableView.register(UINib(nibName: "ProTableViewCell", bundle: nil), forCellReuseIdentifier: "ProTableViewCell")
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ProsViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataStore?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ProTableViewCell", for: indexPath) as! ProTableViewCell
		
		let pro: Pro = dataStore![indexPath.row]
		
		cell.setCellData(pro)
		
		return cell
	}
}

extension ProsViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		let detailsViewController = DetailsViewController()
		
		detailsViewController.selectedPro = dataStore![indexPath.row]
		
		self.navigationController?.pushViewController(detailsViewController, animated: true)
	}
}
