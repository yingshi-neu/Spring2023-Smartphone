//
//  ViewController.swift
//  SevenWonders
//
//  Created by Selina Liu on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let arr = ["Machu Picchu, Cusco Region", "Great Wall of China, Beijing", "Taj Mahal, Agra", "Colosseum,Rome", "Petra, Ma'an Governorate", "Chichén Itzá, Yucatán","Christ the Redeemer, Corcovado"]
    let imageNames = ["MachuPicchu","greatWall","tajMahal","Colosseom","Petra","chichenItza","christ"]
    
    //create an empty int for the later use
    var selectedWonder = 0

    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.imageContainer.image = UIImage(named: imageNames[indexPath.row])
        cell.lblImage.text = arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWonder = indexPath.row
        performSegue(withIdentifier: "segueDetails", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    //before performing the segue, we will prepare/check if the identifier is the same
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetails" {
            // cast the destination as SecondViewController
            let secondVC = segue.destination as! DetailsViewController
            //set 2ndVC name to above
            secondVC.wonderNum = selectedWonder
            
        }
    }
}

