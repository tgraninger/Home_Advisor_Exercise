//
//  GroupedProsTableViewController.swift
//  HomeAdvisorCodingExercise
//
//  Created by Thomas on 6/28/17.
//  Copyright © 2017 ThomasGraninger. All rights reserved.
//

import UIKit

class GroupedProsTableViewController: UIViewController {

	@IBOutlet weak var groupedProsTableView: UITableView!
	
	var keys: [String]?
	var dataStore: [String: [Pro]]?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.tableViewSetup()

		JSONDataClient().fetchProData { (pros) in
			self.dataStore = pros
			self.keys = Array(pros.keys).sorted(by: { $0 < $1 } )
			
			self.groupedProsTableView.reloadData()
		}
		
		self.navigationItem.title = "Pros"
    }
	
	func tableViewSetup() {
		groupedProsTableView.rowHeight = UITableViewAutomaticDimension
		groupedProsTableView.estimatedRowHeight = 60
		
		groupedProsTableView.register(UINib(nibName: "ProTableViewCell", bundle: nil), forCellReuseIdentifier: "ProTableViewCell")
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GroupedProsTableViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return keys?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let key = self.keys?[section] {
			return dataStore![key]!.count
		}
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ProTableViewCell", for: indexPath) as! ProTableViewCell
		
		let pro = dataStore![keys![indexPath.section]]?[indexPath.row]
		
		cell.setCellData(pro!)
		
		return cell
	}
}

extension GroupedProsTableViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return self.keys != nil ? self.keys?[section] : ""
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		let detailsViewController = DetailsViewController()
		
		let selectedPro = dataStore![keys![indexPath.section]]?[indexPath.row]
		
		detailsViewController.selectedPro = selectedPro
		
		self.navigationController?.pushViewController(detailsViewController, animated: true)
	}
}
