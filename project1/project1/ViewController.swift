//
//  ViewController.swift
//  project1
//
//  Created by shuxin on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let img = ["Chichen Itza, Mexico", "Christ the Redeemer, Brazil", "Colosseum, Italy", "Great Wall of China, China", "Machu Picchu, Peru" ,"Taj Mahal, India"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.imgContainer.image = UIImage(named: "Wonders\(indexPath.row)")
        cell.lblLabel.text = "Wonders\(indexPath.row)"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue1", sender: self)
    }
    
    
    


}

