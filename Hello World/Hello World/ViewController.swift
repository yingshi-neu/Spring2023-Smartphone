//
//  ViewController.swift
//  Hello World
//
//  Created by Selina Liu on 1/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelExample: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressMeAction(_ sender: UIButton) {
        print("Button was pressed")
        labelExample.text = "Hello World"
    }
    
}

