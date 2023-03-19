//
//  ViewController.swift
//  Q1
//
//  Created by shuxin on 3/18/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let imageNames = ["Great Wall of China, China", "Petra, Jordan", "Christ the Redeemer, Brazil", "Machu Picchu, Peru", "Chichen Itza, Mexico", "Colosseum, Italy", "Taj Mahal, India"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.imgContainer.image = UIImage(named: "Seven Wonders Images\(indexPath.row)")
        //cell.lblImage.text = "Seven Wonders\(indexPath.row)"
        
        return cell
    }


}

