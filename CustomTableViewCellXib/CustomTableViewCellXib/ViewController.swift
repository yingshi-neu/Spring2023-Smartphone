//
//  ViewController.swift
//  CustomTableViewCellXib
//
//  Created by Selina Liu on 2/21/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    //all images are downloaded from unsplash.com and are free unsplash use license.
    let imageNames = ["food0","food1","food2","food3","food4","food5","food6"]
    let imageTitles = ["Coffee cup","Strawberry mousse cake","Blueberry","Macaron","Fruit tarts","Pink donuts","Chocolate cream eclairs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //find the first xib file called TableViewCell anc cast it as table view cell
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        //calling UIImage to create images based on names provided in imageNames
        cell.imageContainer.image = UIImage(named: imageNames[indexPath.row])
        cell.lblImage.text = imageTitles[indexPath.row]
        
        return cell
    }
    

}

