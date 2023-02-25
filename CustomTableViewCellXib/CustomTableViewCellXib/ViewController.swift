//
//  ViewController.swift
//  CustomTableViewCellXib
//
//  Created by shuxin on 2/21/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        cell.imageContainer.image = UIImage(named: "food\(indexPath.row)")
        cell.lblImage.text = "food \(indexPath.row)"
        
        return cell
    }

    
}

