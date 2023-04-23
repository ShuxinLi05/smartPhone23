//
//  HomeViewController.swift
//  Final
//
//  Created by shuxin on 4/22/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UploadImageProtocol {

    @IBOutlet weak var tblView: UITableView!
    
    var images : [UIImage] = [UIImage]()
    var locations = [String]()
    var imageTitles :[String] = [String]()
    var uploadImageVC : UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImageVC = navigationController?.tabBarController?.viewControllers?[1]
        print(uploadImageVC?.title)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = images[indexPath.row]
        cell.textLabel?.text = "\(imageTitles[indexPath.row]),\(locations[indexPath.row])"
        return cell
    }
    
    func uploadedImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        images.append(img)
        locations.append(locationImg)
        imageTitles.append(titleImg)
        
        tblView.reloadData()
    }


}
