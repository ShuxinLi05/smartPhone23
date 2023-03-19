//
//  segueViewController.swift
//  MidTermQ1
//
//  Created by shuxin on 3/18/23.
//

import UIKit

class segueViewController: UIViewController {
    @IBOutlet weak var lblDetails: UILabel!
    
    var wonderDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDetails.text = "Detail for \(wonderDetail)"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
