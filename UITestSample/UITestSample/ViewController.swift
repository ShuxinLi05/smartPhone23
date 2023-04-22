//
//  ViewController.swift
//  UITestSample
//
//  Created by shuxin on 4/21/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
        
        if(email != "abcd@test.com" || password != "12345"){
            lblStatus.isHidden = false
            lblStatus.text = "please enter valid email/password"
            return
        }
        lblStatus.isHidden = true
        performSegue(withIdentifier: "segueLogin", sender: self)
        
        
    }


}

