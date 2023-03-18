//
//  ViewController.swift
//  MakeAPICall
//
//  Created by Selina Liu on 3/18/23.
//

import UIKit
import SwiftyJSON
import Alamofire
import SwiftSpinner

class ViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblWebsite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getStockDetails(_ sender: Any) {

        guard let symbol = txtStockSymbol.text else {return}
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        
        //LOADING IMAGE
        SwiftSpinner.show("Getting stock price for \(symbol.uppercased())")
        
        AF.request(url).responseJSON { response in
            //even I get error, i have to hide it
            SwiftSpinner.hide()
            //nil == null
            if response.error != nil {
                print("Error in response")
                return
            }
            //at this point, i got the valid response
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}

            let symbol = stock["symbol"].stringValue
            let price = stock["price"].doubleValue
            let webs = stock["website"].stringValue
            let company = stock["companyName"].stringValue
            
            print("Symbol = \(symbol)")
            print("Price = \(price)")
            print("Website = \(webs)")
            print("Company = \(company)")
            
            self.lblCompanyName.text = "Company: \(company)"
            self.lblPrice.text = "Price = $ \(price)"
            self.lblWebsite.text = "Website: \(webs)"
        }
    }
}

