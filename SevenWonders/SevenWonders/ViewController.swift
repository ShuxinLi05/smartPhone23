//
//  ViewController.swift
//  SevenWonders
//
//  Created by shuxin on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let arr = [("Great Wall of China", "China"), ("Petra", "Jordan"), ("Christ the Redeemer", "Brazil"), ("Machu Picchu", "Peru"), ("Chichen Itza", "Mexico"), ("Colosseum", "Italy"), ("Taj Mahal", "India")]
    
    let arr = ["Great Wall of China, China", "Petra, Jordan", "Christ the Redeemer, Brazil", "Machu Picchu, Peru", "Chichen Itza, Mexico", "Colosseum, Italy", "Taj Mahal, India"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        //cell.textLabel?.text = arr[indexPath.row]
        cell.imageContainer.image = UIImage(named: "Seven Wonders")
        cell.lblImage.text = "\(indexPath.row)"
        //cell.textLabel?.text = "\(title), \(city)"
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let DetailsTableViewController = UIViewController()
//        navigationController?.pushViewController(DetailsTableViewController, animated: true)
//
//        let (title, city) = arr[indexPath.row]
//        DetailsTableViewController.wonderTitle = title
//        DetailsTableViewController.wonderDescription = "This is the description of the \(title), located in \(city)."
//
//        //navigationController?.pushViewController(detailsVC, animated: true)
//
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell,
           let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsTableViewController") as? DetailsTableViewController {
            detailsVC.wonderTitle = cell.wonderTitle
            detailsVC.wonderDescription = cell.wonderDescription
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }



}

