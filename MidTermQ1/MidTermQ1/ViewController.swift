//
//  ViewController.swift
//  MidTermQ1
//
//  Created by shuxin on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let wonderName = ["Chichén Itzá, Mexico", "Christ the Redeemer, Brazil", "Machu Picchu, Peru", "Petra, Jordan", "The Colosseum, Rome, Italy", "The Great Wall Of China, China", "The Taj Mahal, India"]
    var wonderDetail = ""
    
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wonderName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.wondersImage.image = UIImage(named: "Wonders \(indexPath.row)")
        cell.lblName.text = "\(wonderName[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblView {
            wonderDetail = wonderName[indexPath.row]
            performSegue(withIdentifier: "segueOne", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender seender: Any?) {
        if segue.identifier == "segueOne" {
            let secondVC = segue.destination as! segueViewController
            secondVC.wonderDetail = wonderDetail
        }
    }
    
    
}

