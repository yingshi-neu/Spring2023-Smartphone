//
//  ViewController.swift
//  App for Restaurants and their Food
//
//  Created by Selina Liu on 2/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblViewTop: UITableView!
    
    @IBOutlet weak var tblViewBottom: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //create an empty string for the later use
    var selectedRestaurant = ""
    //create a dictionary
    let menus = ["Panada Express": ["Fryed rice","Chow fun","Orange chicken", "Tao's chicken"], "Jade Garden": ["Steam bun", "Steam pork ribs", "Egg tart", "Chow mien"], "McCafe": ["Cheese burger","French fries", "Diet coke"]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewTop {
            return menus.keys.count
        } else {
            let food = menus[selectedRestaurant] ?? []
            return food.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblViewTop {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Top Cell", for: indexPath)
            cell.textLabel?.text = menus.keys.sorted()[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Bottom Cell", for: indexPath)
            let food = menus[selectedRestaurant] ?? []
            cell.textLabel?.text = food[indexPath.row]
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //once the user select the row at the table view top, we now get the respective information for table view bottom
        if tableView == tblViewTop {
            let restaurant = tableView.cellForRow(at: indexPath)?.textLabel?.text ?? ""
            selectedRestaurant = restaurant
            tblViewBottom.reloadData()
        }
    }
    
    



}

