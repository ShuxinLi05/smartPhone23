//
//  DetailsTableViewController.swift
//  SevenWonders
//
//  Created by shuxin on 3/18/23.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    
    var wonderDescription: String?
    var wonderTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let description = wonderDescription {
            textContainer.text = description
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   
    @IBOutlet weak var textContainer: UITextView!
    
    
    
}
