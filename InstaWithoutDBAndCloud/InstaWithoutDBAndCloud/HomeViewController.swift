//
//  HomeViewController.swift
//  InstaWithoutDBAndCloud
//
//  Created by Selina Liu on 4/20/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UploadImageProtocol {

    @IBOutlet weak var tblView: UITableView!
    
    var images : [UIImage]  = [UIImage]() //NOW its a blank array
    var locations = [String]()
    //aa: var imageTitle : [String] = [String]()
    var titles = [String]()
    
    var uploadImageVC : UIViewController?
    
    //homepage has to subscribe protocol for uploadImageVC in order to pass data
    override func viewDidLoad() {
        super.viewDidLoad()
//        uploadImageVC = navigationController?.tabBarController?.viewControllers?[1]
//        print(uploadImageVC?.title)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = titles[indexPath.row]
//        return cell
        print(indexPath.row)
        let cell = Bundle.main.loadNibNamed("HomeTableViewCell", owner: self)?.first as! HomeTableViewCell
        cell.imgContainer?.image = images[indexPath.row]
        cell.imgTitle?.text = titles[indexPath.row]
        cell.imgLocation?.text = locations[indexPath.row]
        return cell
    }
    
    //data passed from the second VC
    func uploadedImageDelegate(img: UIImage, locationImg: String, title: String) {
        images.append(img)
        locations.append(locationImg)
        titles.append(title)
        
        tblView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 400
        }
    

}
