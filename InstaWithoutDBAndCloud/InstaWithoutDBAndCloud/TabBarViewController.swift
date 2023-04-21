//
//  TabBarViewController.swift
//  InstaWithoutDBAndCloud
//
//  Created by Selina Liu on 4/21/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVC = viewControllers?[0] as! HomeViewController
        let uploadPicVC = viewControllers?[1] as! UploadImageViewController
        uploadPicVC.uploadProtocol = homeVC.self
    }
    
}
