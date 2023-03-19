//
//  ViewController.swift
//  APICall
//
//  Created by shuxin on 3/18/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner


class ViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var NameSymbol: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var webLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func detalAction(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else {return}
        let url = "\(baseURL)\(symbol)?apikey=\(apikey)"
        
        SwiftSpinner.show("Getting Company details for \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil{
                print("Error in response")
                return
            }
            
            guard let rawData  = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let company = jsonArray.first else {return}
            print(company)
            let symbol = company["symbol"].stringValue
            let companyName = company["companyName"].stringValue
            let price = company["price"].doubleValue
            let website = company["website"].stringValue
            
            print("Symbol = \(symbol)" )
            print("companyName = \(companyName)" )
            print("price = \(price)" )
            print("website = \(website)" )
            self.NameSymbol.text = "CompanyName = \(companyName)"
            self.priceLabel.text = "Price = \(price) $"
            self.webLabel.text = "Website = \(website)"
            
            
            
            
        }
    }
    
}

